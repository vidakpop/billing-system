<?php
// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the raw POST data
    $postData = file_get_contents('php://input');

    // Log the raw data for debugging (optional)
    file_put_contents('mpesa_callback.log', $postData);

    // Decode the JSON data
    $callbackData = json_decode($postData, true);

    // Check if decoding was successful
    if ($callbackData === null && json_last_error() !== JSON_ERROR_NONE) {
        // Handle JSON decoding error
        http_response_code(400); // Bad Request
        echo 'Error: Invalid JSON data';
        exit;
    }

    // Extract relevant data from the callback
    $transactionId = $callbackData['TransactionId'];
    $amount = $callbackData['Amount'];
    $phoneNumber = $callbackData['PhoneNumber'];
    $status = $callbackData['Status'];

    // Perform further processing based on your application's logic
    // For example, update the database, send notifications, etc.

    // Send a response to acknowledge receipt of the callback
    http_response_code(200); // OK
    echo 'Callback received successfully';

    // Display transaction details in HTML format
    echo '<h2>Transaction Details</h2>';
    echo '<p><strong>Transaction ID:</strong> ' . $transactionId . '</p>';
    echo '<p><strong>Amount:</strong> ' . $amount . '</p>';
    echo '<p><strong>Phone Number:</strong> ' . $phoneNumber . '</p>';
    echo '<p><strong>Status:</strong> ' . $status . '</p>';
} else {
    // Handle invalid request method
    http_response_code(405); // Method Not Allowed
    echo 'Error: Invalid request method';
}
?>
