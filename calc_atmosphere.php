<?php
$MODE = $_SERVER['argv'][1];

for($elevation = 10; $elevation <= 90; $elevation += 5)
{
unlink("{$MODE}_el_$elevation.res");
for($temp = 500; $temp < 25000; $temp += 50)
{
    $temperature = $temp;
    $output = array();
    $start = microtime(true);
    exec("./calc_$MODE $temperature 100e-9 1000e-9 15000 1 $elevation", $output);
    $compute_time = microtime(true)-$start;
    echo "./calc_$MODE $temperature 100e-9 1000e-9 15000 1 $elevation " . "$compute_time\n";
    $values = explode(' ', $output[0]);
    $lumen = $values[5] * $values[1];
    $threshold = sqrt(1*pow(10,-7) * 2.5*pow(10, -6));
    $beta = sqrt(4*3.141592654 * $lumen / ($threshold));
    $alpha = 1/$beta;
    file_put_contents("{$MODE}_el_{$elevation}.res", "$temp " . $output[0] . " $lumen $beta $alpha\n", FILE_APPEND);
}
}
