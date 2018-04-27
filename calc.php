<?php
$MODE = $_SERVER['argv'][1];
unlink("$MODE.res");
for($temp = 500; $temp < 100000; $temp += 50)
{
    $temperature = $temp;
    $output = array();
    $start = microtime(true);
    exec("./calc_$MODE $temperature 100e-9 1000e-9 15000", $output);
    $compute_time = microtime(true)-$start;
    echo "./calc_$MODE $temperature 100e-9 1000e-9 15000" . "$compute_time\n";
    $values = explode(' ', $output[0]);
    $lumen = $values[5] * $values[1];
    $threshold = sqrt(1*pow(10,-7) * 2.5*pow(10, -6));
    $beta = sqrt(4*3.141592654 * $lumen / ($threshold));
    $alpha = 1/$beta;
    if ($temp < 25000) file_put_contents("$MODE.res", "$temp " . $output[0] . " $lumen $beta $alpha\n", FILE_APPEND);
    file_put_contents("{$MODE}_high.res", "$temp " . $output[0] . " $lumen $beta $alpha\n", FILE_APPEND);
}
