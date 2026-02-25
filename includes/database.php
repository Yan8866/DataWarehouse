<?php

/**
 * Get the database connection
 *
 * @return object Connection to the database server
 */
function getDB()
{
    $db_host = "hopper.proxy.rlwy.net";
    $db_user = "root";
    $bd_pass = "sVMeKcFNmKtlROhWBYBdCUuxLUMHbibK";
    $db_name = "railway";
    
    $conn = mysqli_connect($db_host, $db_user, $bd_pass, $db_name,);

    if (mysqli_connect_error()) {
        echo mysqli_connect_error();
        exit;
    }

    return $conn;
}
?>