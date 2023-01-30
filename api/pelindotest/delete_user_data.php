<?php

$mysqli = new mysqli("localhost","root","root","sanbox_pelindo");

// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}


$userid = isset($_GET['userid']) ? $_GET['userid'] : "all";

$sql = "DELETE FROM tbl_user WHERE userid = $userid";


$query = $mysqli -> query($sql);

if ($query == true) {
	$message = "User ID berhasil dihapus!";
	$status = 'success';
} else {
	$status = 'failed';
	$message = "Gagal menghapus data!";
}

$response = ['status' => $status, 'message' => $message, 'data' => null];
echo json_encode($response);