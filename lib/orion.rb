require_relative 'orion/app'
require_relative 'orion/engine'
require_relative 'orion/socket/socket'
require_relative 'orion/engine/script'
require_relative 'orion/engine/script_manager'

module Orion

  def self.socket
    Orion::SocketManger.instance
  end
end