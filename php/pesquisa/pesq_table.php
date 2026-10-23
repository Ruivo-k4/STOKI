<?php 
function pesq_table($table_bd, $parameter, $return, $value) {
    $conexon = mysqli_connect('localhost', 'root', '', 'stoki_bd');

    $table= mysqli_query($conexon, "SELECT*FROM $table_bd WHERE $parameter like '$value%'");
    
    if($table) {
        $lin = mysqli_fetch_all($table, MYSQLI_ASSOC);

        foreach($lin as $item) {
            return $item[$return];
        }
    }

    return null;
}
?>