module Orion
  module Socket
    class Action
      @@actions = {}

      def get(action, &block)
        @@actions[action] ||= []
        @@actions[action] << block
      end

      def delegate(action)
        @@actions[action].each do |block|
          block.call
        end
      end
    end
  end
end