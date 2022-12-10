
<?php

     if (isset($_POST["searchItem"])) {
       if ($_POST["searchItem"]) {
         $key = $_POST["searchItem"];
         // create connection
         $conn = mysqli_connect("localhost", "root", "", "groceryStore");
         // check connection
         if (!$conn) {
           die("Connection failed: " . mysqli_connect_error());
         }
         // retrieve the needed data
         $sql = "SELECT Category.Category_Address FROM `ProductItems` INNER JOIN `Category` ON Category.ID_Category = ProductItems.ID_Category  WHERE ProductItems.name LIKE '%$key%'";

         $results = mysqli_query($conn, $sql);

         if ($results) {
            $row = mysqli_fetch_assoc($results);
            $uri = ".$row[Category_Address]";
            // html_redirect location
            header ("location: $uri");
          } else {
            echo mysqli_error($conn);
          }
          mysqli_close($conn); // close connection
        } else {
          echo "<script>alert('Enter your searching item.');</script>";
          // html_redirect location to the previous page
          header("Location: javascript:history.back(-1)");
        }
    }
?>
