module Orion::Engine
  class Script
    attr_accessor :id
    attr_accessor :name
    attr_accessor :command
    attr_accessor :working_dir
    attr_accessor :auto_start

    def initialize
      @id = SecureRandom.uuid
      @name = ''
      @command = ''
      @working_dir = ''
      @auto_start = false
    end

    def start
      @process = ChildProcess.build('cmd', "/C #{command}")
      @process.io.stdout = File.new('output.txt', 'w')

      if @working_dir.nil?
        @process.cwd = Dir.pwd
      else
        @process.cwd = @working_dir
      end
      @process.leader = true
      @process.start
    end

    def stop
      unless @process.nil? or @process.exited?
        @process.stop
      end
    end

    def self.from_json(hash)
      script = Orion::Engine::Script.new
      script.id = hash['id']
      script.name = hash['name']
      script.command = hash['command']
      script.working_dir = hash['working_dir']
      script.auto_start = hash['auto_start']
      script
    end

    def to_json
      {:id => id, :name => @name, :command => @command, :working_dir => @working_dir, :auto_start => @auto_start}.to_json
    end
  end
end