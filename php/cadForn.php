<?php
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$nome = $_POST['nome'];
$tel = $_POST['tel'];
$email = $_POST['email'];
$cnpj = $_POST['cnpj'];
$cpf = $_POST['cpf'];
$cep = $_POST['cep'];

if ($conexon) {
    $call_prod = "CALL fornecedores($nome, $tel, $email, $cnpj, $cpf, $cep);";
    $cad_prod = mysqli_query($conexon, $call_prod);

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>