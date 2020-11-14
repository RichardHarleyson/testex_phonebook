<?php

$url_path = trim( $_SERVER[ 'REQUEST_URI' ], '/' );

if (preg_match('/\.(?:png|jpg|jpeg|gif|css|js)$/', $_SERVER["REQUEST_URI"])) {
    
    return false;

}else if(!$url_path){

    include __DIR__.'/src/index.php';

}else if($url_path == 'login'){

    include __DIR__.'/src/includes/login.inc.php';

}else if($url_path == 'logout'){

    include __DIR__.'/src/includes/logout.inc.php';

}else if($url_path == 'saveuserinfo'){

    include __DIR__.'/src/includes/saveUserInfo.inc.php';

}else if($url_path == 'publicTab'){

    include __DIR__.'/src/publicTabBlock.php';

}else if($url_path == 'personalTab'){

    include __DIR__.'/src/personalTabBlock.php';

}else if($url_path == 'loginTab'){

    include __DIR__.'/src/loginTabBlock.php';

}else if($url_path == 'testpage'){

    include __DIR__.'/src/includes/testpage.php';
}else {
    include __DIR__.'/src/index.php';
}
?>