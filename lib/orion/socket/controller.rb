module Orion
  module Socket
    class Controller

      def get(action, &block)
        Orion::Socket::ActionManager.route(action, &block)
      end
    end
  end
end