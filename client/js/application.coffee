$(document).ready () ->
  $('.hello').html('BULLSHGIT')


host = "ws://localhost:3001";

socket = new WebSocket(host);
console.log("Socket State: " + socket.readyState);

socket.onopen =  () ->
  console.log("Socket Status: " + socket.readyState + " (open)")

socket.onclose = () ->
  console.log("Socket Status: " + socket.readyState + " (closed)")


socket.onmessage = (msg) ->
  console.log("Received: " + msg.data)


