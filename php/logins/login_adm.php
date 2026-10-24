<?php 
include '../global_vals.php';
include '../pesquisa/pesq_table.php';

try {
    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    if(!$conexon) {
        echo "";
        exit;
    }

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $email = $_POST['email'];
        $pass = $_POST['senha'];

        echo "<script>alert($email)</script>";
        
        $exist = pesq_table('adms', 'email', 'id', $email);
        $exist_pass = pesq_table('adms', 'email','senha', $email);

        if($exist) {
            if ($exist_pass == $pass) {
                $user_login_state = TRUE;
                loginUser();

                echo "<script>window.location.href='/STOKI/financeiro_frame.php'</script>";
            } else {
                echo "<script>alert('Email ou Senha incopativeis')</script>";
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
    <link rel="stylesheet" href="css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stoki seu site de gerenciamento de estoque online</title>
</head>

<body>
    <div class="login_container" id="indexFrame">
        <header class="header">
            <a href="/STOKI/index.html">Voltar</a>
        </header>

        <h2>Faça login para continuar</h2>

        <form action="/STOKI/php/logins/login_adm.php" method="post">
            <input type="email" name="email" placeholder="E-mail" id="email" required>
            <input type="password" name="senha" placeholder="Senha" id="senha">
            
            <button type="submit" class="criar conta">Enviar</button>
        </form>

        <div class="box_marca">
            <input type="checkbox" placeholder="Lembrar de mim" id="caixa_confirm">
            <label for="resultado">Lembrar de mim</label>
        </div>

        <!--Colocar o link da página de lembrar a senha-->
        <a href="">Esqueceu a senha?</a>

        <button id="ButtonCriar"><a href="/STOKI/php/pag_cads/cadAdm.php">Criar Conta</a></button>

        <footer class="footer">

            <div class="mensagem_form" id="mensagem">
                Coloque as informações necessárias
            </div>

        </footer>
    </div>

    <script type="module" src="js/main.js" defer></script><!--Local dos imports-->
</body>

</html>