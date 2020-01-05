#require_relative './clipokedex/clipokedex.rb'
#require_relative './scraper.rb'
class Pokemon

    attr_accessor :name, :location, :number

    @@all = []

    def initialize(pokemon_hash)
        pokemon_hash.each do |attribute, value|
            self.send("#{attribute}=", value)
        end
        @@all << self
    end

    
    def self.create_from_list(pokemon_array)
        pokemon_array.each do |pokemon_hash|
            Pokemon.new(pokemon_hash)
        end
    end

    def add_pokemon_attributes(attributes_hash)
         attributes_hash.each do |attr, value|
             self.send("#{attr}=", value)
         end
         self
     end


    def self.all
        @@all
    end

end

=begin

bulbasaur = Pokemon.new
bulbasaur.name = "bulbasaur"
bulbasaur.location = "here"
bulbasaur.element_1 = "Grass"
bulbasaur.element_2 = "Poison"
bulbasaur.chance_of = "5%"
bulbasaur.bio = "lorem ipsum"
bulbasaur.number = "1"
# @@all << bulbasaur

=end

