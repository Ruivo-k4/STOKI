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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Funcionario</title>
</head>
<body>
    <div class="login_container" id="indexFrame">
        <div class="login_containter__content"></div>
        <div class="hero">

        </div>
        <div class="content">
            <form action="login_fun.php" class="content_form" method="POST">
                <input type="text" name="nib" id="nibIn" class="content__in" placeholder="NIB: " required>
                <input type="password" name="senha" id="passIn" class="content__in" placeholder="Senha: " required>
                <button type="submit" class="content__btn">Fazer Login</button>
            </form>
        </div>
    </div>
</body>
</html>