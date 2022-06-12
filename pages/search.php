<?php
    declare(strict_types = 1);

    require_once(__DIR__ . '/../database/connection.php');
    require_once(__DIR__ . '/../database/restaurant.class.php');
    require_once(__DIR__ . '/../database/costumer.class.php');
    
    require_once(__DIR__ . '/../templates/common.tpl.php');
    require_once(__DIR__ . '/../templates/form.tpl.php');
    require_once(__DIR__ . '/../templates/headfiles.tpl.php');
    require_once(__DIR__ . '/../templates/restaurant.tpl.php');

    require_once(__DIR__ . '/../utils/session.php');

    $db = getDBConnection(__DIR__ . '/../database/data.db');

    $session = new Session();

    $restaurants = Restaurant::searchRestaurants($db, $_GET['search'], isset($_GET['order']), $_GET['category'], intval($_GET['rating']));

    $categories = Restaurant::getAllCategories($db);

    if($session->isLoggedin()){
        $user = Costumer::getCostumer($db, $session->getId());
    }

    $favorites = isset($user) ? $user->getFavoriteRestaurantsIds($db) : array();

    outputHead();
    search_head();
    outputHeader($session, $categories, $user);
    outputAds();
    outputSortSideMenu($categories);
    outputSearchResults($restaurants, $favorites, $session);
    outputFooter();
?>