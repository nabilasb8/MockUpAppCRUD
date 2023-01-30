<?php

$mysqli = new mysqli("localhost","root","root","sanbox_pelindo");

// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}

$_POST = json_decode(file_get_contents('php://input'), true);

$namalengkap = isset($_POST['namalengkap']) ? $_POST['namalengkap'] : "";
$username = isset($_POST['username']) ? $_POST['username'] : "";
$password = isset($_POST['password']) ? $_POST['password'] : "";
$status = isset($_POST['status']) ? $_POST['status'] : "";

$sql = "INSERT INTO tbl_user (namalengkap, username, password, status)
VALUES ('$namalengkap', '$username', '$password', '$status')";


$query = $mysqli -> query($sql);

if ($query == true) {
	$message = "Data user berhasil tersimpan!";
	$status = 'success';
	
	$data = ['userid' => $userid, 'namalengkap' => $namalengkap, 'username' => $username, 'password' => $password, 'status' => $status];
} else {
	$status = 'failed';
	$message = "Gagal menyimpan data!";
	$data = null;
}

$response = ['status' => $status, 'message' => $message, 'data' => $data];
echo json_encode($response);