# Clipokedex

    This is my first project for Flatiron coding school.  I chose to make a command line interfaced pokedex for the Nintendo Switch's Let's Go Pickachu and Let's go Eevee series of games.  This pokedex will search all the pokemon included in those games by name and will return the relevant information on where to find your desired pokemon in the game.  Please note that the data will only provide locations of the orginal 151 pokemon from the first generation.  You may enter the names of the newer pokemon, however they will not be able to be found in the Let's Go series.  


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clipokedex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clipokedex

## Usage

Open up a terminal and run the bin/pokedex file.
Follow the prompt given by the terminal to search for
locations of Pokemon in the Let's Go series of Nintendo games.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
