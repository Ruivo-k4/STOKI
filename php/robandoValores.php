<?php 
$connect = mysqli_connect('localhost', 'root', '', 'STOKI');

$iv = $_POST['bd_iv'];

$nome_fun = $_POST['nome'];
$email_fun = $_POST['email'];
$senha_fun = $_POST['senha'];
$cpf_fun = $_POST['cpf'];

if($connect){
    $busca_us = mysqli_query($connect, "SELECT * FROM usuario WHERE iv LIKE '$iv%'");
    $res_buscaUs = mysqli_fetch_array($busca_us);

    if($res_buscaUs) {
        $busca_fun = mysqli_query($connect, "SELECT * FROM funcionario WHERE cpf LIKE '$cpf_fun%'");
        $res_buscaFun = mysqli_fetch_array($busca_fun);

        if($res_buscaFun){
            echo "cpf já existe";
        } else {
            $id_pai = $res_buscaUs['id'];
        $cad_fun = mysqli_query($connect, "INSERT INTO funcionario(nome, email, senha, cpf, id_pai) VALUES ($nome_fun, $email_fun, $senha_fun, $cpf_fun, $id_pai)");

        if($cad_fun) {
            echo "cadastrado";
        } else {
            echo "deu ruim";
        }
        }
    
    } else {
        echo "sem resultado";
    }
} else {
    echo "Deu erro kkk";
}
?>