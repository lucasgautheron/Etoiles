<?php
$MODE = $_SERVER['argv'][1];
unlink("$MODE.res");
for($temp = 500; $temp < 25000; $temp += 50)
{
    $temperature = $temp;
    $output = array();
    $start = microtime(true);
    exec("./calc_$MODE $temperature 100e-9 1000e-9 15000", $output);
    $compute_time = microtime(true)-$start;
    echo "$compute_time\n";
    $values = explode(' ', $output[0]);
    file_put_contents("$MODE.res", "$temp " . $output[0] . "\n", FILE_APPEND);
}
