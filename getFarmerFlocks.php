<?php
require 'defaultIncludes.php';

$farm_id = 101;
$flock_status = 'A';

  $query = "
      select
          flock_id,
          flock.farm_id,
          breed.breed_id,
          breed.breed_name,
          poultry_type.poultry_type_name,
          poultry_type.poultry_type_id,
          to_char(flock_dob,'FMMon DD, YYYY')as flock_dob,
          flock_contract,
          flock_quantity,
              to_char(flock_proj_start,'FMMon DD, YYYY')as flock_proj_start,
              to_char(flock_act_start,'FMMon DD, YYYY')as flock_act_start,
              to_char(flock_proj_end,'FMMon DD, YYYY')as flock_proj_end,
              to_char(flock_act_end,'FMMon DD, YYYY')as flock_act_end,
              flock_status,
              flock_code,
              flock_memo,
              flock.user_added,
              flock.date_added
      from flock, poultry_type, breed, farm
      where farm.farm_id = $1
      and flock.farm_id = farm.farm_id
      and breed.poultry_type_id = poultry_type.poultry_type_id
      and flock.breed_id = breed.breed_id
      and flock_status like $2

  ";
  $result = pg_query_params($query,[$farm_id, $flock_status]);
  while($f = pg_fetch_assoc($result)) {

    $today =  new DateTime();
    $dob =  new DateTime($f["flock_dob"]);

    $f['age_weeks'] = flock_age($today,$dob);
    $flocks[] = $f;
  }
  // $flock =  FetchQuery($q,[$flock_id]);

  //$flock["flock_contract"] = intval($flock["flock_contract"]);
  //$flock["flock_quantity"] = intval($flock["flock_quantity"]);

    $arr = array(

    "flocks" => $flocks
  );

  echo json_encode($flocks);

?>
