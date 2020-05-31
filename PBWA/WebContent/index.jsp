<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Index</title>
<!-- google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap"
	rel="stylesheet">
<!-- Font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--  ----------ANIMATE-CDN ----------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- bootraap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">


<!-- customs CSS -->
<link rel="stylesheet" href="http://localhost:8080/PBWA/css/styles.css" />

</head>



<body class="">

	<div
		class=" col-12  col-sm-12 col-md-8  col-lg-8  col-xl-6 d-flex justify-content-center container  ">


		<div class="row d-flex justify-content-center  ">
			<div class="  welcome_tittle text-muted  mt-5  mb-3">
				<h3 class="   text-center animated  fadeInDown delay-2s ">Personal
					budget Web Application</h3>
			</div>

			<div class="container ">
				<div class=" card h-auto ">

					<div class="text-center card-header bg-success rounded shadow  ">
						<h1 class=" text-light my-4 animated flip delay-2s  ">Welcome
							Back!</h1>

					</div>

					<div class="card-body">

						<!-- FORM -->
						<c:choose>
							<c:when test="${username == null }">

								<form class="needs-validation " action="login" method="POST"
									class="user">

									<div class="form-group shadow ">
										<input type="text" name="username" id="validationServer01"
											class="form-control is-valid form-control-user   " required
											aria-describedby="emailHelp" placeholder="Name:">
									</div>

									<div class="form-group shadow">

										<input type="password" name="userpass" id="validationServer01"
											class="form-control is-valid  form-control-user" required
											id="exampleInputPassword" placeholder="Password:">
									</div>
									
									<button type="submit"
										class="btn btn-outline-success btn-lg  btn-block shadow">Login</button>

								</form>

					
				
									<h4  class=" shadow text-center bg-success w-100 alert alert-sucess text-center alert-dismissible fade show mt-2 text-light">
									<c:out value="${MESSAGE}" /></h4>

						
							</c:when>

							<c:otherwise>
								<p>login please</p>
							</c:otherwise>

						</c:choose>
					</div>

					<!-- 	<hr> -->
					<div class="text-center">

						<div class="text-center">
							<!-- register link  -->
							<a class="small" href="register.jsp">Go to register!</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</html>
