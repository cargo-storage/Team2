// Call the dataTables jQuery plugin
$(document).ready(function() {
  var table = $('#dataTable').DataTable();
  
  $('#dataTable tbody').on( 'click', 'tr', function () {
      if ( $(this).hasClass('selected') ) {
          $(this).removeClass('selected');
      }
      else {
          table.$('tr.selected').removeClass('selected');
          $(this).addClass('selected');
      }
  } );
  
  $('#detailModal').on('show.bs.modal', function (event) {
	  var tr = $(event.relatedTarget); //modal 열게한 tr
	  var cate = tr.data('cate'); //data-cate 값 뽑아오기
	  var index = tr.data('index'); //data-index 값 뽑아오기
	  
	  var modal = $(this);
	  modal.find('.modal-title').text('New message to ' + index);
	});
});
