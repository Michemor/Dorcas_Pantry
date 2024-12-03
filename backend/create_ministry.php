<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 
require 'connect_db.php';

//form submission halding
if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $jsondata = json_decode(file_get_contents('php://input'), true);
    
    $ministryName = isset($jsondata['name']) ? trim($jsondata['name']) : "";
    $ministryDesc = isset($jsondata['desc']) ? trim($jsondata['desc']) : "";
    $ministryImage = isset($jsondata['image']) ? trim($jsondata['image']) : "";
    
    if(empty($ministryName) || empty($ministryDesc))
    {

        $response = [
            'success' => false,
            'message' => 'Empty Fields'
        ];
        echo  json_encode($response);
        die();
    } else {
        
       
       // insert a new ministry into the database
        $stmt = $con->prepare("INSERT INTO user (ministry_name, ministry_description, ministry_image) VALUES (?, ?)");
        $stmt->bind_param("sss", $ministryName, $ministryDesc, $ministryImage);
        if ($stmt->execute()) {
            $response = [
                'success' => true, 
                'message' => 'Event created successfully'];
            
        } else {
            $response = [ 'success' => false, 'message' => 'Error' . $stmt->error];
            echo json_encode($response);
            $existuser->close();
            $stmt->close();
        }

    }
}
        echo json_encode($response);
        $con->close();

?>
