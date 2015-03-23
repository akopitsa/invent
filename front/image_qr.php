<?php
include "../phpqrcode-master/qrlib.php";
header('Content-type: image/png');
if(!empty($_GET['cpu'])) {
    $user = $_GET['user'];
    $cpu = $_GET['cpu'];
    $mb = $_GET['mb'];
    $mem = $_GET['mem'];
    $hdd = $_GET['hdd'];
    $os = $_GET['os'];

    $invent_text = <<<INVENT
User: $user
CPU: $cpu
MB: $mb
MEM: $mem
HDD: $hdd
OS: $os
INVENT;
    QRcode::png($invent_text);
}
