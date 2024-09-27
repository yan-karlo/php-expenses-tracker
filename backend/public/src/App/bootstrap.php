<?php

declare(strict_types=1);
require __DIR__ . "/../../vendor/autoload.php";

use Framework\App;
use App\Controllers\{AboutController, HomeController};
use App\Config\Paths;

use function App\Config\routesRegister;

$app = new App(Paths::SOURCE."App/container-definitions.php");

routesRegister($app);

return $app;
