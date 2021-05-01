# EnginePack

`EnginePack` is a gem to support including JavaScript packages in your Rails Engines.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'engine_pack'
```

And then execute:

    $ bundle install

Finally, run the generator:

    $ rails generate engine_pack:install

## Usage

It works by hooking into the JavaScript package managers preinstall hook via a Rake task. The Rake task copies the `files` specified in the `package.json` to a temporary directory and then install that directory as a local package.

### Configuration

```ruby
require 'engine_pack'

EnginePack.configure do |config|
  config.package_manager = :npm
  config.engines = %w[
      engine1
      engine2
  ]
end

```

#### Configuration Options

Option/Method | Description
--- | ---
`package_manager` | The package manager you are using with your application. Currently supports `:npm` and `:yarn`. (default: `:npm`)
`engine` | An array of the names of the gems/engines to include.

### Preinstall Hook

You'll need to add the `preinstall` script to your applications `package.json` in the `scripts` property.

```json
{
  "scripts": {
    "preinstall": "bundle exec rails engine_pack:preinstall"
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aaricpittman/engine-pack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/aaricpittman/engine-pack/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Webpacker::Engine project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aaricpittman/engine-pack/blob/master/CODE_OF_CONDUCT.md).
