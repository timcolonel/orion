Dir['./lib/orion/**/*.rb'].each {|file| require file}

module Orion

  def self.socket
    Orion::Socket::SocketManager.instance
  end
end