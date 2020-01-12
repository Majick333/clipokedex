require_relative './scraper.rb'
require 'nokogiri'

class CLI

    attr_accessor :name

    def run
        Scraper.new
        Scraper.search_by_name
        Scraper.another?
    end
  end