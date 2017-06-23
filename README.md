# A Flight Search backend test application

## Requirements

Ensure you have a Ruby interpreter installed. (Developed and tested with Ruby version 2.4.1)

Rubygems and bundler gem installed.

## Installing the application

### The quick automated way cloning from GitHub

Ensure you start a shell in a user accessible folder.

Run the start scriipt:

```
$ ./start.sh
```

The application will be cloned, installed and started with server listening on localhost:3000

### Manual install and running of the application
 
Check to see whether RubyGems is installed:

```
$ gem --version
2.6.10
```

If it is not installed, follow the instructions on [Rubygems download page](https://rubygems.org/pages/download/).

Then, check if bundler gem is installed:

```
$ gem list bundler

*** LOCAL GEMS ***

bundler (1.15.1, 1.14.6, 1.14.5, 1.14.3, 1.13.7)

```

Install bundler, if it is missing:

```
$ gem install bundler
```

Clone the git repository into a user accessible folder:

```
$ git clone https://github.com/texpert/flight_search.git
```

Navigate to application's root folder:

```
$ cd flight_search
```

Install application's bundle:

```
$ bundle install
```

### Running the application

Start the server:

```
$ puma -C config/puma.rb
```

After the server start, the backend could be accessed sending HTTP requests to http://localhost:3000

## Sample queries:

/airlines

```
$ curl "http://localhost:3000/airlines"
```

/airports

```
$ curl "http://localhost:3000/airports?q=Melbourne"
```

/search

```
curl "http://localhost:3000/search?from=Melbourne&to=Sydney&date=2018-09-02"
```
