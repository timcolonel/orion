module Orion
  module Socket
    class Action
      actions = {}
      def get(action, &block)
        actions[action] ||=
        actions[action] =
      end

      def delegate(action)
        actions
      end
    end
  end
end