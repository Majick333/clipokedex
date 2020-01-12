#require_relative './lib/clipokedecells/clipokedecells.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './pokemon.rb'

#pokemon = {}

class Scraper
  attr_accessor :number, :name, :location

@@all =[]

def initialize (number,name,location)
  @number = number,
  @name = name,
  @location = location
end

#def self.scrape_table

 url = 'https://www.thonky.com/pokemon-lets-go/list-of-pokemon-locations'
 html = open(url)
 doc = Nokogiri::HTML(html)
 table = doc.css('table')
 @pokemon = []

  #search table for each row
    table.search('tr').each do |row|
      
      #row.each do |creature|
        #creature = Pokemon.new  
        cells = row.search('td')
         #each pokemon has 3 cells of data  
         @pokemon <<         
          {:number =>  cells[0].to_s.delete("<td>").delete("/"),
          :name => cells[1].to_s.downcase.delete("<td>").delete("/"),
          :location =>  cells[2].to_s.delete("<td>").delete_prefix(" colspan=\"2").delete("/").delete_prefix("\"")
        }
        
        
      end
      puts @pokemon
      
    
    
    
 #def self.search_by_name
      puts " "
      puts " "
      puts "Welcome to CLI Pokedex"
      puts "Please Enter the name of the Pokemon you want to find"
      puts " "
      input = gets.strip.downcase
      if @pokemon.find{ |name| name[:name] == input}
             puts " "
             puts "It's Working"
             puts " "

              @pokemon.find{ |name| name[:name] == input}.each do |attr,val|
                puts("#{attr}=",val)
                puts " "

                
              end


      else
        puts "Sorry, Try Again"
      end
      
    end
    
      def self.another?
        puts "Would you like to try again? --Y/N--"
          input = gets.strip.downcase
          if input == "y"
            Scraper.new
          elsif input == "n"
              puts "Farewell!"
          else
            puts "Invalid Entry"
            another?
          end
            end

  



  #end