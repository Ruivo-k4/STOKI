<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STOKI faça seu cadastro</title>

    <style>
        #cadAdm-frame {
            form {
                display: flex;
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container_cadFun_Titu">
    Cadastre agora no seu aplicativo de gerenciamento STOKI.
    </div>
    <div class="contaner_cadFun" id="cadfun-frame">
        <form action="../php/cadFun.php" method="POST">
            <label for="nome_fun">Nome: <input type="text" class="form_in" name="nome" id="nome_fun" required></label>
            <label for="email_fun">Email: <input type="email" class="form_in" name="email" id="email_fun" required></label>
            <label for="cpf_fun">Cpf: <input type="text" class="form_in" name="cpf" id="cpf_fun"></label>
            <label for="senha_fun">Senha: <input type="password" class="form_in" name="senha" id="senha_fun" required></label>
            <button type="submit">ENVIAR</button>
        </form>
    </div>
</body>
</html>