<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Colin Winn. Creative Director &amp; Writer</title>
<link rel="stylesheet" type="text/css" href="shadowbox.css">
<script type="text/javascript" src="shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init();
</script>
<style type="text/css">
body { background-color:#000000;text-align: center; margin: 5em 0 0 0; vertical-align: middle; color:#999; font-family:Arial, Helvetica, sans-serif; font-size:12px;}
#content { position: relative; width: 870px; text-align: center; margin: 0 auto;}
#content2 { position:relative; height:680px; width: 570px; text-align: left; margin: 0 auto }
#content3 { position:relative; height:380px; width: 570px; text-align: left; margin: 0 auto }
#content4 { position:relative; height:530px; width: 570px; text-align: left; margin: 0 auto }
#content5 { position:relative; height:380px; width: 570px; text-align: left; margin: 0 auto }
#content6 { position:relative; height:380px; width: 570px; text-align: left; margin: 0 auto }
#content7 { position:relative; height:100px; width: 570px; text-align: center; margin: 0 auto }

.gradient{
	background-image:url(grad.png);
	width:870px;
	height:230px;}
	#sign {
			background-image:url(colsig.png);
	width:335px;
	height:150px;
	float:left;
	margin-left:267px;}
	#line{
		background-color:#333;
		width:570px;
		height:1px;
		
	}
	#label1{
		background-image:url(label_tv.png);
	width:141px;
	height:31px;
	
	}
	#label2{
		background-image:url(label_media.png);
	width:194px;
	height:31px;
	
	}
	#label3{
		background-image:url(label_print.png);
	width:76px;
	height:31px;
	
	}
	#label4{
		background-image:url(label_radio.png);
	width:76px;
	height:31px;
	
	}
	
	#label5{
	background-image:url(label_cd.png);
	width:210px;
	height:31px;
	
	}
	
	#links {
		text-align:center;
		width:570px;
		height:auto;
		padding-top:10px;
		color:#999;
	
	}
</style>
<style type="text/css">
<!--
a:link {color: #999;}
a:visited {color: #999;}
a:active {color: #999;}
a:hover {color: #666;}
a { font-family:Arial, Helvetica, sans-serif;
font-size:12px;
	text-decoration: none;
border:0;}
img
{  border-style: none;
border:0
}
-->
</style>
</head>

<body>
<div id="content">
	<div id="sign"></div>
    <div class="gradient"></div>
    
    	<div id="content2">
        	<div id="line"></div>
            <div id="label1"></div>
 
            
			
<?php
for ($x=0; $x<16; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+30).'px"><a href="tv/'. $x .'.mp4" rel="shadowbox; player=flv; width=640px; height=480px"><img src="thumbs_tv/'.$x.'.png"/></a></div>';
}
?>
        </div>
        
        <div id="content3">
        	<div id="line"></div>
            <div id="label2"></div>
 
            
			
<?php
for ($x=0; $x<4; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+30).'px"><a title="May take a moment to load" href="nt1/'. $x .'.mp4" rel="shadowbox; player=flv; width=640px; height=480px"><img src="thumbs_other1/'.$x.'.png"/></a></div>';
}
?>
<?php
for ($x=0; $x<4; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+180).'px"><a href="nt2/'. $x .'.png" rel="shadowbox"><img src="thumbs_other2/'.$x.'.png"/></a></div>';
}
?>
        </div>
        
         <div id="content4">
        	<div id="line"></div>
            <div id="label3"></div>
 
            
			
<?php
for ($x=0; $x<12; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+30).'px"><a href="print/'. $x .'.png" rel="shadowbox"><img src="thumbs_print/'.$x.'.png"/></a></div>';
}
?>
        </div>
        
            <div id="content5">
        	<div id="line"></div>
            <div id="label4"></div>
 
            
			
<?php
for ($x=0; $x<8; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+30).'px"><a href="radio/'. $x .'.mp3" rel="shadowbox; player=flv; width=640px; height=0px"><img src="thumbs_radio/'.$x.'.png"/></a></div>';
}
?>
        </div>
        
        <div id="content6">
        	<div id="line"></div>
            <div id="label5"></div>
 
            
			
<?php
for ($x=0; $x<4; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+30).'px"><a title="May take a moment to load" href="cd1/'. $x .'.mp4" rel="shadowbox; player=flv; width=640px; height=480px"><img src="thumbs_cd1/'.$x.'.png"/></a></div>';
}
?>
<?php
for ($x=0; $x<4; $x++)
{
	$i=floor($x/4);

  echo '<div style="margin-left:'.($x*150-$i*570-$i*30).'px; position:absolute; margin-top:'.($i*150+180).'px"><a href="cd2/'. $x .'.png" rel="shadowbox"><img src="thumbs_cd2/'.$x.'.png"/></a></div>';
}
?>
        </div>
        
         <div id="content7">
        	<div id="line"></div>
            <div id="links"></div>
<a href="resume.pdf" target="_blank">RESUME</a> | <a href="awards.pdf" target="_blank">AWARDS</a> | <a href="mailto:cwinn@rogers.com">CONTACT</a>
            
        </div>
        
</div>

</body>
</html>
