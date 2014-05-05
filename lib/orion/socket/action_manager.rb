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

        def delegate(socket, action, data)
          @actions[action].each do |block|
            socket.instance_eval(block)
          end
        end
      end
    end
  end
end