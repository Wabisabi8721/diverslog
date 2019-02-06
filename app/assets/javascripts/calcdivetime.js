/* global $ */

function calctime () {
    var diveinstr = $("#log_dove_in_at").val();
    var diveoutstr = $("#log_dove_out_at").val();
    
    if (diveinstr.match(/\d*:\d*/) == null || diveoutstr.match(/\d*:\d*/) == null) {

      //alert("時間入力が未確定です");
      return;
    }
    
    var diveinarray = diveinstr.split(':');
    var diveoutarray = diveoutstr.split(':');
    var diveinhour = parseFloat(diveinarray[0]);
    var diveinmin = parseFloat(diveinarray[1]);
    var diveouthour = parseFloat(diveoutarray[0]);
    var diveoutmin = parseFloat(diveoutarray[1]);
    
    var divecalc = (diveouthour * 60 + diveoutmin) - (diveinhour * 60 + diveinmin);
    
    var divecalc_hour = Math.floor(divecalc / 60);
    var divecalc_min = divecalc % 60;
    
    $("#diveresult").html(('00' + divecalc_hour).slice(-2) + ":" + ('00' + divecalc_min).slice(-2));
    $("#log_dove_time").val(('00' + divecalc_hour).slice(-2) + ":" + ('00' + divecalc_min).slice(-2));
    
}


$(document).ready(function() {
  
  $("#calc_time").click(function() {
    
   calctime();
   return false;
  });
  
  $("#log_dove_out_at").keyup(function() {
     calctime();
     return true;
  });
  
});