<?php
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$qnt = $_POST['quantidade']
$val_unit = $_POST['val_unit'];
$val_vend = $_POST['val_vend'];
$forma_pagamento = $_POST['forma_pagamento'];
$situacao = $_POST['situacao'];


if ($conexon) {
    $call_prod = "CALL vendas($qnt, $val_unit, $val_vend, $forma_pagamento, $situacao);";
    $cad_prod = mysqli_query($conexon, $call_prod);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>