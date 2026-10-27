<?php
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$loc_produto = $_POST['loc_produto'];
$qnt = $_POST['qnt'];
$val_unit = $_POST['val_unit'];
$val_vend = $_POST['val_vend'];

if ($conexon) {
    $call_prod = "CALL mov_estoque($loc_produto, $qnt, $val_unit, $val_vend);";
    $cad_prod = mysqli_query($conexon, $call_prod);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
    header("location:../estoque_frame.php");
}
?>