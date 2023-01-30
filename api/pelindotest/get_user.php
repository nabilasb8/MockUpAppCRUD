<?php

$mysqli = new mysqli("localhost","root","root","sanbox_pelindo");

// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}


$userid = isset($_GET['userid']) ? $_GET['userid'] : "all";

if ($userid == "all") {
	$sql = "SELECT * FROM tbl_user ORDER BY userid";
} else {
	$sql = "SELECT * FROM tbl_user WHERE userid = '$userid' ORDER BY userid";
}


$result = $mysqli -> query($sql);

// Associative array
// $row = $result -> fetch_assoc();
while($row = $result->fetch_assoc())
{
    $rows[] = $row;
}

$response = ['status' => 'success', 'message' => 'fetch success',  'data' => $rows];
echo json_encode($response, JSON_NUMERIC_CHECK);