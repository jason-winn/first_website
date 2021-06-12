<?php
 $to = "jason.winn1@gmail.com";
 $subject = "Hi!";
 $body = "Hi,\n\n".$_POST["email"];
 if (mail($to, $subject, $body)) {
   echo("<p>Message successfully sent!</p>");
  } else {
   echo("<p>Message delivery failed...</p>");
  }
 ?>