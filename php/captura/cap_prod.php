<?php 
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

if($conexon) {
    $produtos = mysqli_querry($conexon, "SELECT*FROM produtos");
    $res_produtos = mysqli_fetch_array($produtos);

    if($res_produtos) {
        echo $res_produtos;
    }
}
?>