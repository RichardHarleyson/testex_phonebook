<?php
    require "header.php";
?>

<main>
    <!-- PHONEBOOK BLOCK -->
    <div class="phonebook-block">
        <div class="tab">
            <button class="tablinks" onclick="openTab(event, 'publicTab')" id="publicTabBtn">Public phonebook</button>
            <?php if(!$_SESSION['idUsers']):?>
                <button class="tablinks" onclick="openTab(event, 'loginTab')" id="loginTabBtn">Login</button>
            <?php else: ?>
                <button class="tablinks" onclick="openTab(event, 'personalTab')" id="personalTabBtn">My contact</button>
            <?php endif; ?>
        </div>

        <!-- Tab content -->
        <div id="publicTab" class="tabcontent">
            <?php include "publicTabBlock.php"; ?>
        </div>

        <div id="loginTab" class="tabcontent">
            <?php if(!$_SESSION['idUsers']) {
                include "loginTabBlock.php";
            }?>
        </div>

        <div id="personalTab" class="tabcontent">
            <?php if($_SESSION['idUsers']){
                include "personalTabBlock.php";
            }?>
        </div>

        <!-- Tab content end -->
    </div>
    <!-- PHONEBOOK BLOCK END -->
</main>

<?php
    require "footer.php";
?>