# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  allow do
    # origins 'localhost:3000', '127.0.0.1:3000', 'localhost:4000', '127.0.0.1:4000',
    #         /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
    #         # regular expressions can be used here
    #
    # resource '/file/list_all/', :headers => :any
    # resource '/file/at/*',

    origins 'http://localhost:3000'
    resource '*',
        methods: [:get, :post, :delete, :put, :patch, :options, :head],
        headers: :any
        # expose: ['Some-Custom-Response-Header'],
        # max_age: 600
        # headers to expose
  end
end
