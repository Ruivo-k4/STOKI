<?php 
include 'table.php';

$titles = ['Pedido', 'Produtos', 'Data', 'Valor', 'Status', 'Ações'];

$data = [];
try { //impede a mensagem de erro de banco, evitar quebrar CSS
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    if($conexon) {
        $pedidos_table = mysqli_query($conexon, "SELECT*FROM vendas");
        $lin = mysqli_fetch_all($pedidos_table, MYSQLI_ASSOC);

        if ($lin) {
            foreach($lin as $item) {
                $data[] = [
                    $item['id'],
                    $item['nome'],
                    $item['data_cad'],
                    $item['val_tot'],
                    $item['estado']
                ];
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
    
    <link rel="stylesheet" href="css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STOKI seus pedidos na palma da mão</title>
    <link rel="icon" href="imgs/logo.png">
</head>
<body>
    <div class="container" id="c-estoque pedidosFrame">
        <aside class="asside" id="assideIndex"></aside>
        <header class="header" id="headerIndex">
           
        </header>
        <main class="main" id="mainIndex">
            <div class="main_item" id="mainData"></div>
            <div class="main_item" id="mainTable">
                <?php createTable($data, $titles); ?>
            </div>
            <dialog id="modalIndex"></dialog>
        </main>
    </div>

    <script type="module" src="js/main.js" defer></script>
</body>
</html>