<?php
session_start();

include './php/global_vals.php';

try { //impede a mensagem de erro de banco, evitar quebrar CSS
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    if (!$conexon) {
        echo "";
        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $permits = $_POST['check-box'] ?? [];
        $_SESSION["permits"] = $permits;
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
    <title>STOKI | Configurações</title>
    <link rel="stylesheet" href="css/configuracoes.css">
    <link rel="icon" href="imgs/logo.png">
</head>
<body>
    <div class="container-config">

        <header class="header-config">
            <img src="imgs/logo.png" alt="" srcset="">

            <span class="header-label">Gerenciamento de estoque</span>
        </header>

        <main class="main-config">

            <section class="page-heading">
                <div class="heading-icon">⚙</div>

                <div>
                    <p class="eyebrow">SUA CONTA</p>
                    <h1>Configurações</h1>
                    <p class="page-description">
                        Acesse as opções da sua conta e as telas
                        de gerenciamento do sistema.
                    </p>
                </div>
            </section>

            <section class="config-section">
                <div class="section-heading">
                    <h2>Conta e acesso</h2>
                    <p>Atalhos para acessar as telas da sua conta.</p>
                </div>

                <div class="config-card config-card-horizontal">
                    <div class="card-icon">↔</div>

                    <div class="card-content">
                        <h3>Troca de login</h3>
                        <p>Acesse a tela de login do administrador.</p>
                    </div>

                    <a class="button button-secondary"
                       href="/STOKI/php/logins/login_adm.php">
                        Acessar tela <span>→</span>
                    </a>
                </div>
            </section>

            <section class="config-section">
                <div class="section-heading">
                    <h2>Gerenciamento</h2>
                    <p>Escolha a tela de cadastro que deseja acessar.</p>
                </div>

                <div class="config-grid">

                    <article class="config-card config-card-column">
                        <div class="card-icon">♙</div>

                        <div class="card-content">
                            <h3>Cadastro de funcionários</h3>
                            <p>
                                Acesse a tela para cadastrar funcionários
                                no sistema.
                            </p>
                        </div>

                        <a class="button button-primary"
                           href="./php/pag_cads/cadFun.php">
                            Acessar cadastro <span>→</span>
                        </a>
                    </article>

                    <article class="config-card config-card-column">
                        <div class="card-icon">▤</div>

                        <div class="card-content">
                            <h3>Cadastro de administrador</h3>
                            <p>
                                Acesse a tela de cadastro de administrador.
                            </p>
                        </div>

                        <a class="button button-secondary"
                           href="./php/pag_cads/cadFun.php">
                            Acessar cadastro <span>→</span>
                        </a>
                    </article>

                </div>

                <div class="section-heading">
                    <h2>Restrições</h2>
                    <p>Configure as visualizações dos funcionarios</p>
                </div>

                <div class="config-grid">
                    <article class="config-card config-card-column">
                        <div class="card-icon">♙</div>

                        <div class="card-content">
                            <h3>Permições de telas</h3>
                            <p>
                                Modifique a forma de visualização dos funcionarios
                            </p>
                        </div>

                        <button class="button button-primary" id="btn-configDisplay">
                            Visualização Geral <span></span>
                        </button>

                        <form action="" method="post" class="boxes-config">
                            <div class="boxes">
                                <input type="checkbox" name="check-box[]" id="check-box__financa" value="financas">
                                <label for="check-box__financa">Finanças</label>
                            </div>

                            <div class="boxes">
                                <input type="checkbox" name="check-box[]" id="check-box__config" value="configuracoes">
                                <label for="check-box__config">Configurações</label>
                            </div>

                            <div class="boxes">
                                <input type="checkbox" name="check-box[]" id="check-box__forn" value="fornecedores">
                                <label for="check-box__forn">Fornecedores</label>
                            </div>

                            <div class="boxes">
                                <input type="checkbox" name="check-box[]" id="check-box__nib" value="nib">
                                <label for="check-box__nib">Código NIB</label>
                            </div>

                            <div class="boxes">
                                <input type="checkbox" name="check-box[]" id="check-box__ped" value="Pedidos">
                                <label for="check-box__ped">Pedidos</label>
                            </div>

                            <div class="boxes">
                                <input type="checkbox" name="check-box[]" id="check-box__cad" value="cadastro">
                                <label for="check-box__cad">Cadastro</label>
                            </div>

                            <button type="submit" id="btnSubmit">Salvar</button>
                        </form>
                    </article>

                    <article class="config-card config-card-column">
                        <div class="card-icon">▤</div>

                        <div class="card-content">
                            <h3>Cadastro de administrador</h3>
                            <p>
                                Acesse a tela de cadastro de administrador.
                            </p>
                        </div>

                        <button class="button button-secondary">
                            Acessar cadastro <span>→</span>
                        </button>
                    </article>

                </div>
            </section>

        </main>

        <footer class="footer-config">
            <span id="footer-config__btn">Voltar</span>
            <span>Gerenciamento de estoque</span>
        </footer>

        <script>
            let btnBack = document.querySelector("#footer-config__btn");

            btnBack.addEventListener('click', () => {
                window.history.back();
            });
        </script>

        <script src="./js/buttonsConfig.js"></script>
    </div>
</body>
</html>