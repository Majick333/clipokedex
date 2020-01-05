#require_relative './lib/clipokedex/clipokedex.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
#require_relative './pokemon.rb'

#pokemon = {}

class Scraper
  attr_accessor :number, :name, :location
 
 url = 'https://www.thonky.com/pokemon-lets-go/list-of-pokemon-locations'
 html = open(url)
 doc = Nokogiri::HTML(html)
 table = doc.css('table')

@@all =[]
 

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

  table.search('tr').each do |tr|
   cells = tr.search('td')
    @pokemon =  {
      :number => cells[0].to_s.delete("<td>"),
      :name => cells[1].to_s.downcase.delete("<td>"),
      :location => cells[2].to_s.delete("<td>") }   
  

      #@pokemon.save
      @@all << @pokemon
  end
  
      
  puts @@all  

end

