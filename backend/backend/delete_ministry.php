<?php

// Enable CORS headers
// Allow requests from any origin. Replace * with a specific origin if needed (e.g., http://localhost:3000).
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: DELETE"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 
header("Access-Control-Max-Age: 86400"); //

// importing file for connecting to database
require 'connect_db.php';

 if($con->connect_error){
     $error = 'Connection failed with :'.$con->connect_error;
 }

 //deleting is a post request
 if($_SERVER['REQUEST_METHOD'] === 'DELETE'){

    $data = file_get_contents('php://input');

    $ministryId = $data['ministry_id'];

    // how can we fetch the product id from the 
        //deleting data from the database 
        $stmt = $con->prepare("DELETE FROM event WHERE ministry_id = ?");
        $stmt->bind_param("i", $ministryId);

        if ($stmt->execute()) {
            echo json_encode(
                ['success' => true, 
                'message' => 'Product deleted successfully']);
        } else {
            echo json_encode(
                [
                    'success' => false,
                    'message' => 'Error: '. $stmt->error
                ]
                );
        }
        $stmt->close();

    }
$con->close();

?>