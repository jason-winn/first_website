<?php

$username="jasonwinn";
$password="hlogin";
$database="czyz";
$callsign=$_POST['callsign'];
$dest=$_POST['dest'];
$altitude=$_POST['altitude'];
$type=$_POST['type'];
$vatid=$_POST['vatid'];
$tot=$_POST['tot'];

mysql_connect('jasonwinn.fatcowmysql.com',$username,$password);
@mysql_select_db($database) or die( "Unable to select database");

if(mysql_num_rows(mysql_query("SELECT vatid FROM bookings WHERE vatid = '$vatid'"))){
echo "ID already exists in database.";
}
else if (isset($_POST['callsign'])) {

$query = "INSERT INTO bookings VALUES ('','$callsign','$dest','$altitude','$type','$vatid','$tot')";
mysql_query($query);

echo "Data Inserted!<br />";
}

$query1="SELECT * FROM bookings";
$result=mysql_query($query1);

$num=mysql_numrows($result);

mysql_close();

echo "<b><center>Database Output</center></b><br><br>";

$i=0;
while ($i < $num) {

$callsignf=mysql_result($result,$i,"callsign");
$destf=mysql_result($result,$i,"dest");
$altitudef=mysql_result($result,$i,"altitude");
$typef=mysql_result($result,$i,"type");
$vatidf=mysql_result($result,$i,"vatid");
$totf=mysql_result($result,$i,"tot");

echo "<b>$callsignf</b><br>$destf<br>FL$altitudef<br>$typef<br>$vatidf<br>$totf<br><hr><br>";

$i++;
}
?>