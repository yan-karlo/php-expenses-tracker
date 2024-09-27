<?php

declare(strict_types=1);

namespace App\Config;

use Framework\App;
use App\Controllers\{AboutController, HomeController};

function routesRegister(App $app) : void
{
    $app->get('/', [HomeController::class, 'home']);
    $app->get('/home', [HomeController::class, 'home']);
    $app->get('/about.php', [AboutController::class, 'about']);
    $app->get('/about', [AboutController::class, 'about']);
}
