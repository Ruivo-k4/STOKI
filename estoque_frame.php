<?php
session_start();

include 'table.php';
include 'php/global_vals.php';
include 'php/pesquisa/pesq_table.php';

$data = [
    ['a', 'B', 'C', 'd', 'e', 'f'],
    ['a', 'B', 'C', 'd', 'e', 'f'],
    ['a', 'B', 'C', 'd', 'e', 'f'],
    ['a', 'B', 'C', 'd', 'e', 'f'],
    ['a', 'B', 'C', 'd', 'e', 'f'],
    ['a', 'B', 'C', 'd', 'e', 'f']
];

$titles = ['Código', 'Produto', 'Categoria', 'Quantidade', 'Localização', 'Status', 'Ações'];

try { //impede a mensagem de erro de banco, evitar quebrar CSS
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    if (!$conexon) {
        echo "";
        exit;
    }

    $user_id = $_SESSION['user_id'] ?? null;
    $exist = pesq_table('adms', 'id', 'nib', $user_id);

} catch (Exception $error) {
    echo "";
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.min.css" integrity="..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href="css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STOKI seus produtos na palma da mão</title>
    <link rel="icon" href="imgs/logo.png">
</head>
<body>
    <div class="container" id="c-estoque estoqueFrame">
        <aside class="asside" id="assideIndex"></aside>
        <header class="header" id="headerIndex">
           
        </header>
        <main class="main" id="mainIndex">
            <div class="main_item" id="mainData"></div>
            <div class="main_item" id="mainTable">
                <?php createTable($data, $titles); ?>
            </div>
            <dialog id="modalIndex">
                <div class="header">
                    <h1 class="header__title">Código NIB</h1>
                    <div class="content">
                        <button class="header_btn" id="closeModal">X</button>
                    </div>
                </div>
                <div class="modalIndex__body">
                    <section id="modalIndex__section">
                        <h2 class="modal_title"><?php echo $exist; ?></h2>
                    </section>
                </div>
            </dialog>
        </main>
    </div>

    <script type="module" src="js/main.js" defer></script>
</body>
</html>