require 'secure_random'

module Orion
	class Observable

		attr_accessor :subscribers

		def initialize
			@subscribers = {}
		end

		def on(action, &block)
			id = SecureRandom.uuid
			@subscribers[id] = block
			id
		end

		def unregister(id)
			@subscribers.delete(id)
		end

		def broadcast(action, *args)
			@subscribers.each do |_,subscriber|
				yield subscriber
			end
		end
	end
end