module Orion
  module Socket
    class MainController < Orion::Socket::Controller

      get 'update_script_list' do
        send_data('update_script_list', Orion::Engine.manager.scripts)
      end

      get 'start_script' do |params|
        script = Orion::Engine.manager.find(params[:script_id])
        if script.nil?
          send_error('Script not found')
        else
          script.start
        end
      end

      get 'start_script' do |params|
        script = Orion::Engine.manager.find(params[:script_id])
        if script.nil?
          send_error('Script not found')
        else
          script.stop
        end
      end
    end
  end
end