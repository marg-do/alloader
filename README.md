# Alloader

Load or Require all files in the directory.

## Installation

Add this line to your application's Gemfile:

    gem 'alloader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alloader

## Usage

    require 'alloader'
    Alloader::require_all "/directory/path/containing/your/libs"

or

    require 'alloader'
    Alloader::load_all "/directory/path/containing/your/libs"

## Contributing

1. Fork it ( https://github.com/[my-github-username]/alloader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
