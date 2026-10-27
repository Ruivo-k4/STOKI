<?php 
function createTable($datas, $titles) {
    echo '<div class="content_table" id="c-table">';
        echo '<table class="table" id="tableIndex">';
            echo '<thead class="table__head" id="tHead"><tr class="table__title">';
                foreach($titles as $title) {
                    echo '<th>'.htmlspecialchars($title).'</th>';
                }
            echo '</tr></thead>';

            echo '<tbody class="table__body" id="tBody">' ;
                foreach($datas as $row) {
                    echo '<tr class="table__data">';
                        foreach($row as $data) {
                            echo '<td>'.htmlspecialchars($data).'</td>';
                        }
                        echo '<td id="c-ico"><i class="algum fa-sharp fa-solid fa-pen-to-square"></i><i class="fa-sharp fa-solid fa-trash"></i></td>';
                    echo '</tr>';
                }
            echo '</tbody>';
        echo '</table>';
    echo '</div>';
}
?>