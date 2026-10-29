<?php 
include '../generateNib.php';
include '../pesquisa/pesq_table.php';

$conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');
$nib = geradorNib(1);

try {
    if(!$conexon) {
        echo "não conectado";
        exit;    
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = $_POST['nome'] ?? 'nome';
        $empresa = $_POST['empresa'] ?? 'empresa';
        $tel = $_POST['tel'] ?? 'telefone';
        $email = $_POST['email'] ?? 'email';
        $cpf = $_POST['cpf'] ?? 'cpf';
        $cnpj = $_POST['cnpj'] ?? 'cnpj';
        $pass = $_POST['senha'] ?? 'senha';
        
        $exist = pesq_table('adms', 'email', 'id', $email);

        if($exist) {
            echo "<script>alert('Este cadastro já existe')</script>";
        } else {
            $call = mysqli_query($conexon, "CALL cad_adm('$name', '$empresa', '$pass', '$tel', '$email', '$cnpj', '$cpf', $nib)");

            echo "<script>window.location.href='/STOKI/php/logins/login_adm.php'</script>";
        }
    }

} catch (Exception $error) {
   echo ""; 
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.min.css" integrity="..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href="/STOKI/css/cads.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro adm</title>
</head>
<body>
    <div class="cadContainer" id="cadContainer-index">
        <div class="cadContainer_form" id="container--form">
            
        </div>
        <div class="hero" id="heroCad-index">
        </div>
    </div>

    <script type="module" src="/STOKI/js/main.js" defer></script>
</body>
</html>