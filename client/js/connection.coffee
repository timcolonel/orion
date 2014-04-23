host = "ws://localhost:3001";

socket = new WebSocket(host);

event_listeners = {}

socket.onopen = () ->
  console.log("Socket Status: " + socket.readyState + " (open)")
  send_json action: 'update_script_list'

socket.onclose = () ->
  console.log("Socket Status: " + socket.readyState + " (closed)")

socket.onmessage = (msg) ->
  console.log("Received: " + msg.data)

exports.updateScriptList = () ->
  call_listeners('script_list_change', ['script1', 'script1', 'script1', 'script1'])

exports.onScriptListChange = (callback) ->
  exports.on 'script_list_change', callback

exports.on = (event, callback) ->
  add_listener(event, callback)

send_json = (json) ->
  socket.send JSON.stringify(json)


add_listener = (event, callback) ->
  event_listeners[event] ||= new Array()
  event_listeners[event].push(callback)

call_listeners = (event) ->
  console.log('calling:')
  array = event_listeners[event]
  args = Array.prototype.slice.call(arguments, 0)
  if array?
    for callback in array
      callback.apply(this, args[1..-1])