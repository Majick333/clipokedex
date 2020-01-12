#require_relative './lib/clipokedecells/clipokedecells.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './pokemon.rb'

#pokemon = {}

class Scraper
  attr_accessor :number, :name, :location

@@all =[]


#def self.scrape_table

 url = 'https://www.thonky.com/pokemon-lets-go/list-of-pokemon-locations'
 html = open(url)
 doc = Nokogiri::HTML(html)
 table = doc.css('table')
 pokemon = []

  #search table for each row
    table.search('tr').each do |row|
      
      
    #each row makes a new pokemon
      
     cells = row.search('td') #each pokemon has 3 cells of data
                  
        pokemon_number =  cells[0].to_s.delete("<td>").delete("/"),
        pokemon_name = cells[1].to_s.downcase.delete("<td>").delete("/"),
        pokemon_location =  cells[2].to_s.delete("<td>").delete_prefix(" colspan=\"2").delete("/") 
        
        pokemon << {:number => pokemon_number, :name => pokemon_name, :location => pokemon_location }  
      end

      puts "enter"
      input = gets.strip.downcase
      if pokemon[:name].to_s == input
             puts "you win"
      
      else
        puts "dammit"
      end
    end
  
  



 # end