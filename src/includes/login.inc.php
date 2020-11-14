<?php
// Checking login data passed from user
// Accessing DB to check if user exists
// If user exists - adding params to $_SESSION to track logged user
// Signup
if(isset($_POST['signup-submit'])){

    require "db.inc.php";

    $userInfo = [
        'login' => $_POST['login'],
        'pwd' => $_POST['pwd']
    ];

    if( !empty($userInfo['login']) || !empty($userInfo['pwd']) ){
        // Checking if login is already taken
        $stmt = $db->prepare('SELECT id FROM users WHERE login=:login');
        $stmt->execute(['login' => $userInfo['login']]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        if($result != false){
            // user exists
            header('Location: ../?login?error=usertaken');
            $stmt->close();
            exit();

        }else{
            // adding user to db
            $stmt = $db->prepare("INSERT INTO users (login, pwd, public) VALUES (:login, :pwd, 0)");
            $pwdHashed = password_hash($userInfo['pwd'], PASSWORD_DEFAULT);
            $stmt->execute([
                'login' => $userInfo['login'],
                'pwd' => $pwdHashed,
            ]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if($result == false){
                session_start();
                $_SESSION['idUsers'] = $db->lastInsertId();
                header('Location: ../?signup=success');
                exit();
            }else{
                header('Location: ../?error=user_not_created');
                exit();
            }
        }
    }else{
        header('Location: ../?error=empty_fields');
    }
// Login
}else if(isset($_POST['login-submit'])){

    require "db.inc.php";
    
    $userInfo = [
        'login' => $_POST['login'],
        'pwd' => $_POST['pwd'],
    ];

    if(empty($userInfo['login']) || empty($userInfo['pwd'])){
        header("Location: ../?error=empty_fields");
        exit();
    }else{
        //Checking if user exists
        $stmt = $db->prepare("SELECT * FROM users WHERE login=:login");
        $stmt->execute(['login' => $userInfo['login']]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if($user != false){
            // User exists, checking password
            if($pwdCheck = password_verify($userInfo['pwd'], $user['pwd'])){
                session_start();
                $_SESSION['idUsers'] = $user['id'];
                header("Location: ../?login=success");
                exit();
            }else{
                header('Location: ../?error=incorrent_password');
                exit();
            }
        }else{
            header("Location: ../?error=user_not_found");
            exit();
        }
    }
}
else{
    header("Location: ../");
}
?>