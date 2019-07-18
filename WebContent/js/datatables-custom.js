function overdueModal(modal, result) {
	
}//end of overdueModal

function reservationModal(modal, result) {
	$('.calendar').pignoseCalendar({
    	lang: 'ko',
    	theme: 'blue',
    	multiple: true,
		init: function(context){
	          $(this).pignoseCalendar('set', result.start_day+'~'+result.end_day);
	    }
    });//end of pignoseCalendar
	
	//날짜는 클릭 못하게 여기서는 보여주는것만 하는거
	$('.pignose-calendar-body').addClass('clickX');
	
	modal.find('.num').text(result.num);
	modal.find('.res_day').text(result.res_day);
	modal.find('.start_day').text(result.start_day);
	modal.find('.end_day').text(result.end_day);
	modal.find('.payment').text(result.payment);
	modal.find('.name').text(result.name);
	modal.find('.phone').text(result.phone);
	modal.find('.email').text(result.email);
	modal.find('.postCode').text(result.postCode);
	modal.find('.addr').text(result.roadAddr + " " + result.detailAddr);
}//end of reservationModal

function itemsModal(modal,result) {
	
}//end of itemsModal

function closedModal(modal,result) {
	
}//end of closedModal

function MemberModal(modal,result) {
	
}//end of memberModal

$(document).ready(function() {
// Call the dataTables jQuery plugin
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
	  var primary = tr.data('primary'); //data-primary
	  console.log(primary);
	  var allData = { 'cate':cate, 'primary' : primary };
	  var modal = $(this);
	  
	  $.ajax({
			type : 'POST',
			url : "../ad/modal_data",
			data : allData,
			dataType: 'text',
			success : function(r) {
				$('#result').val(r);
				$('#path').val(window.location.pathname+window.location.search);
				var result = JSON.parse(r);
				if(cate=='overdue') overdueModal(modal, result);
				else if(cate=='예약') reservationModal(modal, result);
				else if(cate=='보관') itemsModal(modal, result);
				else if(cate=='완료') closedModal(modal, result);
				else if(cate=='member') MemberModal(modal,result);
			}
		});//end of ajax

	});//모달 나타났을때...
  
  $('#detailModal').on('hide.bs.modal', function (event) {
	  $('#dataTable tbody tr.selected').removeClass('selected');
	});//모달 없어졌을 때..
  
  $('.extend').on('click', function() {
	var nearForm = $(this).closest('form');
	nearForm.attr("action", "../ad/extend_reserv");
	nearForm.submit();
  });//end of extend on click
});//end of onload
