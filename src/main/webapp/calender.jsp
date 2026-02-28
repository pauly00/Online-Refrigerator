
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(document).ready(function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialDate: new Date(),
        editable: true,
        selectable: true,
        businessHours: true,
        dateClick: function(info) {
            var url = "calender_read.jsp?date=" + info.dateStr;
            window.location.href = url;
        },
        dayMaxEvents: true,
        events: function(fetchInfo, successCallback, failureCallback) {
            $.ajax({
                url: 'side.jsp',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    var events = response.map(function(data) {
                        return {
                            title: data.day_total,
                            start: '2023' + '-' + data.month + '-' + data.day
                        };
                    });
                    successCallback(events);
                },
                error: function() {
                    failureCallback();
                }
            });
        }
    });
    calendar.render();
});

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>