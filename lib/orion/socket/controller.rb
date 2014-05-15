require_relative 'action_manager'

module Orion
  module Socket
    class Controller
      def self.get(action, &block)
        Orion::Socket::ActionManager.route(action, &block)
      end
    end
  end
end