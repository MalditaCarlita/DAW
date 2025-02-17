<?php


 function autoload_24ff2e1f31dfd2e61b24ebc97d01c2dc($class)
{
    $classes = array(
        'Clases\Clases1\ClasesOperacionesServiceCustom3' => __DIR__ .'/ClasesOperacionesServiceCustom3.php'
    );
    if (!empty($classes[$class])) {
        include $classes[$class];
    };
}

spl_autoload_register('autoload_24ff2e1f31dfd2e61b24ebc97d01c2dc');

// Do nothing. The rest is just leftovers from the code generation.
{
}
