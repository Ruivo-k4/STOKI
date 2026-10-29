<?php 
session_start();

$_SESSION['user_login_state'] = FALSE;

session_destroy();

echo "<script>window.location.href='/STOKI/index.html'</script>";
exit;
?>