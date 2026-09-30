<?php 
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

if ($conexon) {
    $call_fun = "call cadastro_fun('fernando', 'FerDnando', 'Fernando@gmail.com', '111.111.111-11', '11111111111111', '10409261234')";
    $cad_fun = mysqli_query($conexon, $call_fun);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>