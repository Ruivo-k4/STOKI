<?php 
function pesq_cliente($cliente) {
    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    $cliente_table = mysqli_query($conexon, "SELECT*FROM clientes WHERE tel like '$cliente%'");
    
    if($cliente_table) {
        $lin = mysqli_fetch_all($cliente_table, MYSQLI_ASSOC);

        foreach($lin as $item) {
            return $item['id'];
        }
    }
}
?>