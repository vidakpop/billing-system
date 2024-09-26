<?php
// Database configuration
$host = 'localhost';
$dbname = 'byte';
$username = 'root';
$password = 'password';

// Function to get the balance from the database
function get_balance($pdo) {
    try {
        $stmt = $pdo->prepare("SELECT amount FROM balance LIMIT 1");
        $stmt->execute();
        
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            if (is_numeric($result['amount'])) {
                return floatval($result['amount']);
            } else {
                throw new Exception('Amount is not numeric');
            }
        } else {
            throw new Exception('No results found');
        }
    } catch (PDOException $e) {
        // Return error if the query fails
        throw new Exception('Query Error: ' . $e->getMessage());
    }
}

$response = array();

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Get the balance
    $balance = get_balance($pdo);
    $response['balance'] = $balance;
} catch (PDOException $e) {
    // Return error if the connection fails
    $response['error'] = 'Connection failed: ' . $e->getMessage();
} catch (Exception $e) {
    // Handle other exceptions
    $response['error'] = 'Failed to retrieve balance: ' . $e->getMessage();
}

// Output the response in JSON format
header('Content-Type: application/json');
echo json_encode($response);
?>
