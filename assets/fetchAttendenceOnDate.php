<?php
include('config.php');
$response = array();

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $jsonData = file_get_contents('php://input');
    $decodedData = json_decode($jsonData, true); 
    $class = $decodedData['class'];
    $section = $decodedData['section'];
    $date = $decodedData['date'];
    $begin = (int) ($decodedData['begin']);
    $limit = (int) ($decodedData['limit']);
    $dateObject = new DateTime($date);      // it gets todays date
    $day = $dateObject->format('d');
    $month = $dateObject->format('m');
    $year = $dateObject->format('Y');

    if ($class == "all" && $section == "all") {
        $query = "SELECT * FROM `attendence` ";
        $stmt = mysqli_prepare($conn, $query);
        mysqli_stmt_execute($stmt);
       $result = mysqli_stmt_get_result($stmt);
    } 
    else {
        // Correctly construct the query for pagination
        $query = "SELECT * FROM `attendence` WHERE (`class`=? AND `section`=?) AND (DAY(`date`)=? AND MONTH(`date`)=? AND YEAR(`date`)=?) ORDER BY `s_no` ASC LIMIT ? OFFSET ?";
        // Prepare the statement and bind parameters
        $stmt = mysqli_prepare($conn, $query);
        mysqli_stmt_bind_param($stmt, "sssssii", $class, $section, $day, $month, $year, $limit, $begin);
        // Execute the query
        mysqli_stmt_execute($stmt);
        // Fetch the result
         $result = mysqli_stmt_get_result($stmt);
    }
    
    // $response[0] = $rowCount;
    // mysqli_stmt_close($stmt1);
    
    $result = mysqli_stmt_get_result($stmt);

    if(mysqli_num_rows($result) > 0){
       
        $counter = 1;
        while($row = mysqli_fetch_assoc($result)){

            $studentId = $row['student_id'];

            $query2 = "SELECT `fname`, `lname`, `image` FROM `students` WHERE `id`=?";
            $stmt2 = mysqli_prepare($conn, $query2);
            mysqli_stmt_bind_param($stmt2, "s", $studentId);
        
            mysqli_stmt_execute($stmt2);
            $result2 = mysqli_stmt_get_result($stmt2);
            mysqli_stmt_close($stmt2);

            if(mysqli_num_rows($result2) > 0){
                $row2 = mysqli_fetch_assoc($result2);


                $pathToFile = ".." . DIRECTORY_SEPARATOR . "studentUploads" . DIRECTORY_SEPARATOR . $row2['image'];

                if (!file_exists($pathToFile)) {
                    $pathToFile = "../images/user.png";
                }

                $status = $row['attendence'] == "0" ? ' <div class="absent">Absent</div>':' <div class="present">Present</div>';

                $response[$counter] = '  <tr>
                <td>'.((int)$begin) + 1 .'.&nbsp;&nbsp;</td>
                <td>'.$studentId.'</td>
                <td class="user">
                    <img src="'.$pathToFile.'">
                    <p>' . ucfirst(strtolower($row2['fname'])). " " .strtolower($row2['lname']) . '</p>
                </td>

                <td>
                    '.$status.'
                </td>
            </tr>';
            }else{
                $response[0] = "No_Data";
            }
            $counter++;
            $begin++;
        }
    }else{

        $response[0] = "No_Data";
    }


} else {
    $response[0] = "Something went wrong!2";
}


echo json_encode($response);


?>