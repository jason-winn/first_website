<?php
 $to = "jason.winn1@gmail.com";
 $subject = $_POST["category"];
 $body = $_POST["choice"];
 if (mail($to, $subject, $body)) {
   echo("<p>Message successfully sent!</p>");
  } else {
   echo("<p>Message delivery failed...</p>");
  }
 ?>