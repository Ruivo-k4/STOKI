<?php
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$nome = $_POST['nome'];
$marca = $_POST['marca'];
$qnt = $_POST['quantidade'];
$val_unit = $_POST['val_unit'];
$val_vend = $_POST['val_vend'];
$val_comp = $_POST['val_com'];
$peso = $_POST['peso'];
$lote = $_POST['lote'];
$min_rep = $_POST['min_repor'];
$max_rep = $_POST['max_repor'];
$gtin = $_POST['gtin'];

if ($conexon) {
    $call_prod = "CALL cad_prod('$nome', '$marca', 'desc', '$qnt', '$val_unit', '$val_vend', '$val_comp', '$peso', '$lote', '$min_rep', '$max_rep', '$gtin')";
    $cad_prod = mysqli_query($conexon, $call_prod);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
    header("location:../Produto_frame.php");
}

?>