#require_relative './lib/clipokedecells/clipokedecells.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
  attr_accessor :number, :name, :location

def initialize # (number,name,location)
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
      #search each row for data/cells
        cells = row.search('td')
         #each pokemon has 3 cells of data  
         #push hash onto array
         @pokemon <<        
          {:number =>  cells[0].to_s.delete("<td>").delete("/"),
          :name => cells[1].to_s.downcase.gsub("<td>", "").delete("/").delete_suffix("<td>"),
          :location =>  cells[2].to_s.gsub("</td>", "").slice(15..600)}
        
        
      end
      puts @pokemon[0..154]
      
    
    
    
 def self.search_by_name
      puts " "
      puts " "
      puts "Welcome to CLI Pokedex"
      puts "Find any Pokemon in Let's Go Pickachu or Let's Go Eevee"
      puts "Please Enter the name of the Pokemon you want to find"
      puts " "
      input = gets.strip.downcase
      if @pokemon.find{ |name| name[:name] == input}
             puts " "
             puts "It's Working"
             puts " "

              @pokemon.find{ |name| name[:name] == input}.each do |attr,val|
                puts("#{attr}=",val.upcase)
                puts " "
               end
      else
        puts "Sorry, Try Again"
        Scraper.another?
      end
      
    end
    
      def self.another?
        puts "Would you like to try another? --Y/N--"
          input = gets.strip.upcase
          if input == "Y"
            Scraper.new
            Scraper.search_by_name
          
          elsif input == "N"
              puts "Farewell!"
              begin
                exit!
              end
              
          else input != "Y" || "N"
            puts "Invalid Entry"
            Scraper.another?
            end
        end

    def self.pokemon
      @pokemon
    end
  end