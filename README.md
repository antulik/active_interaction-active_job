# ActiveInteraction::ActiveJob

This gem adds [active_job](http://edgeguides.rubyonrails.org/active_job_basics.html) support to [active_interaction](https://github.com/orgsync/active_interaction) gem.

With this gem you no longer need to create a separate Job class for the each interaction, this gem does it automatically for you.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_interaction-active_job'
```

## Usage

```ruby
class Add < ActiveInteraction::Base
  include ActiveInteraction::ActiveJob::Core
  # This creates Add::Job class

  integer :x, :y

  def execute
    x + y
  end
end


Add.delay.run(x: 1, y: 2)
Add.async(x: 1, y: 2) # same as above

Add.delay(queue_name: 'fast', wait: 1.week).run(x: 1, y: 2)
```

## Advanced Usage

```ruby
class Add < ActiveInteraction::Base
  include ActiveInteraction::ActiveJob::Core

  # This class is created automatically, but you can provide your own
  class Job < ActionJob::Base
    include ActiveInteraction::ActiveJob::JobHelper

    queue_as 'default'
  end

  active_job do
    # this will be executed inside Job class

    # same as above
    # queue_as 'default'

    # any other active_job options here....
  end

  integer :x, :y

  def execute
    x + y
  end
end

class AddOrDivide < Add

  active_job do
    # Job class inheritance works
    queue_as 'slow'
  end

  boolean :divide

  def execute
    if divide
      x / y
    else
      super
    end
  end
end


AddOrDivide.delay.run(x: 4, y: 2, divide: true)
AddOrDivide.async(x: 4, y: 2, divide: true) # same as above

AddOrDivide.delay(queue_name: 'fast', wait: 1.week).run(x: 4, y: 2, divide: true)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_interaction-active_job. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

