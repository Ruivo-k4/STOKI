<?php
include 'pesquisa/pesq_table.php';

$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$tel = $_POST['tel'];

$qnt = $_POST['quantidade'];
$val_unit = $_POST['val_unit'];
$val_vend = $_POST['val_vend'];
$forma_pagamento = $_POST['forma_pagamento'];
$situacao = $_POST['situacao'];

if ($conexon) {
    $cliente_id = pesq_table('clientes', 'id', 'tel', $tel);

    $call_prod = "CALL cad_venda('$cliente_id', 1, 'adm', 1, 0.00, 'forma', 'estado')";
    $cad_prod = mysqli_query($conexon, $call_prod);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>