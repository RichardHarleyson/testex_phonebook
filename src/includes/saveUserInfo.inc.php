<?php
// Saving user basic info(fname, addr etc)
// Saving user phones and emails
if($_POST['userInfo']){
    
    require "db.inc.php";
    
    $userInfo = json_decode($_POST['userInfo'], true);

    //Saving basic user info to db
    $stmt = $db->prepare('UPDATE users SET fname=:fname, sname=:sname, addr=:addr, city=:city, country=:country, public=:public WHERE id=:uid');
    $stmt->execute([
        'fname' => $userInfo['fname'],
        'sname' => $userInfo['sname'],
        'addr' => $userInfo['addr'],
        'city' => $userInfo['city'],
        'country' => $userInfo['country'],
        'public' => $userInfo['public'],
        'uid' => $userInfo['uid'],
        ]);

    // Saving user phones
    if(($userInfo['phones'])){
        foreach($userInfo['phones'] as $phone){
            // Checking if we got phone id
            // if yes - updating
            // else - inserting
            if(!isset($phone['pid']) || $phone['pid'] == ''){
                $phone['pid'] = 0;
                $sql = 'INSERT INTO phone_numbers (id, pnum, public, uid) VALUES (:id, :pnum, :public, :uid)';
            }else if($phone['pid'] != ''){
                $sql = 'UPDATE phone_numbers SET pnum=:pnum, public=:public, uid=:uid WHERE id=:id';
            }else{
                return 0;
                exit();
            }
            $stmt = $db->prepare($sql);
            $stmt->execute([
                'pnum' => $phone['phone'],
                'public' => $phone['public'],
                'uid' => $userInfo['uid'],
                'id' => $phone['pid'],
            ]);
        }
    }

    // Saving user emails
    if(isset($userInfo['emails'])){
        foreach($userInfo['emails'] as $email){
            // Checking if we got phone id
            // if yes - updating
            // else - inserting
            if(!isset($email['eid']) || $email['eid'] == ''){
                $email['eid'] = 0;
                $sql = 'INSERT INTO emails (id, email, public, uid) VALUES (:id, :email, :public, :uid)';
            }else if($email['eid'] != ''){
                $sql = 'UPDATE emails SET email=:email, public=:public, uid=:uid WHERE id=:id';
            }else{
                return 0;
                exit();
            }         
            $stmt = $db->prepare($sql);
            $stmt->execute([
                'email' => $email['email'],
                'public' => $email['public'],
                'uid' => $userInfo['uid'],
                'id' => $email['eid'],
            ]);
        }
    }

    return 'Ok';

}else{

    header('Location: ../');

}