<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="Image/x-icon" href="photo/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css?family=Aoboshi+One&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Asap&display=swap" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Dragon Tattoo</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/login.js"></script>
    <script src="js/registration.js"></script>
</head>
<body>
	<header class="header-menu">
        <nav class="navbar">
            <a href="index.html" class="logo"><img src="images/logo.png" alt=""></a>
        </nav>
    </header>
    <section class="form">
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">
			<div class="signup">
				<form name="register_adm" id="register">
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button type="submit" class="reg" >Sign up</button>
				</form>
			</div>

			<div class="login_adm">
				<form name="login" method="post" id="loginform">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button type="submit" class="reg" >Login</button>
				</form>
			</div>
	</div>
</section>
</body>
</html>