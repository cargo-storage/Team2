// Call the dataTables jQuery plugin
function overdueModal(result) {
	
}//end of overdueModal

function reservationModal(result) {
	
}//end of reservationModal

function itemsModal(result) {
	
}//end of itemsModal

function closedModal() {
	
}//end of closedModal

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
  } );//table tr 클릭시 강조
  
  $('#detailModal').on('show.bs.modal', function (event) {
	  var tr = $(event.relatedTarget); //modal 열게한 tr
	  var cate = tr.data('cate'); //data-cate 값 뽑아오기
	  var house = tr.data('house'); //data-house 값 뽑아오기
	  var email = tr.data('email'); //data-email 값 뽑아오기
	  var allData = { 'cate':cate, 'house':house, 'email':email };
	  var modal = $(this);
	  
	  $.ajax({
			type : 'POST',
			url : "../ad/modal_data",
			data : allData,
			dataType: 'text',
			success : function(r) {
				var result = JSON.parse(r);
				if(cate=='overdue') overdueModal(result);
				if(cate=='reservation') reservationModal(result);
				if(cate=='items') itemsModal(result);
				if(cate=='closed') closedModal(result);
			}
		});//end of ajax

	});//모달 나타났을때...
  
  $('#detailModal').on('hide.bs.modal', function (event) {
	  alert('꺼어어어짐');
	  $('#dataTable tbody tr.selected').removeClass('selected');
	});//모달 없어졌을 때..
});//end of onload
