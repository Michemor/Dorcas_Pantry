<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 
require 'connect_db.php';

// fetch events from the database
$query = $conn->prepare('SELECT * FROM event');
$query->execute();

$res = $query->get_result();
$events = [];

while($event = $res->fetch_assoc()){
    $events[] = $event;
}

echo json_encode([
    'success' => true,
    'message' => 'Fetched events',
    'events' => $events
]);
mysqli_close($conn);

?>