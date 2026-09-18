<?php 
$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

if ($conexon) {
    $nome = $_POST['nome'];
    $empresa = $_POST['empresa'];
    $email = $_POST['email'];
    $cpf = $_POST['cpf'];
    $cnpj = $_POST['cnpj'];
    $senha = $_POST['senha'];

    function gerarNib() {
        $sequencia = '';

        for($i = 0; $i < 4; $i++) {
            $num = random_int(0, 9);
            $sequencia.= $num;
        }

        $id = '1' . date('dmy') . $sequencia;
        return $id;
    }

    $nib = gerarNib();
    
    $cadAdm = mysqli_query($conexon, "call cadastro_adm('$nome', '$empresa', '$email', '$cpf', '$cnpj', '$nib')");
}


?>