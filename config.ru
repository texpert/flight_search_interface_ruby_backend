require 'rack/unreloader'
require 'oauth2'

UNRELOADER = Rack::Unreloader.new(:subclasses=>%w'Roda'){App}

require 'roda'

UNRELOADER.require './app.rb'
CLIENT = OAuth2::Client.new('client_id', 'client_secret', :site => 'http://node.locomote.com/')

run UNRELOADER
