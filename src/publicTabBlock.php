<?php
    // Loading public users info

    require __DIR__.'/includes/db.inc.php';


    $publicUsers = array();
    $stmt = $db->prepare("SELECT id, fname, sname, addr, city, country FROM users WHERE public=1");
    $stmt->execute();
    $userList = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Getting public phones and emails
    foreach($userList as $user){
        $stmt = $db->prepare("SELECT pnum FROM phone_numbers WHERE uid=:uid AND public=1");
        $stmt->execute(['uid' => $user['id']]);
        $user['phones'] = $stmt->fetchALl(PDO::FETCH_ASSOC);
        
        $stmt = $db->prepare("SELECT email FROM emails WHERE uid=:uid AND public=1");
        $stmt->execute(['uid' => $user['id']]);
        $user['emails'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        $publicUsers[] = $user;
    }

?>  <?php if(empty($publicUsers)){
    echo "<div class='public-user-block'>
        <h4>No public users found</h4>    
    </div>";
    };?>
    <?php foreach($publicUsers as $publicUser): ?>
        <div class="public-user-block">
            <div class="public-user-header">
                <span class="public-user-name"><?php echo $publicUser['fname'].' '.$publicUser['sname'];?></span>
                <a class="float-right" href="" onclick="openAccordion(this, publicUserBlock<?=$publicUser['id'];?>)" >View details</a>
            </div>
            <div class="public-user-body hide" id="publicUserBlock<?=$publicUser['id'];?>">
                <div class="row">
                    <div class="col-3">
                        <p class=text-orange>ADDRESS</p>
                        <p class="font-size-1">
                            <p class="public-item-list"><?=$publicUser['addr'];?></p>
                            <p class="public-item-list"><?=$publicUser['city'];?></p>
                            <p class="public-item-list"><?=$publicUser['country'];?></p>
                        </p>
                    </div>
                    <div class="col-3">
                        <p class=text-orange>PHONE NUMBERS</p>
                        <p class="font-size-1">
                            <?php foreach($publicUser['phones'] as $phone): ?>
                                <p class="public-item-list"><?=$phone['pnum'];?></p>
                            <?php endforeach;?>
                        </p>
                    </div>
                    <div class="col-3">
                        <p class=text-orange>EMAILS</p>
                        <p class="font-size-1">
                            <?php foreach($publicUser['emails'] as $email): ?>
                                <p class="public-item-list"><?=$email['email'];?></p>
                            <?php endforeach;?>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach;?>