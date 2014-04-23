fs = require('fs')
eco = require('eco')

connection = require('./../js/connection.coffee')

$(document).ready () ->
  connection.onScriptListChange (scripts) ->
    update_script_list(scripts)

  connection.updateScriptList()

  $(document).on 'click', '.script_list .script_item', () ->
    item = $(this)
    list = item.closest('.script_list')
    active_item = list.find('.script_item.active')
    active_item.removeClass('active')
    item.addClass('active')


render_ejs = (filename, options) ->
  contents = fs.readFileSync(filename, 'utf-8')
  eco.render(contents, options)


update_script_list = (scripts) ->
  options = {
    scripts: scripts
  }
  list = $(document).find('.script_list .script_items')
  list.html(render_ejs('views/script_list.html.eco', options))

