require_relative './scraper.rb'
require_relative './pokemon.rb'

class CLI

    attr_accessor :name

    def input
    input = gets.strip.downcase + "/"
    end


    def call
        Scraper.new
        puts "Pokedex for Let's Go Pickachu or Let's Go Evee"
        puts "Please enter the name of the pokemon you wish to know about:"
        search_pokemon
    end

    def search_pokemon

        if
        Scraper.all.any? == input
           puts Scraper.pokemon[0]
           puts Scraper.pokemon[1]
           puts Scraper.pokemon[2]
        else
            puts "Sorry Couldn't find that"
            know_more?
        end
    end

        def know_more?
            puts "Would you like to try another? Y/N?"
            if input == "y"
                call
            else input == "n"
                puts "Goodbye"
            end
        end  
    
end
