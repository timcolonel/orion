require 'sinatra/base'

module Orion
  class App< Sinatra::Base
    get '/' do

      'Home'
    end
  end
end