Server Log Parser
=======

Server Log Parser is a server log formatter which allows you to group log by column
and outputs list of webpages with most page views ordered from most pages views to less page views and list of webpages with most unique page views
-----------

## Dependencies

```rb
gem 'rspec'
gem 'rubocop', '~> 0.89.1', require: false
```

## Documentation

### group by first column
./parser.rb log/webserver.log

### group by column number 1 (eq second column)
./parser.rb log/webserver.log 1