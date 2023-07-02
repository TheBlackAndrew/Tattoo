<?php

$connect = mysqli_connect('localhost', 'root', '', 'tattoo_salon');

if (!$connect) {
    die('Error connect to database!');
}

?>