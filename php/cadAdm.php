<?php 
include 'generateNib.php';
include 'pesquisa/pesq_table.php';

$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');
$nib = geradorNib(1);

try {
    if(!$conexon) {
        echo "não conectado";
        exit;    
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = $_POST['nome'] ?? '';
        $empresa = $_POST['empresa'] ?? '';
        $tel = $_POST['tel'] ?? '';
        $email = $_POST['email'] ?? '';
        $cpf = $_POST['cpf'] ?? '';
        $cnpj = $_POST['cnpj'] ?? '';
        $pass = $_POST['senha'] ?? '';
        
        $exist = pesq_table('adms', 'email', 'id', $email);

        if($exist) {
            echo "<script>alert('Este cadastro já existe')</script>";
        } else {
            $call = mysqli_query($conexon, "CALL cad_adm('{$name}', '{$empresa}', '{$tel}', '{$email}', '{$cpf}', '{$cnpj}', '{$pass}', '{$nib}')");
            echo "<script>alert('cadastro realizado com sucesso')</script>";
        }
    }

    while (mysqli_next_result($conexon)) { mysqli_store_result($conexon);}

} catch (Exception $error) {
    
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link rel="stylesheet" href="/STOKI/css/cads.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro adm</title>
</head>
<body>
    <div class="cadContainer">
        <div class="header">
            <button class="header__btn"><a href="/STOKI/php/logins/login_adm.php">voltar</a></button>
        </div>
        <form action="cadAdm.php" method="POST" class="form">
            <input type="text" name="nome" placeholder="Nome: " class="form__in form__int-text" required>
            <input type="text" name="empresa" placeholder="Empresa: " class="form__in form__int-text" required>
            <input type="tel" name="tel" placeholder="Telefone: " class="form__in form__int-text" required>
            <input type="email" name="email" placeholder="Email: " class="form__in form__int-text" required>
            <input type="text" name="cpf" placeholder="CPF: " class="form__in form__int-text" required>
            <input type="text" name="cnpj" placeholder="CNPJ: " class="form__in form__int-text" required>
            <input type="password" name="senha" placeholder="Senha: " class="form__in form__int-text" required>
            <button type="submit">Cadastrar</button>
        </form>
    </div>
</body>
</html>