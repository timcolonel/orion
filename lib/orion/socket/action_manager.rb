require_relative 'controller'
require_relative 'main_controller'

module Orion
  module Socket
    module ActionManager
      class << self
        attr_accessor actions

        @actions = {}

        def route(action, &block)
          @actions[action] ||= []
          @actions[action] << block
        end

        def delegate(socket, action, params)
          @actions[action].each do |block|
            socket.instance_eval(block)
          end
        end
      end
    end
  end
end