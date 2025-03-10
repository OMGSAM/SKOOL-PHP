<?php
include("config.php");
$response = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $uniqueId = "S" . time();
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $father = $_POST["father"];

    $dobString = $_POST["dob"];
    $timestamp = strtotime($dobString);
    $dob = date('d-m-Y', $timestamp);

    $gender = $_POST["gender"];
    $class = $_POST["class"];
    $section = $_POST["section"];
    $imageName = "1701517055user.png";
    $allowedExtensions = ['png', 'jpeg', 'jpg'];

    $phone = $_POST["phone"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $city = $_POST["city"];
    $zip = $_POST["zip"];
    $state = $_POST["state"];
    $guardian = $_POST["guardian"];
    $gphone = $_POST["gphone"];
    $gaddress = $_POST["gaddress"];
    $gcity = $_POST["gcity"];
    $gzip = $_POST["gzip"];
    $relation = $_POST["relation"];

    $uploadDone = true;
    $invalidFormat = false;

    $sql = "SELECT * FROM users WHERE email=?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) > 0) {
        echo 'Email already exists!';
    } else {

        if (isset($_FILES["image"]) && $_FILES["image"]["error"] == 0) {

            $filename = $_FILES["image"]["name"];
            $tempname = $_FILES["image"]["tmp_name"];

            $fileInfo = pathinfo($filename);
            $fileExtension = strtolower($fileInfo['extension']);

            if (in_array($fileExtension, $allowedExtensions)) {
                $newName = $uniqueId . time() . "." . $fileExtension;

                $folder =  __DIR__ . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "studentUploads" . DIRECTORY_SEPARATOR .  $newName;

                if (move_uploaded_file($tempname, $folder)) {
                    $uploadDone = true;
                    $imageName = $newName;
                } else {
                    $uploadDone = false;
                }
                $invalidFormat = false;
            } else {
                $response =  "Invalid image format! (jpg, png, jpeg)";
                $invalidFormat = true;
            }
        }

        if (!$invalidFormat) {
        
            
            $addTeacherDetailQuery = "INSERT INTO `students` (`s_no`, `id`, `fname`, `lname`, `class`,`section`, `subject`, `gender`, `dob`, `phone`, `email`, `address`, `city`, `zip`, `state`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
         $stmt = mysqli_prepare($conn, $addTeacherDetailQuery);
        mysqli_stmt_bind_param($stmt, "ssssssssssssss", $uniqueId, $fname, $lname, $class , $section, $subject, $gender, $dob, $phone, $email, $address, $city, $zip, $state);
        mysqli_stmt_execute($stmt);
            // $stmt = mysqli_prepare($conn, $addGuardianDetailQuery);
            // mysqli_stmt_bind_param($stmt, "sssssss", $uniqueId, $guardian, $gphone, $gaddress, $gcity, $gzip, $relation);
            // mysqli_stmt_execute($stmt);

            // $password = str_replace("-", "", $dob);
            // $passwordHash = password_hash($password, PASSWORD_DEFAULT);

            // $addUserDetailQuery = "INSERT INTO `users` (`s_no`, `id`, `email`, `password_hash`, `role`, `theme`) VALUES (NULL, ?, ?, ?, 'student', 'light')";

            // $stmt = mysqli_prepare($conn, $addUserDetailQuery);
            // mysqli_stmt_bind_param($stmt, "sss", $uniqueId, $email, $passwordHash);
            // mysqli_stmt_execute($stmt);

            if (mysqli_stmt_execute($stmt)) {
                $response = 'success';

                if (!$uploadDone) {
                    $response = "Image upload failed! (Student successfully added)";
                }
            } else {
                 
                $response = 'Error -STMT NOT EXECUTED';
                die("Statement preparation failed: " . mysqli_error($conn));
            }
        }
    }
} else {
    $response  = "Invalid request!";
}

echo $response;
?>
