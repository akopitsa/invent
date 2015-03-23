<?php
include "../phpqrcode-master/qrlib.php";
header('Content-type: image/png');
if(!empty($_GET['inv'])) {
    QRcode::png($_GET['inv']);
}
