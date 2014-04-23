host = "ws://localhost:3001";

socket = new WebSocket(host);

socket.onopen = () ->
  console.log("Socket Status: " + socket.readyState + " (open)")
  send_json action: 'update_script_list'

socket.onclose = () ->
  console.log("Socket Status: " + socket.readyState + " (closed)")

socket.onmessage = (msg) ->
  console.log("Received: " + msg.data)

exports.onScriptListChange = (callback) ->
  callback(['script1', 'script2', 'script3'])


send_json = (json) ->
  socket.send JSON.stringify(json)