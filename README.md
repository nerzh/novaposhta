# Novaposhta

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/novaposhta`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'novaposhta'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install novaposhta

## Usage
## config/aplication.rb
```ruby
  Novaposhta.configure do |config|
    config.url     = 'https://api.novaposhta.ua/v2.0/{format}/'
    config.format  = :json # or :xml
    config.api_key = '...'
  end
```
## methods
```ruby
    # города
    Novaposhta::Address.get_cities # => hash

    # поиск города
    Novaposhta::Address.find_city('name') # => hash

    # населенные пункты
    Novaposhta::Address.get_settlements # => hash

    # области
    Novaposhta::Address.get_areas # => hash

    # отделения и типы компании
    Novaposhta::Address.get_warehouses # => hash

    # улицы
    Novaposhta::Address.get_street('city_ref') # => hash

    # поиск улицы
    Novaposhta::Address.find_street('city_ref', 'name') # => hash
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

