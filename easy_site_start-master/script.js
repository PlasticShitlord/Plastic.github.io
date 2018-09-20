var h = document.getElementById('hour');
var m = document.getElementById('minute');
var s = document.getElementById('second');
setInterval(tic,1000);

function tic(){
var d=new Date();
var hours=23-d.getHours();
if (hours<10){
	hours="0"+hours;
}
var min=59-d.getMinutes();
if(min<10){
	min="0"+min;
}
var sec=59-d.getSeconds();
if(sec<10){
	sec="0"+sec;
	}
h.innerHTML="13:";
m.innerHTML="13:";
s.innerHTML="13";
}
