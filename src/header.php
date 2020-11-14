<?php
    session_start();
    include __DIR__.'/includes/db.inc.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phonebook</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<!-- HEAD MENU -->
<div class="topnav">
    <div class="logout-block">
        <div class="logo-block font-size-12 float-left text-white">
            PHONEBOOK
        </div>
        <?php
            if($_SESSION['idUsers']){
                echo '<div class="float-right">
                <a class="font-size-12 text-white" href="/logout">Logout</a>
                </div>';
            }
        ?>
    </div>
</div>
<!-- HEAD MENU END -->