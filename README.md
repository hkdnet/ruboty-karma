# Ruboty::Karma

A plugin for Ruboty which manage members' karma.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-karma'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-karma

## Usage

### increase

```
@ruboty @name ++
```

@ruboty will increase @name's karma.

If you want to make @ruboty to say other response, you can use RUBOTY_KARMA_ADD.
ex

```
export RUBOTY_KARMA_ADD=%s got %d karma total! Awesome!
```

### list

```
@ruboty list karma
```

@ruboty will show you list of members' karma.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hkdnet/ruboty-karma. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
