# FileManipulator

`FileManipulator` can split a text formatted file and merge them to one file (merge is TODO (#4) now).

[![Build Status](https://travis-ci.org/gipcompany/file_manipulator.svg?branch=master_issue_3)](https://travis-ci.org/gipcompany/file_manipulator)
[![Gem Version](https://badge.fury.io/rb/file_manipulator.svg)](https://badge.fury.io/rb/file_manipulator)
[![Code Climate](https://codeclimate.com/github/gipcompany/file_manipulator/badges/gpa.svg)](https://codeclimate.com/github/gipcompany/file_manipulator)
[![Test Coverage](https://codeclimate.com/github/gipcompany/file_manipulator/badges/coverage.svg)](https://codeclimate.com/github/gipcompany/file_manipulator/coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'file_manipulator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_manipulator

## Usage


```ruby
require 'file_manipulator'

FileManipulator.configure do |config|
  config.prefix = 'file_manipulator'
  config.file_name = 'Gemfile'
  config.output_directory = 'tmp'
  config.size = 1
end

FileManipulator.split

Dir.entries('tmp')
#=> [".", "..", "file_manipulator_Gemfile_0000", "file_manipulator_Gemfile_0001", "file_manipulator_Gemfile_0002", "file_manipulator_Gemfile_0003"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gipcompany/file_manipulator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
