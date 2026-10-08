<?php 
include 'table.php';
$dados = [
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

    if($conexon) {

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
    <title>STOKI seus produtos na palma da mão</title>
</head>
<body>
    <div class="container" id="c-estoque produtoFrame">
        <aside class="asside" id="assideIndex"></aside>
        <header class="header" id="headerIndex">
           
        </header>
        <main class="main" id="mainIndex">
            <div class="main_item" id="mainData"></div>
            <div class="main_item" id="mainTable">
                <?php createTable($dados, $titles); ?>
            </div>
            <dialog id="modalIndex"></dialog>
        </main>
    </div>

    <script type="module" src="js/main.js" defer></script>
</body>
</html>