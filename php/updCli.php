<?php
session_start();

$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$nome = $_POST['nome'];
$tel = $_POST['tel'];
$email = $_POST['email'];
$cnpj = $_POST['cnpj'];
$cpf = $_POST['cpf'];
$cep = $_POST['cep'];

$adm_id = $_SESSION['user_id'];

if ($conexon) {
    $call_prod = "CALL upd_cliente('$nome', '$tel', '$email', '$cnpj', '$cpf', '$cep', $adm_id);";
    $cad_prod = mysqli_query($conexon, $call_prod);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); };
    header("location:../fornecedor_frame.php");
}
?>