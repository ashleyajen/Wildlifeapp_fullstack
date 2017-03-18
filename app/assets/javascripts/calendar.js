$(document).ready(function() {
   $("#calendar").fullCalendar({
     events: "/sightings/get_events",
     timeFormat: "LT",
     editable: true,
     droppable: true,
     eventDrop: function(event, delta, revertFunc) {
            alert(event.title + " was dropped on " + event.start.format());
            event.start = event.start.format()
            // we need update someJSON w/out a hard refresh
            // send the object back to the database via
          },
     drop: function() {
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
      },
    //  ^^this gives the event drag and drop ability
     eventClick: function(event) {
      if (event.url) {
          window.open(event.url);
          return false;
      }
    },
    header :{
    left:   'title',
    center: '',
    right:  'today agendaDay agendaWeek month prevYear,prev,next,nextYear'
  },
    eventColor: '#FFFFFF'
  });
});
