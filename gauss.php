<?php
$samples = 1000;
$N = 23;

function get_min_max($N)
{
    $min = 1000;
    $max = -1000;

    for($i = 0; $i < $N; ++$i)
    {
         $val = stats_rand_gen_normal(0, 1);
         $min = min($val, $min);
         $max = max($val, $max);
    }
    return array($min, $max);
}

for($i = 0; $i < $samples; ++$i)
{
    $abs_min = 1000;
    $abs_max = -1000;
   
    $res = get_min_max($N);
    $abs_min = min($res[0], $abs_min);
    $abs_max = max($res[1], $abs_max);

    echo "$abs_min $abs_max " . $abs_max - $abs_min; 
}
?>
