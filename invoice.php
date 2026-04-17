<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

include('includes/config.php');

if(strlen($_SESSION['login'])==0) {   
    header('location:index.php');
} else {

$bid = intval($_GET['bid']);

// ✅ Correct Query (NO BookingDate)
$sql = "SELECT tblbooking.BookingId as bookid,
               tblusers.FullName,
               tblusers.MobileNumber,
               tblusers.EmailId,
               tbltourpackages.PackageName,
               tbltourpackages.PackagePrice,
               tblbooking.FromDate,
               tblbooking.ToDate,
               tblbooking.Comment,
               tblbooking.status
        FROM tblbooking
        JOIN tblusers ON tblusers.EmailId = tblbooking.UserEmail
        JOIN tbltourpackages ON tbltourpackages.PackageId = tblbooking.PackageId
        WHERE tblbooking.BookingId = :bid";

$query = $dbh->prepare($sql);
$query->bindParam(':bid', $bid, PDO::PARAM_STR);
$query->execute();
$result = $query->fetch(PDO::FETCH_OBJ);

// ❌ No data check
if(!$result){
    echo "No invoice data found!";
    exit;
}
?>

<!DOCTYPE html>
<html>
    <style>
body {
    background: #eef2f7;
}

.invoice-box {
    background: #ffffff;
    padding: 40px;
    margin: 40px auto;
    width: 70%;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    font-family: Arial;
}

h2 {
    text-align: center;
    font-size: 30px;
    font-weight: bold;
}

h4 {
    font-size: 20px;
    font-weight: bold;
    margin-top: 20px;
}

p {
    font-size: 18px;
    font-weight: bold;
}

.section {
    background: #f2f2f2;
    padding: 15px;
    margin-top: 15px;
    border-radius: 8px;
}

.total-box {
    background: green;
    color: white;
    padding: 15px;
    margin-top: 20px;
    font-size: 22px;
    text-align: right;
    border-radius: 8px;
}
</style>
<head>
<title>Invoice</title>

<!-- <link href="css/bootstrap.css" rel="stylesheet"> -->

<style>
body {
    background: #eef2f7;
    font-family: 'Segoe UI', sans-serif;
}

.invoice-box {
    background: #fff;
    padding: 40px;
    margin: 40px auto;
    width: 70%;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.logo {
    font-size: 22px;
    font-weight: bold;
    color: #2c3e50;
}

.invoice-title {
    font-size: 28px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px;
}

.section {
    background: #f8fafc;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 15px;
}

h4 {
    margin-bottom: 10px;
    font-weight: bold;
    color: #34495e;
}

p {
    margin: 5px 0;
    font-size: 16px;
}

.status {
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 5px;
}

.confirmed {
    background: #d4edda;
    color: #155724;
}

.pending {
    background: #fff3cd;
    color: #856404;
}

.total-box {
    background: #28a745;
    color: white;
    padding: 15px;
    font-size: 22px;
    font-weight: bold;
    text-align: right;
    border-radius: 8px;
}

.print-btn {
    margin-bottom: 20px;
}

@media print {
    .print-btn {
        display: none;
    }
}
</style>

<script>
function printInvoice() {
    window.print();
}
</script>

</head>

<body>

<div class="container invoice-box">

    <button class="btn btn-success print-btn" onclick="printInvoice()">🖨️ Print Invoice</button>

    <h2>Tour Booking Invoice</h2>
    <hr>

    <p><strong>Invoice No:</strong> INV-<?php echo $result->bookid; ?></p>

    <div class="section">
        <h4>User Details</h4>
        <p><strong>Name:</strong> <?php echo $result->FullName; ?></p>
        <p><strong>Email:</strong> <?php echo $result->EmailId; ?></p>
        <p><strong>Mobile:</strong> <?php echo $result->MobileNumber; ?></p>
    </div>

    <div class="section">
        <h4>Booking Details</h4>
        <p><strong>From:</strong> <?php echo $result->FromDate; ?></p>
        <p><strong>To:</strong> <?php echo $result->ToDate; ?></p>
        <p><strong>Status:</strong>
            <?php
            if($result->status == 0) echo "Pending";
            elseif($result->status == 1) echo "Confirmed";
            else echo "Cancelled";
            ?>
        </p>
    </div>

    <div class="section">
        <h4>Package Details</h4>
        <p><strong>Package Name:</strong> <?php echo $result->PackageName; ?></p>
        <p><strong>Price:</strong> ₹<?php echo $result->PackagePrice; ?></p>
    </div>

    <div class="total-box">
        Total Amount: ₹<?php echo $result->PackagePrice; ?>
    </div>

    <div class="section">
        <p><strong>Comment:</strong> <?php echo $result->Comment; ?></p>
    </div>

</div>

</body>
</html>

<?php } ?>