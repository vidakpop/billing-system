<?php
// Database configuration
$host = 'localhost';
$dbname = 'isp';
$username = 'root';
$password = 'password';

// Function to update the balance in the database
function update_balance($pdo, $new_balance) {
    $stmt = $pdo->prepare("UPDATE balance SET amount = amount + :new_balance");
    $stmt->bindParam(':new_balance', $new_balance);
    $stmt->execute();
    
    return $stmt->rowCount() === 1;
}

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Connection failed: ' . $e->getMessage()]);
    exit;
}

// Get the amount data from the request
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['amount'])) {
    $amount = floatval($data['amount']);

    // Update the balance in the database
    if (update_balance($pdo, $amount)) {
        echo json_encode(['success' => 'Balance updated successfully']);
    } else {
        echo json_encode(['error' => 'Failed to update balance']);
    }
} else {
    echo json_encode(['error' => 'Amount data not provided']);
}
?>
