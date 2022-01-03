# ChaoticOrder

Chaotic Order helps you detect queries that are missing an order.

Sometimes we forget to add an order to our queries, or we don't add it because we assume that by default they will be returned ordered by `id`, but that is not guaranteed by the DBMS. By forcing a randomic order to the unordered queries, we can help you detect them more easily.

This gem can be useful helping detect intermittent tests failures that otherwise are hard to replicate.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'chaotic_order'
end
```

Note that this gem is not recommended to be used in production.

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install chaotic_order

## Usage

By default the gem is turned off, and there are two ways to turn it on:
1. By setting an environment variable `CHAOTIC_ORDER=true`
1. By calling `ChaoticOrder::Config.enable!` in a initializer

In either option, make sure that you are only enabling it in development and/or test environments, depending on your needs.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem into your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/santib/chaotic_order. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/santib/chaotic_order/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChaoticOrder project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/santib/chaotic_order/blob/master/CODE_OF_CONDUCT.md).
