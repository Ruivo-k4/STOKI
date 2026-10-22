<?php 

$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

$nome     = $_POST['nome'];
$email    = $_POST['email'];
$cpf      = $_POST['cpf'];    
$senha  = $_POST['senha'];

$amds_id = 764357;

if ($conexon) {
$call_fun = "call cad_fun('$nome', '$email', '$cpf', '$senha', '$amds_id')";
$cad_fun = mysqli_query($conexon, $call_fun);

while (mysqli_next_result($conexon)) { mysqli_store_result($conexon); }
}
?>