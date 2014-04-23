fs = require('fs')
eco = require('eco')

$(document).ready () ->
  update_script_list(['script1', 'script2'])

  $(document).on 'click', '.script_list .script_item', () ->
    item = $(this)
    list = item.closest('.script_list')
    active_item = list.find('.script_item.active')
    active_item.removeClass('active')
    item.addClass('active')


host = "ws://localhost:3001";

socket = new WebSocket(host);
console.log("Socket State: " + socket.readyState);

socket.onopen = () ->
  console.log("Socket Status: " + socket.readyState + " (open)")

socket.onclose = () ->
  console.log("Socket Status: " + socket.readyState + " (closed)")

socket.onmessage = (msg) ->
  console.log("Received: " + msg.data)

render_ejs = (filename, options) ->
  contents = fs.readFileSync(filename, 'utf-8')
  eco.render(contents, options)


update_script_list = (scripts) ->
  options = {
    scripts: scripts
  }
  list = $(document).find('.script_list .script_items')
  list.html(render_ejs('views/script_list.html.eco', options))

