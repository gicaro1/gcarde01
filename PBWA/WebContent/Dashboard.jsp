<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<%-- <%@ page  import="java.awt.*" %> --%>
<%@ page import="java.io.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.data.general.*"%>


<html>
<head>

<meta http-equiv="Cache-Control" content="no-store, must-revalidate" />



<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap"
	rel="stylesheet">
<!--  ----------ANIMATE-CDN ----------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- Font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootraap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">

<!-- StylesSheet  -->
<link rel="stylesheet" href="http://localhost:8080/PBWA/css/styles.css" />

<title>Dashboard</title>
</head>

<body>
	<div class="container-fluid">

		<div class="row ">
			<div class="col-sm-2 bg-success side_bar  text-light" id="myDIV">

				<div class="col-12-sm  col-3-sm py-1 d-inline-flex logo_col">
					<img src="img/household-budget-logo.png"
						class="logo mt-3 animated  flip delay-2s " alt="">
					<h6 class="text-light  d-flex   pbwa_tittle ">PBWA</h6>

				</div>
				<hr class="hr_line bg-light">
				<h6 class="das_t">Dashboard</h6>
				<hr class="hr_line bg-light">
				<div class="col-12 interface">
					<div>
						<h6 class="features_tittle animated  fadeInLeft delay-2s">Government</h6>
						<a class="text-light" href="incomeGov.jsp"><i
							class="fa fa-folder p-2 ml-3 h6 "></i>GOV</a><br>
						<hr class="hr_line bg-light">
					</div>

					<!-- ------ SIDE LEFT  BAR  -->
					<h6 class="features_tittle animated  fadeInLeft delay-3s">Cash</h6>
					<a class="text-light" href="deposit.jsp"><i
						class="fa fa-wrench p-2 ml-3 h6"></i>Dep</a><br>
					<hr class="hr_line bg-light">

					<h6 class="features_tittle animated  fadeInLeft delay-5s">Recomendations</h6>
					<a class="text-light " href="tips.jsp"><i
						class="fa fa-table p-2 ml-3 h6  "></i>Tips</a>
				</div>
				<hr class="hr_line bg-light">
			</div>

			<!-- ---------------- TOP BAR  SEARCH - PROFILE - PIC - ICON AND SESSION NAME-------------------->
			
			<div class=" col-md-10  bg-light">

				<div class="row shadow  nav_top ">
					<div class="container d-flex justify-content-between">

						<div class="container" onclick="myFunction(this)">
							<div class="bar1"></div>
							<div class="bar2"></div>
							<div class="bar3"></div>
						</div>

						<div class="col-xs-2   p-3 w-40  d-flex  ">
							<a href="mailto:someone@example.com"><i
								class="fa fa-envelope  p-2"></i></a> <a href="#"><i
								class="fa fa-bell  p-2"></i></a>
						</div>

						<div class="col-xs-4  d-flex profile_img_wrapper  text-center">

							<img class="profile_pic  " src="img/profile2.jpeg" alt="">
							<p class="d-flex  profile_name  text-muted font-italic text-capitalize">
								<c:out value="${USER_SESSION}" />
							</p>
						</div>
					</div>
				</div>
				
				

				<!------------- CATEGORY VARIABLES  -------------->
				<c:set var="TransporTotal" value="${0}" />
				<c:set var="TravelTotal" value="${0}" />
				<c:set var="HomeTotal" value="${0}" />
				<c:set var="total" value="${0}" />
				

				<!-------  FOR LOOP CATEGORY EXPENSES --------->
				<c:forEach var="temp" items="${ELIST}">
					<c:choose>
					
						<c:when test="${temp.category eq 'transport'}">
							<c:set var="TransporTotal" value="${TransporTotal + temp.sum}" />
							<c:set var="total" value="${total - temp.sum}" />
						</c:when>

						<c:when test="${temp.category eq 'Travel'}">
							<c:set var="TravelTotal" value="${TravelTotal + temp.sum}" />

							<c:set var="total" value="${total - temp.sum}" />
						</c:when>

						<c:otherwise>
							<c:set var="HomeTotal" value="${HomeTotal + temp.sum}" />
							<c:set var="total" value="${total - temp.sum}" />
						</c:otherwise>
						
					</c:choose>
				</c:forEach>
				<!--------- FOR EACH LOOP FOR DEPOSIT TABLE ----------  -->
				<c:forEach var="tempB" items="${ELISTBAL}">
					<c:set var="total" value="${total + tempB.total}" />
				</c:forEach>
		
				<!--------- FOR EACH LOOP FOR INCOME TABLE ----------  -->
				<c:forEach var="tempC" items="${ELISTGOV}">
					<c:set var="total" value="${total + tempC.govFigures}" />
				</c:forEach>
	
				<!-----------------LOGOUT BUTTON-------------  -->

				<div class=" justify-content-between container-fluid containerFluidLogout ">

					<div class="Dashboard_tittle_container text-center">
						<h1 class="text-right pt-3 Dashboard_tittle text-center animated  fadeInRight delay-5s">Dashboard</h1>
					</div>

					<div class="text-center ">
						<form action="logout" method="post">
							<!-- <i class="fa fa-home"></i> -->
							<input type="submit" value="logout"
								class="btn btn-outline-danger btn-sm  logout_btn shadow " />
						</form>
					</div>
				</div>
				<!--------- EXPENSES SECTION TRAVEL-TRANSPOR-BALANCE-HOME  -->


				<!-- ------------BALANCE ------------ -->

				<div class=" container-fluid">
					<div class="row  pb-3 balance_section">
						<div class="col bg-light m-2 shadow p-2  border_line  d-flex">
							<div class="col-xs-2  w-50  h-40 text-center">
								<h4>Balance</h4>
								<h5 id="transp"><i class="fa fa-dollar pr-1"></i><c:out value="${total}" /></h5>
							</div>
							
							<div class="col-xs-2 w-50">
								<i class="fa fa-money fa-3x d-flex justify-content-center mt-3 pl-5 transport_logo "></i>
							</div>
						</div>
						<!-- ------------TRANSPORT  ------------ -->

						<div class="col bg-light m-2 shadow p-2 border_line1 d-flex">
							<div class="col-xs-2  w-50 text-center">
								<h4>Transport</h4>
								<h5 id='trans'><i class="fa fa-dollar pr-1"></i><c:out value="${TransporTotal}" /></h5>
							</div>
							
							<div class="col-xs-2 w-50">
								<i class="fa fa-bus fa-3x d-flex justify-content-center mt-3 pl-5  transport_logo"></i>
							</div>
						</div>
						<!-------------- HOME  ------------ -->

						<div class="col bg-light m-2 shadow p-2 border_line2 d-flex">
							<div class="col-xs-2 w-50 text-center ml-1">
								<h4 class="ml-1">Home</h4>
								<h5><i class="fa fa-dollar pr-1"></i><c:out value="${HomeTotal}" /></h5>
								<i class="fas fa-pound-sign"></i>
							</div>

							<div class="col-xs-2 w-50">
								<i class="fa fa-home fa-3x d-flex justify-content-center mt-3 pl-5 transport_logo "></i>
							</div>
						</div>

						<!-- --------------TRAVEL ------------ -->
						<div class=" col  bg-light m-2 shadow p-2 border_line3 d-flex">
							<div class="col-xs-4  w-50 text-center">
								<h4>Travel</h4>
								<h5><i class="fa fa-dollar h5_text_site_bar pr-1"></i><c:out value="${TravelTotal}" /></h5>
							</div>
							
							<div class="col-xs-4 w-50">
								<i class="fa fa-plane fa-3x d-flex justify-content-center mt-3 pl-5  transport_logo"></i>
							</div>
						</div>
					</div>
				</div>

	
				<!------- CHARTS---------->
				<div class="row  ">


					<!-- BAR CHART -->
					<div class=" col-12 col-xl-8 col-lg-7  col-md-12  table_section  ">
						<div class="card shadow mb-4 secondary_table">
							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between position-sticky">
								<h6 class="m-0 font-weight-bold text-primary ">Bar Chart</h6>
							</div>

							<table class=" chart ">

								<div>
									<div class="p-2 chart_dashboard_bar " id="columnchart_material" style="width: 550px; height: 350px;"></div>
								</div>
							</table>
						</div>
					</div>

					<!------------ PIE CHART ------------->
					<div class="col-xl-4 col-lg-5  table_section ">
						<div class="card shadow mb-4">

							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Pie Chart</h6>
							</div>

							<div class="card-body d-flex justify-content-center "> <!-- CHECK THIS LINE  -->
								<div class="mb-4" id="piechart" style="width: 330px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- ----------------- TABLE EXPENSES------------------ -->

				<div class="row  ">
					<div class=" col-12 col-sm-12  col-md-8 col-lg-7 col-xl-8  table_section ">
						<div class="card shadow mb-4 secondary_table ">

							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between position-sticky">
								<h6 class="m-0 font-weight-bold text-primary ">Records</h6>
							</div>

							<table class="table table-bordered table-striped ">
								<thead class="thead-light ">

									<tr class="bg-light  sticky-top ">
										<th class="hide" scope="col">ID</th>
										<th scope="col">Purpose</th>
										<th scope="col">Category</th>
										<th scope="col">Sum</th>
										<th scope="col">Date</th>
										<th scope="col">Actions</th>
									</tr>

								</thead>
								
								<tbody class="p-4 ">
									<!-- -----------FOR LOOP 2 ------------ -->
									<c:forEach var="temp" items="${ELIST}">

										<tr>
											<td class="hide"><c:out value="${temp.id} " /></td>
											<td><c:out value="${temp.purpose}" /></td>
											<td><c:out value="${temp.category}" /></td>
											<td><c:out value="${temp.sum}" /></td>
											<td class="date_record_table"><c:out value="${temp.dfec}" /></td>
											
												<!-- DELETE AND EDIT LINKS  -->
											<td><a href="edit?id=<c:out value='${temp.id}' />"
												class="btn-warning">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
												href="delete?id=<c:out value='${temp.id}' />"
												class="btn-delete">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<!------------ FORM------------->
					<div class="col-xl-4 col-lg-5  table_section">
						<div class="card shadow mb-4">

							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">form Expenses</h6>
							</div>

							<div class="card-body">
								<form class="needs-validation" action="insert" method="get">

									<c:if test="${EX1 != null}">
										<input type="hidden" name="id" value="<c:out value='${EX1.id}' />" />
									</c:if>

									<div class="form-group ">
										<label for="pwd">Purpose</label>
										 <input type="text" id="validationServer01" name="purpose" size="45"
										 class="form-control is-valid " class="form-control is-valid"
										 required id="amount" value="<c:out value='${EX1.purpose}' />" />
									</div>

									<div class="form-group">
										<label for="pwd">Sum</label>
										 <input type="text" name="sum" id="validationServer01" class="form-control is-valid"
										 required id="amount" size="5"
										 value="<c:out value='${EX1.sum}' />" />
									</div>

									<div class="form-group d-flex align-items-center rounded">
										<label class="p-2 m-1 text-muted rounded shadow is-valid">Date</label>
										<input type="date" name="date" max="3000-12-31" min="1000-01-01" class="form-control shadow"
										 id="validationServer01" required>
									</div>
							</div>

							<!--------- RADIO BUTTONS ------  -->

							<div
								class="d-flex justify-space-around  align-items-center container ">

								<div class="form-check mr-4 text-center">
									<label class="form-check-label"> <input type="radio"
										id="validationServer01" class="form-check-input is-valid"
										required name="dish" value="transport">Transport
									</label>
								</div>

								<div class="form-check mr-4">
									<label class="form-check-label"> <input type="radio"
										id="validationServer01" class="form-check-input is-valid"
										required name="dish" value="home"> Home
									</label>
								</div>

								<div class="form-check mr-4">
									<label class="form-check-label"> <input type="radio"
										id="validationServer01" class="form-check-input is-valid"
										required name="dish" value="Travel"> Travel
									</label>
								</div>

							</div>
							<button type="submit" class="btn btn-success btn-block mt-4 "
								value="Submit">Submit</button>

							</form>

						</div>
					</div>
				</div>

				<!---------  PROGRESS BARS ---------  -->
					<div class="card-header    py-3">
						<h6 class="m-0 font-weight-bold text-primary">Bar Expenses</h6>
					</div>
					<div class="  container  mb-3 shadow p-3 card-header">

					<div class="progress mb-2 ">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated bg-success"
							role="progressbar" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100" style="width: 22%">
							Transport:<c:out value="${TransporTotal/100}" />%
						</div>
					</div>

					<div class="progress mb-2 ">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated bg-primary"
							role="progressbar" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100" style="width: 34%">
							Travel:<c:out value="${TravelTotal/100}" />%
						</div>
					</div>

					<div class="progress mb-2 ">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
							role="progressbar" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100" style="width: 46%">
							Home:<c:out value="${HomeTotal/100}" />%
						</div>
					</div>

					<div class="progress mb-2 ">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
							role="progressbar" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100" style="width: 85%">
							Total:<c:out value="${total/1000}" />%
						</div>
					</div>
				</div>

				<!--------DEPOSIT TABLE  -->
	
				<div class=" card-header text-muted d-flex m-1 ">
					<h6 class="  col-xl-12 font-weight-bold    text-left text-primary  ">Deposit Table</h6>
				</div>
				
				<div class=" card-header text-muted d-flex  ">
					<h6 class="  col-5 ml-0  font-weight-bold  text-center text-primary ">Deposit</h6>
					<h6 class=" col-7  font-weight-bold  text-center text-primary ">Date</h6>
				</div>

				<div class=" col-xl-12 col-lg-12 table_section text-center ">
					<div class=" row shadow mb-4    secondary_table_deposit ">

						<table class="table table-bordered table-striped  ">

							<tbody>
								<c:forEach var="tempB" items="${ELISTBAL}">

									<tr>
										<td class="hide"><c:out value="${tempB.id}" /></td>
										<td>£<c:out value="${tempB.total} " /></td>
										<td><c:out value="${tempB.dfecdep}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!---------- MAP--------->
				<div class="row ">
					<div class="col-xl-8 col-lg-7">
						<div class="card shadow mb-4">

							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Map</h6>
							</div>

							<iframe class="w-100 "
								src="https://www.google.com/maps/d/embed?mid=1XrwiOsj8gnAD6Nry_XEg8j3LCYxULrAZ"
								width="640" height="480"></iframe>
						</div>
					</div>
					
					<!---------------------- SOCIAL MEDIA------------------  -->
					<div class="col-xl-4 col-lg-5 table_section">
						<div class="card shadow mb-4">

							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Social Media</h6>
							</div>
							
							<img src="img/social.svg" class="social_img mt-4" alt="">
							<!-- Card Body -->
							<div
								class="card-body text-center d-flex justify-content-around d-block">
								<a href="https://en-gb.facebook.com/"><i
									class="fa fa-facebook social_icon fa-3x d-block"></i>Facebook</a> <a
									href="https://www.instagram.com/accounts/login/?hl=en"> <i
									class="fa fa-instagram social_icon fa-3x d-block social_icon"></i>Instagram
								</a> <a href="https://www.instagram.com/accounts/login/?hl=en">
									<i class="fa fa-twitter  social_icon fa-3x d-block social_icon"></i>Twitter
								</a>
							</div>
						</div>
					</div>
				</div>

				<!---------- INCOME GOV TABLE------------>
				<div class=" card-header text-muted d-flex m-1 ">
					<h6 class="  col-12  col-md-6 col-xl-12  col-lg-12 font-weight-bold  text-left text-primary ">Government  Scholarship Table</h6>
				</div>
				
				<div class=" card-header text-muted d-flex ">
					<h6 class="  col-5 ml-0  font-weight-bold  text-center text-primary ">Loan</h6>
					<h6 class=" col-4  font-weight-bold  text-center text-primary ">Date</h6>
					<h6 class=" col-3  font-weight-bold  text-center text-primary ">Amount</h6>
				</div>

				<div class=" col-xl-12 col-lg-12  table_section text-center ">
					<div class=" row shadow mb-4    secondary_table_deposit ">
						<table class="table table-bordered table-striped  ">

							<tbody>
								<c:forEach var="tempC" items="${ELISTGOV}">
									<tr>
										<td><c:out value="${tempC.institutions} " /></td>
										<td><c:out value="${tempC.partFullTime}" /></td>
										<td>£ <c:out value="${tempC.govFigures}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-------UCAS BAR FINANCE  FINANCIAL  SUPPORT------->
				
				<div class="row  ">
					<div class="col-xl-12  text-center  ">

						<div class="bg-primary  p-4 m-2 shadow rounded ">
							<a class="text-light" href="https://www.ucas.com/">UCAS</a>
						</div>
						
						<div class=" bg-success p-4 m-2 shadow rounded">
							<a class="text-light" href="https://www.gov.uk/student-finance">STUDENT FINANCE</a>
						</div>

						<div class="bg-danger p-4 m-2 shadow  rounded">
							<a class="text-light" href="https://www.ukcisa.org.uk/">UKCISA</a>
						</div>

						<div class=" bg-warning p-4 m-2 shadow rounded">
							<a class="text-light"
								href="http://www.bbk.ac.uk/student-services/financial-support">BIRKBECK FINANCIAL SUPPORT</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-------- FOOTER ------ -->
	<div class="text-muted  bg-dark  mt-1 shadow">
		<div class="footer-copyright text-center   py-3">
			© 2020 Copyright: <a class="text-muted"
				href="https://mdbootstrap.com/"> PBWA</a>
		</div>
	</div>


	<!--TOOGGLE JAVASCRIPT -->
	<script>
		function myFunction(x) {
			x.classList.toggle("change");
			var x = document.getElementById("myDIV");
			if (x.style.display === "block") {
				x.style.display = "none";
			} else {
				x.style.display = "block";
			}
		}
	</script>

	
			


<!---------- CHARTS JAVASCRIPT GOOGLE CHART API   -->

<!-- PIE CHART -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	var trans = document.getElementById('transp');
	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'category' ],
				[ 'Transport', <c:out value="${TransporTotal}" /> ],

				[ 'Home', <c:out value="${HomeTotal}" /> ],
				[ 'Travel', <c:out value="${TravelTotal}" /> ],
		]);
		var options = {
			title : 'Personal Budget Web Application',
			subtitle : ',Expenses, 2020',
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		chart.draw(data, options);
	}
</script>

<!-- BAR CHART -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Year', 'Transport', 'Home', 'Travel' ],
				[ '2020', <c:out value="${TransporTotal}" />,
						<c:out value="${HomeTotal}" />,
						<c:out value="${TravelTotal}" /> ]
		]);
		var options = {
			chart : {
				title : 'Personal Budget Web Application',
				subtitle : ' Deposit Bar Chart',
			}
		};
		var chart = new google.charts.Bar(document
				.getElementById('columnchart_material'));
		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>
<!-- CHART API  LINKS   -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</body>
</html>


