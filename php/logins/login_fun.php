<?php
include '../pesquisa/pesq_table.php';

try {
    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    if (!$conexon) {
        echo "";
        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $nib = $_POST['nib'];
        $senha = $_POST['senha'];

        $adms_id = pesq_table('adms', 'nib', 'id', $nib);

        $exist = pesq_table('funcionarios', 'adms_id', 'id', $adms_id);
        $exist_pass = pesq_table('funcionarios', 'adms_id', 'senha', $adms_id);


        if ($exist) {
            if($exist_pass) {
                echo "<script>alert('NIB ou Senha incopativeis')</script>";
            } else {
                echo "<script>alert('NIB ou Senha incopativeis')</script>";
            }
        }
    }
} catch (Exception $error) {
    echo "";
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link rel="stylesheet" href="/STOKI/css/cads.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Funcionario</title>
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