<?php 
session_start();

$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

if (!$conexon) {
    echo "";
    exit;
}



?>