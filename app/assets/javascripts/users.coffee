
$ ->
  return $('table#users').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('table#users').data('source'),
    displayLength: 25,
    columns: [
      {data: '0' },
      {data: '1' },
      {data: '2' }
    ],
    columnDefs: [
      { targets: 0, visible: false }      
    ]
  });
