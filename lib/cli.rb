require_relative './scraper.rb'
require_relative './pokemon.rb'
require 'nokogiri'

class CLI

    attr_accessor :name



    def run
        create_pokemon
        add_attributes_to_pokemon
        search_pokemon
      end
    
      def create_pokemon
        pokemon_array = Scraper.all
        Pokemon.create_from_list(pokemon_array)
      end
    
      def add_attributes_to_pokemon
        Pokemon.all.each do |pokemon|
          attributes = Scraper.scrape_table
          pokemon.add_pokemon_attributes(attributes)
        end
      end

      def search_pokemon

        
        
        puts "Please type the name of the pokemon you wish to know about"
        input = gets.strip.downcase

        Pokemon.all.find
      end

      def display_pokemon
        Pokemon.all.each do
        puts "#"
        end
        #puts Pokemon.name 
        #puts Pokemon.location
      end
      #self.run
    end
  