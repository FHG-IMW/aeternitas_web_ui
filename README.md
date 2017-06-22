# Aeternitas WebUi
Æternitas WebUi is a monitoring tool for [Æternitas](https://github.com/FHG-IMW/aeternitas).
It allows you to keep track of polling activities and metrics like pollables and source growth, 
error rates and execution times.

![UI Screenshot](https://github.com/FHG-IMW/aeternitas_web_ui/blob/master/screenshot.png?raw=true)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'aeternitas_web_ui'
```

And mount the engine where ever you want in your rails application

```ruby
#config/routes.rb

mount Aeternitas::WebUi::Engine => '/aeternitas'
#...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and spec backed pull requests are welcome on GitHub at https://github.com/FHG-IMW/aeternitas_web_ui. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

