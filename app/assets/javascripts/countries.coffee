# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  return $('table#countries').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('table#countries').data('source'),
    displayLength: 25,
    columns: [
      {data: '0' },
      {data: '1' },
      {data: '2' },
      {data: '3' },
      {data: '4' },
      {data: '5' }
    ],
    columnDefs: [
      { targets: 0, visible: false },
      { targets: 4, orderable: false },
      { targets: 5, orderable: false},
      { targets: 4, width: "5%" },
      { targets: 5, width: "5%" }
    ]
  });
