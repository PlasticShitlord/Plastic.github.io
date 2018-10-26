<?php
$mysqli=false;

function connectDB(){
	global $mysqli;
	$mysqli=new mysqli("localhost","root","2104","lombard");
	$mysqli->query("SET NAME 'utf8'");
}

function closeDB(){
	global $mysqli;
	$mysqli->close();
}
	
function getФизлицаКодКлиента() {
	global $mysqli;
	connectDB();
	$res=$mysqli->query("SELECT * From физлица where КодКлиента=1");
	closeDB();
	return $res->fetch_assoc();
	}
?>