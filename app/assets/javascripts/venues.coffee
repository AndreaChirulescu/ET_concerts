
$ ->
  return $('table#venues').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('table#venues').data('source'),
    displayLength: 25,
    columns: [
      {data: '0' },
      {data: '1' },
      {data: '2' },
      {data: '3' },
      {data: '4' }
    ],
    columnDefs: [
      { targets: 0, visible: false },
      { targets: 3, orderable: false },
      { targets: 4, orderable: false},
      { targets: 3, width: "5%" },
      { targets: 4, width: "5%" }
    ]
  });
