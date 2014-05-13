module Orion
  module Socket
    class MainController < Orion::Socket::Controller
      get 'update_script_list' do
        send_data('update_script_list', Orion::Engine.manager.scripts)
      end
    end
  end
end