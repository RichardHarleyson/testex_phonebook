<?php
    // Loading user info, country list from DB
    
    require __DIR__.'/includes/db.inc.php';

    session_start();

    // userInfo
    $stmt = $db->prepare("SELECT * FROM users WHERE id=:id");
    $stmt->execute(['id' => $_SESSION['idUsers']]);
    $userInfo = $stmt->fetch(PDO::FETCH_ASSOC);

    // userPhones
    $stmt = $db->prepare("SELECT id, pnum, public FROM phone_numbers WHERE uid=:id");
    $stmt->execute(['id' => $_SESSION['idUsers']]);
    $phones = $stmt->fetchALL(PDO::FETCH_ASSOC);

    // userEmails
    $stmt = $db->prepare("SELECT id, email, public FROM emails WHERE uid=:id");
    $stmt->execute(['id' => $_SESSION['idUsers']]);
    $emails = $stmt->fetchALL(PDO::FETCH_ASSOC);

    // countries
    $stmt = $db->prepare("SELECT iso, country_name FROM country");
    $stmt->execute();
    $countries = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<form id="saveUserInfoForm" method="post" action="/saveuserinfo" data-uid="<?=$_SESSION['idUsers']?>">
    <div class="personal-tab-content row">
        <div class="col-3" id="baseInfoCol">
            <p class="text-orange font-size-12">CONTACT</p>

            <p class="text-body mb-1">First name:*</p>
            <input type="text" value="<?=$userInfo['fname'];?>" class="personal-tab-input" name="fname" minlength="2" maxlength="50" required>

            <p class="text-body mb-1">Last name:*</p>
            <input type="text" value="<?=$userInfo['sname'];?>" class="personal-tab-input" name="sname" minlength="2" maxlength="50" required>

            <p class="text-body mb-1">Address:*</p>
            <input type="text" value="<?=$userInfo['addr'];?>" class="personal-tab-input" name="addr" minlength="1" maxlength="50" required>

            <p class="text-body mb-1">ZIP/City:*</p>
            <input type="text" value="<?=$userInfo['city'];?>" class="personal-tab-input" name="city" minlength="2" maxlength="50" required>

            <p class="text-body mb-1">Country:*</p>
            <select class="personal-tab-select" name="country">
                <?php foreach($countries as $country):?>
                    <option value="<?=$country['country_name'];?>" <?php if($userInfo['country'] == $country['country_name']){echo "selected='selected'";}?>><?=$country['country_name'];?></option>
                <?php endforeach;?>
            </select>

        </div>
        <div class="col-3" id="userPhoneCol">
            <p class="text-orange font-size-12">PHONE NUMBERS</p>
            <div id="userPhoneList">
                <!-- adding phone blocks here -->
                <?php foreach($phones as $phone):?>
                    <div class="personal-phone-block">
                        <input type="checkbox" name="phone" <?php if($phone['public']){echo "checked='checked'";}?>>
                        <label for="phone">Public field</label><br>
                        <input data-pid="<?=$phone['id'];?>" type="tel" class="personal-tab-input" name="phone" value="<?=$phone['pnum'];?>">
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="add-block-btn"><a href="" onclick="addPhoneBlock()">+Add</a></div>
        </div>
        <div class="col-3" id="userEmailCol">
            <p class="text-orange font-size-12">EMAILS</p>
            <div id="userEmailList">
                <!-- adding email blocks here -->
                <?php foreach($emails as $email):?>
                    <div class="personal-email-block">
                        <input type="checkbox" name="email" <?php if($email['public']){echo "checked='checked'";}?>>
                        <label for="email">Public field</label><br>
                        <input data-eid="<?=$email['id'];?>" type="email" class="personal-tab-input" name="email" value="<?=$email['email'];?>">
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="add-block-btn"><a href="" onclick="addEmailBlock()">+Add</a></div>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <p class="text-body">* Fields are mandatory</p>        
        </div>
        <div class="col-3">
            <input type="checkbox" id="publicUser" name="publicUser" <?php if( $userInfo['public'] ){echo 'checked="checked"';}?> >
            <label for="publicUser">Public Contact</label><br>
        </div>
        <div class="col-3">
            <button id="saveUserInfoBtn" class="save-user-info-btn" onclick="saveUserInfo()">SAVE</button>
        </div>
    </div>
    <div class="result-msg" id="resultMsg"></div>
</form>