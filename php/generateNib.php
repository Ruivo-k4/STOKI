<?php
function geradorNib($user) {
    $data = date('dmY');
    $randon = random_int(1000, 9999);

    $nib = $user.$data.$randon;
    return $nib;
}
?>