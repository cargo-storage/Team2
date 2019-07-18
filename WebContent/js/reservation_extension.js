var start_day = ${map.start_day};
$(document).ready(function() {
	$('#calendar').pignoseCalendar({
    	lang: 'ko',
    	theme: 'blue',
    	multiple: true,
		init: function(context){
//	          $(this).pignoseCalendar('set', '2019-04-01~2019-04-21');
	       },
       select: function(date, context) {
           /**
            * @params this Element
            * @params date moment[]
            * @params context PignoseCalendarContext
            * @returns void
            */

            // This is selected button Element.
            var $this = $(this);

            // You can get target element in `context` variable, This element is same `$(this)`.
            var $element = context.element;

            // You can also get calendar element, It is calendar view DOM.
            var $calendar = context.calendar;

            // Selected dates (start date, end date) is passed at first parameter, And this parameters are moment type.
            // If you unselected date, It will be `null`.
            console.log(date[0], date[1]);
            var end = date[0]._i
            $('#calendar').pignoseCalendar('set', start_day~+end);
       }
    	});//end of pignoseCalendar

});//end of onload
