<head>
<script language="JavaScript" src="gen_validatorv31.js" type="text/javascript"></script>
</head>
<form action="testsql.php" method="post" name="myform">
Callsign: <input type="text" name="callsign" maxlength="7"><br>
Takeoff Time: <select name="tot">
<option value="1">1517z</option>
<option value="2">1632z</option>
<option value="3">0403z</option>
</select><br>
Destination Airport: <input type="text" name="dest" maxlength="4"><br>
Cruise Altitude: <select name="altitude">
<option value="1">FL180</option>
<option value="2">FL190</option>
<option value="3">FL200</option>
<option value="4">FL210</option>
<option value="5">FL220</option>
<option value="6">FL230</option>
<option value="7">FL240</option>
<option value="8">FL250</option>
<option value="9">FL260</option>
</select><br>
Aircraft Type: <input type="text" name="type"><br>
Vatsim ID: <input type="text" name="vatid" maxlength="7"><br>
<input type="Submit">
</form>

<script language="JavaScript" type="text/javascript">
 var frmvalidator = new Validator("myform");
 frmvalidator.addValidation("callsign","req","Please enter a valid callsign.");
  frmvalidator.addValidation("tot","req","Please enter a takeoff time.");
    frmvalidator.addValidation("tot","maxlen=4","Please enter a valid takeoff time.");
    frmvalidator.addValidation("dest","req","Please enter a destination airport.");
	    frmvalidator.addValidation("dest","maxlen=4","Please enter a valid destination airport.");
	  frmvalidator.addValidation("altitude","req","Please enter a three digit cruise altitude.");
	    frmvalidator.addValidation("altitude","maxlen=3","Please enter a three digit cruise altitude.");
	    frmvalidator.addValidation("type","req","Please enter an aircraft type.");
		  frmvalidator.addValidation("vatid","req","Please enter a proper Vatsim ID.");
</script>