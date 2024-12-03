<?php
require 'connect.php';

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    // fetches all events from the database
    case 'GET':
        events();
        break;
    // fetches a single event
    case 'POST':
        event();
        break;
    // modifies a single event query
    case 'PUT':
        updateEvent();
        break;
    // deletes an event
    case 'DELETE':
        deleteEvent();
        break;
}


// $ename =$_GET["name"];
// $edescription =$_GET["description"];
// $edate = $_GET["date"];
// $ministryName = $_GET['name'];
// 
// $getMinistryId = $conn->prepare('SELECT ministry_id FROM ministry WHERE ministry_name = ?');
// $getMinistryId->bind_param("s", $ministryName);
// $res = $getMinistryId->execute();
// 
// // query found
// if ($res->num_rows > 0){
//     $row = $res->fetch_assoc();
//     $ministryId = $row['id'];
// 
//     if($ename){
//         $newname = mysqli_query($conn, "UPDATE event SET event_name  = '$ename'");
//     }
// } else {
//     $flag['error'] = "Ministry not found: " . $res->error;
// }
// 
// 
// $flag['success']=0;
// if($res = mysqli_query($con,"update studentlist set sname='$sname' where 
// admissionum='$admissionum'"))
// {
// $flag['success']=1;
// }
// print(json_encode($flag));
// mysqli_close($conn);

?>