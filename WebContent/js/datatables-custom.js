// Call the dataTables jQuery plugin
function overdueModal(modal, result) {
	
}//end of overdueModal

function reservationModal(modal, result) {
	modal.find('.start_day').text(result.start_day);
	modal.find('.end_day').text(result.end_day);
	modal.find('.name').text(result.name);
	modal.find('.phone').text(result.phone);
	modal.find('.email').text(result.email);
	
}//end of reservationModal

function itemsModal(modal,result) {
	
}//end of itemsModal

function closedModal(modal,result) {
	
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
  
  $('.modal').on('show.bs.modal', function (event) {
	  var tr = $(event.relatedTarget); //modal 열게한 tr
	  var cate = tr.data('cate'); //data-cate 값 뽑아오기
	  var house = tr.data('house'); //data-house 값 뽑아오기
	  var email = tr.data('email'); //data-email 값 뽑아오기
	  console.log(cate+house+email);
	  var allData = { 'cate':cate, 'house':house, 'email':email };
	  var modal = $(this);
	  
	  $.ajax({
			type : 'POST',
			url : "../ad/modal_data",
			data : allData,
			dataType: 'text',
			success : function(r) {
				var result = JSON.parse(r);
				if(cate=='overdue') overdueModal(modal, result);
				if(cate=='예약'){alert("?"); reservationModal(modal, result);}
				if(cate=='보관') itemsModal(modal, result);
				if(cate=='완료') closedModal(modal, result);
			}
		});//end of ajax

	});//모달 나타났을때...
  
  $('#detailModal').on('hide.bs.modal', function (event) {
	  $('#dataTable tbody tr.selected').removeClass('selected');
	});//모달 없어졌을 때..
});//end of onload
