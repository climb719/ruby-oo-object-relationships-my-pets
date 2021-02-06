require 'pry'
class Owner
  attr_accessor :cats, :dogs 
  attr_reader :name, :species #cannot chnage 

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all.clear # .clear clears/resets an array to empty 
  end

  def cats
    # returns a a collection of all the cats that belong to the owner
    Cat.all.select { |cat| cat.owner == self } # iterate through all Cats using >select to return array if block it true belongs to owner instance 
  end 

  def dogs
    # returns a a collection of all the dogs that belong to the owner
    Dog.all.select { |dog| dog.owner == self } # iterate through all the Dogs and if belog to self (owner instance) return it as part of collection (array)
  end

  def buy_cat(name)
    # can buy a cat that is an instance of the Cat class, expect owner to know about its cats
    Cat.new(name, self) # a new cat instance gets added to owner instance 
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" } # iterate through owner's dogs to make each one have a happy mood if walk-dog method called
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats # define pets - total of cats and dogs
    pets.each do |pet| # iterate trhough all pets 
      pet.mood = "nervous" #change pets to change mood to nervous 
      pet.owner = nil # leave the pets without an owner
    end
  end

  def list_pets
    # owner instance can list pets when method invoked and return test spec phrase
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end