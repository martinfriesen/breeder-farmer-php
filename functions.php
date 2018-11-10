<?php

  function flock_age($date, $dob)
  {

    $interval = $dob->diff($date);
    $days = $interval->format('%a')+1;
    return  ceil(bcdiv($days,7,2));
    //$weeks = ceil(bcdiv($days,7,2));
    //return $weeks;
  }

?>
