require 'secure_random'

module Orion
	class Observable

		attr_accessor :subscribers

		def initialize
			@subscribers = {}
		end

		def on(action)
			id = SecureRandom.uuid
		end

		def unregister(id)

		end

		def broadcast(action, *args)

		end
	end
end