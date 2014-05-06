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
  end
end