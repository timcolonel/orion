host = "ws://localhost:4567/socket";

socket = new WebSocket(host);

event_listeners = {}

socket.onopen = () ->
  console.debug("Socket Status: " + socket.readyState + " (open)")
  send_json action: 'update_script_list'

socket.onclose = () ->
  console.debug("Socket Status: " + socket.readyState + " (closed)")

socket.onmessage = (msg) ->
  console.log("Received: " + msg.data)
  handleMessage(msg.data)

exports.updateScriptList = () ->
  #send_json action: 'update_script_list'

exports.onScriptListChange = (callback) ->
  exports.on 'update_script_list', callback

# Register event for the socket
# @param event: Event name
# @param callback: callback function
exports.on = (event, callback) ->
  event_listeners[event] ||= new Array()
  event_listeners[event].push(callback)

send_json = (json) ->
  socket.send JSON.stringify(json)


call_listeners = (event, args...) ->
  console.log('calling: ' + event)
  array = event_listeners[event]
  if array?
    for callback in array
      callback.apply(this, args)


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
