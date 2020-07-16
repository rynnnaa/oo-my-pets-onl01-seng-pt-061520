require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs
  
  @@all = []
  

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end
  
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
  
  def walk_dogs
    self.dogs.each do |dog| 
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    self.dogs.each do |dog|
      self.dogs.delete(dog)
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      self.cats.delete(cat)
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  
  def list_pets
    dog = self.dogs.count
    cat = self.cats.count

   "I have #{dog} dog(s), and #{cat} cat(s)."
  end
end