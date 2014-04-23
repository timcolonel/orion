require 'singleton'
require 'json'

module Orion::Engine
  class ScriptManager
    include Singleton
    attr_accessor :scripts

    def init
      @scripts = []
      load
      #auto_start
    end

    def load
      puts
      json = JSON.parse(IO.read('data/scripts.json'))
      json['scripts'].each do |script_hash|
        scripts << Script.from_json(script_hash)
      end
    end

    def save
      File.open('./data/saves.json', 'w') do |f|
        f.write ({:scripts => scripts}.to_json)
      end
    end

    #Will start all the scripts with auto_start set to true
    def auto_start
      scripts.each do |script|
        script.start if script.auto_start
      end
    end

    alias_method :reload, :load
  end
end