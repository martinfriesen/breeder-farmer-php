<?php
require 'defaultIncludes.php';

$initials = $_GET["initials"];


  $query = "
      select farm.*, poultry_type.poultry_type_name
      from farm, poultry_type
      where farm_initials = $1
      and farm.poultry_type_id = poultry_type.poultry_type_id
      order by farm_name asc

  ";
  $result = pg_query_params($query,[$initials]);
  if($farm = pg_fetch_assoc($result)) {

  }
  else $farm = false;
  // $flock =  FetchQuery($q,[$flock_id]);

  //$flock["flock_contract"] = intval($flock["flock_contract"]);
  //$flock["flock_quantity"] = intval($flock["flock_quantity"]);

    $arr = array(

    "farm" => $farm
  );

  echo json_encode($farm);

?>
