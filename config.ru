require 'bundler'
Bundler.require(:default)
require './lib/orion'

#Init engine
Orion::Engine::manager.init
#Run server
run Orion::App