<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 

require 'connect_db.php';

//form submission halding
if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $user = json_decode(file_get_contents('php://input'), true);

    $firstname = isset($user['fname']) ? trim($user['fname']) : "";
    $lastname = isset($user['lname']) ? trim($user['lname']) : "";
    $email = isset($user['email']) ? trim($user['email']) : "";
    $phone = isset($user['phone']) ? trim($user['phone']) : "";
    $password = isset($user['pass']) ? trim($user['pass']) : "";
    
    if(empty($firstname) || empty($lastname) || empty($email) || empty($phone) || empty($password) || empty($confirmpassword))
    {

        $response = [
            'code' => 0,
            'message' => 'Empty Fields'
        ];
        echo  json_encode($response);
        die();
    }

    if($password !== $confirmpassword){
        $response = [
            'code'=> 1,
            'message' => 'Password do not match'
        ];
        echo json_encode($response);
        die();
    } else {
        // check whether such a user exists
        $existuser  = $con->prepare("SELECT user_id FROM user WHERE user_email = ?");
        $existuser->bind_param("s", $email);
        $existuser->execute();
        $result = $existuser->get_result();

        if($result->num_rows > 0) {

            $response = [
                'code' => 0,
                'message' => 'User already exists'
            ];
            echo json_encode($response);
            die();
        } 
        $encrypt_password = password_hash($password, PASSWORD_BCRYPT);
        //inserting data into the database and preventing sqlinjections idk who would try injecting a class project :laughs
        $stmt = $con->prepare("INSERT INTO user (user_firstname, user_lastname, user_email, user_contact, password) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $firstname, $lastname, $email, $phone, $encrypt_password);
        if ($stmt->execute()) {
            $response = [
                'code' => 1, 
                'message' => 'User created successfully'];
            
        } else {
            $response = [ 'code' => 0, 'message' => 'Error' . $stmt->error];
            echo json_encode($response);
            $existuser->close();
            $stmt->close();
        }

    }
}
        echo json_encode($response);
        $con->close();

?>
