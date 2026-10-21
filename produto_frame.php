<?php 
include 'table.php';
$titles = ['Código', 'Produto', 'Categoria', 'Quantidade', 'Localização', 'Status', 'Ações'];

try { //impede a mensagem de erro de banco, evitar quebrar CSS
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    if($conexon) {
        $produtos_table = mysqli_query($conexon, "SELECT*FROM produtos");
        $lin = mysqli_fetch_all($produtos_table, MYSQLI_ASSOC);
        $data_produtos = [];

        foreach($lin as $item) {
            if ($item['qntd'] > $item['qnt_max_repor']) {
                $status = "Estoque Alto";
            } else if ($item['qntd'] > $item['qnt_min_repor']) {
                $status = "Estoque Baixo";
            } else if($item['qntd'] == 0) {
                $status = "Sem estoque";
            }else {
                $status = "Em estoque";
            }

            $data_produtos[] = [
                $item['id'],
                $item['nome'],
                $item['marca'],
                $item['qntd'],
                $item['descricao'],
                $status
            ];
        }
        
    }

} catch (Exception $error) {
    $res_produtos = [];
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
                <?php createTable($data_produtos, $titles); ?>
            </div>
            <dialog id="modalIndex"></dialog>
        </main>
    </div>

    <script type="module" src="js/main.js" defer></script>
</body>
</html>