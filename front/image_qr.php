<?php
include "../phpqrcode-master/qrlib.php";
header('Content-type: image/png');
if(!empty($_GET['user'])) {
    if(isset($_GET['user']) && !empty($_GET['user']) ? $user = $_GET['user'] : $user = "-") 
    if(isset($_GET['url']) && !empty($_GET['url']) ? $url = $_GET['url'] : $url = "-")
    if(isset($_GET['cpu']) && trim($_GET['cpu']) != "" ? $cpu = $_GET['cpu'] : $cpu = "-")
    if(isset($_GET['mb']) && trim($_GET['mb']) != "" ? $mb = $_GET['mb'] : $mb = "-")
    if(isset($_GET['mem']) && trim($_GET['mem']) != "" ? $mem = $_GET['mem'] : $mem = "-")
    if(isset($_GET['hdd']) && trim($_GET['hdd']) != "" ? $hdd = $_GET['hdd'] : $hdd = "-")
    if(isset($_GET['os']) && trim($_GET['os']) != "" ? $os = $_GET['os'] : $os = "LINUX")
    $point = ".";
    if(!strstr($user,$point)) {
	$user = $user;
    } else {
	//$user = str_replace(".", " ", $user);
	$userarray = explode(".", $user);
	$user = ucfirst($userarray[0])." ".ucfirst($userarray[1]);
    }


    $invent_text = <<<INVENT
User: $user
CPU: $cpu
MB: $mb
MEM: $mem
HDD: $hdd
OS: $os
LINK: $url

INVENT;
    //QRcode::png($invent_text);
    QRcode::png($invent_text, false, "H", 3, 3);
}
