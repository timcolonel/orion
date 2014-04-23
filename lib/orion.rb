require_relative 'orion/app'
require_relative 'orion/engine'
require_relative 'orion/socket'
require_relative 'orion/engine/script'
require_relative 'orion/engine/script_manager'

module Orion

  def self.socket
    Orion::Socket.instance
  end
end