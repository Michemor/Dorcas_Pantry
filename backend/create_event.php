<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 
require 'connect_db.php';

//form submission halding
if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $jsondata = json_decode(file_get_contents('php://input'), true);
    
    $ename = isset($jsondata['name']) ? trim($jsondata['name']) : "";
    $edescription = isset($jsondata['desc']) ? trim($jsondata['desc']) : "";
    $evenue = isset($jsondata['venue']) ? trim($jsondata['venue']) : "";
    $edate = isset($jsondata['date']) ? trim($jsondata['date']) : "";
    $estarttime = isset($jsondata['start']) ? trim($jsondata['start']) : "";
    $eendtime = isset($jsondata['end']) ? trim($jsondata['end']) : "";
    $eimage = isset($jsondata['eimage']) ? trim($jsondata['eimage']) : "";
    $ministryName = isset($jsondata['minname']) ? trim($jsondata['minname']) : "";
    $minId;
    
    if(empty($ministryName))
    {

        $response = [
            'success' => true,
            'message' => 'Empty Fields'
        ];
        echo  json_encode($response);
        die();
    } else {
        
       $query = $con->prepare("SELECT ministry_id FROM ministry WHERE ministry_name = ?");
       $query->bind_param("s", $ministryName);
       if($query->execute()){
        $res = $query->get_result();
        if($res->num_rows == 1){
            $minId = $res->fetch_assoc();
        }
       }
       // insert a new ministry into the database
        $stmt = $con->prepare("INSERT INTO event (event_name, event_description, event_venue, event_date, event_starttime, event_endtime, event_image) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $ename,$edescription, $evenue, $edate, $eendtime, $estarttime, $eimage);

        if ($stmt->execute()) {
            $response = [
                'code' => 1, 
                'message' => 'Event created successfully',
            ];
        } else {
            $response = [
                'success' => false, 
                'message' => 'Error' . $stmt->error];
            echo json_encode($response);
            $existuser->close();
            $stmt->close();
        }

    }
}
        echo json_encode($response);
        $con->close();

?>
