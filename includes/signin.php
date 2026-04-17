<style>
.modal-content {
    background: #04152d !important;
    border-radius: 15px;
    box-shadow: 0 0 25px #00f0ff;
    padding: 20px;
}

.modal-body {
    text-align: center;
}

.modal-body h3 {
    color: #00f0ff;
    margin-bottom: 20px;
}

.login-right input[type="email"],
.login-right input[type="password"] {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 25px;
    border: none;
    outline: none;
    background: #1e2a38;
    color: white;
}

.login-right input::placeholder {
    color: #aaa;
}

.login-right input[type="submit"] {
    width: 60%;
    padding: 10px;
    border-radius: 25px;
    border: none;
    background: linear-gradient(45deg, #00f0ff, #008cff);
    color: black;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.login-right input[type="submit"]:hover {
    box-shadow: 0 0 15px #00f0ff;
}

.modal-body a {
    color: #00f0ff;
}

.close {
    color: white !important;
    opacity: 1;
}
</style>
<?php
session_start();
if(isset($_POST['signin']))
{
$email=$_POST['email'];
$password=md5($_POST['password']);
$sql ="SELECT EmailId,Password FROM tblusers WHERE EmailId=:email and Password=:password";
$query= $dbh -> prepare($sql);
$query-> bindParam(':email', $email, PDO::PARAM_STR);
$query-> bindParam(':password', $password, PDO::PARAM_STR);
$query-> execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
$_SESSION['login']=$_POST['email'];
echo "<script type='text/javascript'> document.location = 'package-list.php'; </script>";
} else{
	
	echo "<script>alert('Invalid Details');</script>";

}

}

?>

<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-right">
										<form method="post">
											<h3>Sign In</h3>
	<input type="email" name="email" id="email" placeholder="Enter your Email"  required="">	
	<input type="password" name="password" id="password" placeholder="Password" value="" required="">	
											<h4><a href="forgot-password.php">Forgot password</a></h4>
											
											<input type="submit" name="signin" value="SIGNIN">
										</form>
									</div>
									<div class="clearfix"></div>								
								</div>
								<p>By logging in you agree to our <a href="page.php?type=terms">Terms and Conditions</a> and <a href="page.php?type=privacy">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>