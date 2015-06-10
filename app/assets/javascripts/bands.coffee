#$ ->
#  return $('table#bands').dataTable({
#    processing: true,
#    serverSide: true,
#    ajax: $('table#bands').data('source'),
#    displayLength: 25,
#    columns: [
#      {data: '0' },
#      {data: '1' },
#      {data: '2' }
#    ]
#  });
