# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  return $('table#concerts').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('table#concerts').data('source'),
    deferRender: true,
    displayLength: 10,
    columns: [
      {data: '0' },
      {data: '1' },
      {data: '2' },
      {data: '3' },
      {data: '4' },
      {data: '5' },
      {data: '6' },
      {data: '7' },
      {data: '8' },
      {data: '9' },
      {data: '10'},
      {data: '11'},
      {data: '12'}

    ],
    columnDefs: [
      { targets: 0, visible: false },
      { targets: 10, orderable: false},
      { targets: 11, orderable: false},
      { targets: 12, visible: false}
    ],
    drawCallback: (settings) ->
      # tooltips
      $('i.icon').popover 'trigger': 'hover'
      api = @api()
      rows = api.rows(page: 'current').nodes()
      last = null
      api.column(12, page: 'current').data().each (group, i) ->
        if last != group
          $(rows).eq(i).before '<tr class="group"><td colspan="5">' + group + '</td></tr>'
          last = group
        return
      return
  });

  $('#concerts tbody').on 'click', 'tr.group', ->
  currentOrder = table.order()[0]
  if currentOrder[0] == 2 and currentOrder[1] == 'asc'
    table.order([
      12
      'desc'
    ]).draw()
  else
    table.order([
      12
      'asc'
    ]).draw()
  return

  return
