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
    <div class="container_cadAdm" id="cadAdm-frame">
        <form action="../php/cadAdm.php" method="POST">
            <label for="nome">Nome: <input type="text" class="campo_nome" name="nome" id="nome_adm" required></label>
            <label for="empresa">Empresa: <input type="text" class="campo_empresa" name="empresa" id="empresa_adm" required></label>
            <label for="senha">Senha: <input type="password" class="campo_senha" name="senha" id="senha_adm" required></label>
            <label for="telefone">Telefone: <input type="text" class="campo_telefone" name="telefone" id="telefone_adm" required></label>
            <label for="email">Email: <input type="email" class="campo_email" name="email" id="email_adm" required></label>
            <label for="cpf">Cpf: <input type="text" class="campo_cpf" name="cpf" id="cpf_adm"></label>
            <label for="cnpj">Cnpj: <input type="text" class="campo_cnpj" name="cnpj" id="cnpj_adm"></label>
        
            <button type="submit">ENVIAR</button>
        </form>
    </div>
</body>
</html>