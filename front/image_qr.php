<?php
include "../phpqrcode-master/qrlib.php";
header('Content-type: image/png');
if(!empty($_GET['cpu'])) {
    if(isset($_GET['user']) && !empty($_GET['user']) ? $user = $_GET['user'] : $user = "-")
    if(isset($_GET['cpu']) && !empty(trim($_GET['cpu'])) ? $cpu = $_GET['cpu'] : $cpu = "-")
    if(isset($_GET['mb']) && !empty(trim($_GET['mb'])) ? $mb = $_GET['mb'] : $mb = "-")
    if(isset($_GET['mem']) && !empty(trim($_GET['mem'])) ? $mem = $_GET['mem'] : $mem = "-")
    if(isset($_GET['hdd']) && !empty(trim($_GET['hdd'])) ? $hdd = $_GET['hdd'] : $hdd = "-")
    if(isset($_GET['os']) && !empty(trim($_GET['os'])) ? $os = $_GET['os'] : $os = "-")


    $invent_text = <<<INVENT
User: $user
CPU: $cpu
MB: $mb
MEM: $mem
HDD: $hdd
OS: $os
INVENT;
    //QRcode::png($invent_text);
    QRcode::png($invent_text, false, "H", 4,  4);
}
