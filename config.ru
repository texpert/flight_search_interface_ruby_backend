# frozen_string_literal: true

require 'rack/unreloader'
require 'oauth2'

UNRELOADER = Rack::Unreloader.new(subclasses: %w[Roda]) { App }

require 'roda'

Roda.plugin :streaming

UNRELOADER.require './app.rb'
CLIENT = OAuth2::Client.new('client_id', 'client_secret', site: 'http://node.locomote.com/')

run UNRELOADER
