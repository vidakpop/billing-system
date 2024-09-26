<?php
// Database configuration
$host = 'localhost';
$dbname = 'byte';
$username = 'root';
$password = 'password';

// Function to update the balance in the database
function update_balance($pdo, $new_balance) {
    $stmt = $pdo->prepare("UPDATE balance SET amount = :new_balance");
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

// Get the cost data from the request
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['cost'])) {
    $cost = floatval($data['cost']);

    // Round off the cost data to one decimal point
    $rounded_cost = round($cost, 1);

    // Add 30% to the rounded cost
    $adjusted_cost = $rounded_cost * 1.3;

    // Get the current balance from the database
    $stmt = $pdo->query("SELECT amount FROM balance LIMIT 1");
    $current_balance = $stmt->fetchColumn();

    // Subtract the adjusted cost from the current balance
    $new_balance = $current_balance - $adjusted_cost;

    // Update the balance in the database
    if (update_balance($pdo, $new_balance)) {
        echo json_encode(['success' => 'Balance updated successfully']);
    } else {
        echo json_encode(['error' => 'Failed to update balance']);
    }
} else {
    echo json_encode(['error' => 'Cost data not provided']);
}
?>
