module Orion
	class Observable

		attr_accessor :subscribers

		def initialize
			@subscribers = {}
		end
		def on(action)
		
		end

		def broadcast(action, *args)

		end
	end
end