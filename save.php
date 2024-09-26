<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "password";
$database = "byte";

// Create a new database connection
$conn = new mysqli($servername, $username, $password, $database);

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the response from the previous code
    $response = file_get_contents('php://input');

    // Parse the response data
    $responseData = json_decode($response, true);

    // Extract the relevant data from the response
    $fromUser = 'ByteRadius';
    $toUser = isset($responseData['data']['to']) ? $responseData['data']['to'] : null;
    $message = isset($responseData['data']['message']) ? $responseData['data']['message'] : null;
    $title = 'SMS from ByteRadius';
    $status = isset($responseData['data']['status']) && $responseData['data']['status'] == 'Delivered' ? 1 : 0;
    $date = isset($responseData['data']['created_at']) ? $responseData['data']['created_at'] : null;

    // Prepare the SQL statement to insert the response into the database
    $sql = "INSERT INTO response_table (from_user, to_user, message, title, status, date) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $fromUser, $toUser, $message, $title, $status, $date);

    // Execute the SQL statement
    if ($stmt->execute()) {
        echo "Response saved to the database successfully.";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close the prepared statement
    $stmt->close();
} else {
    echo "Invalid request method.";
}

// Close the database connection
$conn->close();