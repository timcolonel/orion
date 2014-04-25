module Orion
  class Socket
    attr_accessor :ws

    def initialize(ws)
      @ws = ws
    end

    def send_error(message)
      msg = {:error => true, :msg => message}.to_json
      @ws.send msg
    end

    def send_data(action, data)
      msg = {:action => action, :data => data}.to_json
      @ws.send msg
    end

    def handle_action(json)
      case json['action']
        when 'update_script_list'
          send_data('script_list_change', Orion::Engine::manager.scripts)
        else
          send_error 'Unknown action'
      end
    end
  end
end