<?php 
include 'generateNib.php'
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$nome     = $_POST['nome'];
$empresa  = $_POST['empresa'];
$senha  = $_POST['senha'];
$telefone = $_POST['telefone'];
$email    = $_POST['email'];
$cpf      = $_POST['cpf'];
$cnpj     = $_POST['cnpj'];


if ($conexon) {
$call_adm = "call cad_adm('$nome', '$empresa', '$senha', '$email', '$cpf', '$telefone', '$cnpj','$nib')";
$cad_adm = mysqli_query($conexon, $call_adm);

while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>