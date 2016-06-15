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

#### replace

You can use [`ruboty-replace`](https://github.com/r7kamura/ruboty-replace) to use shortcut commands.

Register

```
@ruboty: replace thx @?([^ 　:]+) with @ruboty  @\1 ++
```

Use

```
thx @name (you can write message here)
```

### list

```
@ruboty list karma
```

@ruboty will show you list of members' karma.

If you don't intend to mention others, you can list with `-q` or `--quiet`.

```
@ruboty list karma -q (or @ruboty list karma --quiet)
```

Names on the list will be separated with space and it won't disturb anyone.  

```
# not-quiet
hkdnet : 1
# quiet
h k d n e t : 1
```

It doesn't look smart, but you may need this.

If you want list to be always quiet, you can use [`ruboty-replace`](https://github.com/r7kamura/ruboty-replace).

Register

```
@ruboty: replace list karma with list karma -q
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hkdnet/ruboty-karma. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
