<?php
header('Content-Type: aplication/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

// importing file for connecting to database
require_once 'connect_db.php';
// fetches the data we use to login


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $email = isset($data['email']) ? trim($data['email']) : '' ;
    $password = isset($data['password']) ? trim($data['password']) : '' ;
}

if(empty($email) || empty($password)){
    $response = [
        'success' => false, 
        'message' => 'Empty fields'];
    echo json_encode($response);
    exit;
}
// Query to fetch user records based on phone and password
$query = $con->prepare("SELECT user_firstname, user_lastname, user_email, user_contact, user_password FROM user WHERE user_email = ?");
$query->bind_param("s", $email);
$query->execute();
$result = $query->get_result();

// if the number of rows is greater than 1, then we do have a user present
if ($result->num_rows === 1) {

 // Fetch user details
 $user = $result->fetch_assoc();

 // check whether the user has the same password as the one stored
 if (password_verify($password, $user['user_password'])) {

    // remove the password from the response string
    unset($user['user_password']);

    $response = [
        'success' => true,
        'message' => 'Password correct',
        'userdetails' => $user
    ];

 } else {
    $response = [
        'success' => false,
        'message' => "Invalid Password"];
 }
 } else {
    $response = [
        'success' => 0,
        'message' => 'User not found',
    ];
 // Return error response if credentials are invalid
 }

echo json_encode($response);
$query->close();
mysqli_close($con);

?>