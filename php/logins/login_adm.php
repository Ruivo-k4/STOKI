<?php
session_start();
 
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
                $_SESSION['user_login_state'] = 1;
                $_SESSION['user_id'] = $exist;

                echo "<script>window.location.href='/STOKI/produto_frame.php'</script>";
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
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.min.css" integrity="..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href="/STOKI/css/cads.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stoki seu site de gerenciamento de estoque online</title>
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