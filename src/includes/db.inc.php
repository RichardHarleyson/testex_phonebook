<?php

$user = 'root';
$pass = 'Omg01Omg01';
try{
    $db = new PDO('mysql:host=localhost;dbname=testex_phonebook', $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
}
catch(PDOException $e){
    print "Connection error: ".$e->getMessage()."</br>";
    die();
}

?>