
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STOKI | Configurações</title>
    <link rel="stylesheet" href="css/configuracoes.css">
</head>
<body>
    <div class="container-config">

        <header class="header-config">
            <a class="logo" href="#" aria-label="STOKI">
                <span class="logo-icon">S</span>
                <span class="logo-text">STOKI</span>
            </a>

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
                           href="html/cadFun_indexFrame.php">
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
                           href="html/cadAdm_indexFrame.php">
                            Acessar cadastro <span>→</span>
                        </a>
                    </article>

                </div>
            </section>

        </main>

        <footer class="footer-config">
            <span>STOKI</span>
            <span>Gerenciamento de estoque</span>
        </footer>

    </div>
</body>
</html>