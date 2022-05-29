<?php
    declare(strict_types = 1);
    
    require_once(__DIR__ . '/../templates/common.tpl.php');
    require_once(__DIR__ . '/../templates/restaurant.tpl.php');

    require_once(__DIR__ . '/../database/connection.php');
    require_once(__DIR__ . '/../database/restaurant.class.php');

    require_once(__DIR__ . '/../utils/session.php');

    $session = new Session();

    $db = getDBConnection(__DIR__ . '/../database/data.db');

    $restaurants = Restaurant::getBestRestaurants($db);

    outputHead();
    outputHeader($session);
    outputSideMenu();
    outputAds();
?>        
    <div id="mainDiv" class="index">
        <?php 
        outputSearch();
        outputBestRestaurants($restaurants);
        ?>
        <section id = "close">
            map api
        </section>
    </div>
    <?php
        outputFooter();
    ?>