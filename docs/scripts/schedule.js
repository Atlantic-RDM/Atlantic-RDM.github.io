<script>
$(document).ready(function () {
    Date.prototype.addHours= function(h){
        var newDate = new Date(this.getTime());
        newDate.setHours(newDate.getHours()+h);
    return newDate;
    }

    Date.prototype.addMinutes= function(m){
        var newDate = new Date(this.getTime());
        newDate.setMinutes(newDate.getMinutes()+m);
    return newDate;
    }

    var tz = new Date('May 12, 2025 6:30 AM UTC')
    document.getElementById("timezone").innerHTML = Intl.DateTimeFormat().resolvedOptions().timeZone;

    var ct = new Date()
    document.getElementById("current-time").innerHTML = ct.toLocaleDateString([], {hour: '2-digit', minute: '2-digit', hour12: false});

    var date1 = new Date('May 12, 2025 6:30 AM UTC');
    var date1string = date1.toLocaleDateString();
    var day1start = date1.addHours(9);
    
    for (let i = 0; i <= 20; i++) {
        time = day1start.addMinutes(15 * i);
        document.getElementById("slot-"+ i).innerHTML = time.toLocaleString([], {hour: '2-digit', minute: '2-digit', timeZoneName: 'short', hour12: false});
    }
});
</script>