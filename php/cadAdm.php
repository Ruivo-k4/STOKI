<?php 
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

if ($conexon) {
    $call_adm = "call cadastro_adm('fernando', 'FerDnando', 'Fernando@gmail.com', '111.111.111-11', '11111111111111', '10409261234')";
    $cad_adm = mysqli_query($conexon, $call_adm);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>