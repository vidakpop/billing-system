<?php
// Function to generate a unique license key
function generateLicenseKey($length = 5) {
    $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $licenseKey = 'ISP24-';

    for ($i = 0; $i < $length; $i++) {
        $licenseKey .= $characters[rand(0, strlen($characters) - 1)];
    }

    return $licenseKey;
}

// Function to create a user and generate a license
function createUserAndLicense($username, $durationDays) {
    $servername = "localhost";
    $dbusername = "root";
    $dbpassword = "password";
    $dbname = "users";

    // Establish database connection
    $conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Generate license key
    $licenseKey = generateLicenseKey();

    // Calculate expiry date
    $expiryDate = date('Y-m-d', strtotime("+" . $durationDays . " days"));

    // Create user folder (assuming a base path)
    $basePath = "/var/www/html/";
    $userPath = $basePath . $username;

    // Check if user folder already exists
    if (!file_exists($userPath)) {
        if (!mkdir($userPath, 0777, true)) {
            die("Failed to create user folder at " . $userPath);
        }

        // Insert user into database
        $stmt = $conn->prepare("INSERT INTO users (username, folder_path) VALUES (?, ?)");
        $stmt->bind_param("ss", $username, $userPath);
        if (!$stmt->execute()) {
            die("Failed to insert user into database: " . $stmt->error);
        }
        $stmt->close();

        // Insert license into database
        $userId = $conn->insert_id;
        $stmt = $conn->prepare("INSERT INTO licenses (user_id, license_key, expiry_date) VALUES (?, ?, ?)");
        $stmt->bind_param("iss", $userId, $licenseKey, $expiryDate);
        if (!$stmt->execute()) {
            die("Failed to insert license into database: " . $stmt->error);
        }
        $stmt->close();

        // Store license in a file inside user's folder
        $licenseFilePath = $userPath . "/license.txt";
        if (file_put_contents($licenseFilePath, "License Key: " . $licenseKey . "\nExpiry Date: " . $expiryDate) === false) {
            die("Failed to store license in file: " . $licenseFilePath);
        }

        echo "User folder created at " . $userPath . "<br>";
        echo "License created for " . $username . " with key: " . $licenseKey;
    } else {
        echo "User folder already exists at " . $userPath;
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User and License Management</title>
</head>
<body>
    <h1>User and License Management</h1>

    <h2>Create User and License</h2>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="duration">License Duration (days):</label>
        <input type="number" id="duration" name="duration" required><br>
        <button type="submit" name="submit">Create User and License</button>
    </form>

    <?php
    if (isset($_POST['submit'])) {
        $username = $_POST['username'];
        $duration = $_POST['duration'];
        createUserAndLicense($username, $duration);
    }
    ?>
</body>
</html>
