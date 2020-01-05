#require_relative './lib/clipokedex/clipokedex.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
#require_relative './pokemon.rb'

#pokemon = {}

class Scraper
  attr_accessor :number, :name, :location

@@all =[]
 
def self.all 
  @@all
end


def self.scrape_table

 url = 'https://www.thonky.com/pokemon-lets-go/list-of-pokemon-locations'
 html = open(url)
 doc = Nokogiri::HTML(html)
 table = doc.css('table')

  pokemon = []

    table.search('tr').each do |row|
     cells = row.search('td')
        pokemon_number = cells[0].to_s.delete("<td>").delete("/"),
        pokemon_name = cells[1].to_s.downcase.delete("<td>").delete("/"),
        pokemon_location = cells[2].to_s.delete("<td>").delete_prefix(" colspan=\"2").delete("/")
        pokemon << {number: pokemon_number, name: pokemon_name, location: pokemon_location }
        
    end
    pokemon
    @@all << pokemon
    #puts @@all
  end
end
 
#Scraper.scrape_table

      
    
    

    
    
  
  
  


















=begin




def initialize
  @pokemon = {}
  @number = number
  @name = name
  @location = location
  #@all = []
  save
end

 def self.pokemon
  @pokemon
 end

 def self.all
  @@all
 end

 def save
  @@all << self
 end

 




  def sort 
    @@all.each do |num, nam,
  
  
  def self.locate
    input = gets.strip.downcase + "/"

    pokemon_values = (@@all.each.map { |info|  [info[:number], info[:name], info[:location] ] } )
    ans = []

     search = pokemon_values[1].find { |x| x == input }
    puts pokemon_values

    
   
  end
      
  #puts @@all  
=end


