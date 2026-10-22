<?php 
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$nome     = $_POST['nome'];
$email    = $_POST['email'];
$cpf      = $_POST['cpf'];    
$senha  = $_POST['senha'];

if ($conexon) {
$call_fun = "call cad_fun('$nome', '$empresa', '$senha', '$email', '$cpf', '$telefone', '$cnpj')";
$cad_fun = mysqli_query($conexon, $call_fun);

while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>