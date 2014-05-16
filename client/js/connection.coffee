host = "ws://localhost:4567/socket";

socket = new WebSocket(host);

event_listeners = {}

socket.onopen = () ->
  console.log("Socket Status: " + socket.readyState + " (open)")
  send_json action: 'update_script_list'

socket.onclose = () ->
  console.log("Socket Status: " + socket.readyState + " (closed)")

socket.onmessage = (msg) ->
  console.log("Received: " + msg.data)
  handleMessage(msg.data)

exports.updateScriptList = () ->
  #send_json action: 'update_script_list'

exports.onScriptListChange = (callback) ->
  exports.on 'update_script_list', callback

exports.on = (event, callback) ->
  add_listener(event, callback)

send_json = (json) ->
  socket.send JSON.stringify(json)


add_listener = (event, callback) ->
  event_listeners[event] ||= new Array()
  event_listeners[event].push(callback)

call_listeners = (event) ->
  console.log('calling: ' + event)
  array = event_listeners[event]
  console.log(event_listeners)
  args = Array.prototype.slice.call(arguments, 0)
  if array?
    for callback in array
      callback.apply(this, args[1..-1])


handleMessage = (msg) ->
  json = JSON.parse(msg)
  if json['error']
    console.log('Error: ' + json['msg'])
  else if json['action']
    handleAction(json)


handleAction = (json) ->
  action = json['action']
  data = json['data']
  console.log('handle action: ' + action)
  console.log('data: ' + data)

  call_listeners(action, data)
