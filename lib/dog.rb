class Dog
  attr_accessor :owner, :mood
  attr_reader :name # cannot change it's name 

  @@all = []
  
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self 
  end

  def self.all
    @@all
  end
end