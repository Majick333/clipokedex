require_relative './scraper.rb'
require_relative './pokemon.rb'

class CLI

    attr_accessor :name

    def input
    input = gets.strip.downcase + "/"
    end


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
        input = gets.strip.downcase + "/"
        if 
          Pokemon.name.include?(input) == true
          puts "Congrats"
        else
          puts "dammit Ryan"
        end
      end
    end