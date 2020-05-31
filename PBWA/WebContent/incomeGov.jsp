<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Cache-Control" content="no-store, must-revalidate" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <!-- google Fonts-->
            <link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&family=Julius+Sans+One&family=Open+Sans+Condensed:ital,wght@0,300;0,700;1,300&display=swap" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap"
            rel="stylesheet">

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
        <!-- <link rel="stylesheet" href="http://localhost:8080/PBWA/css/styles.css" /> -->
        <link rel="stylesheet" href="/income.css">
        
        <title>income seccion</title>
    </head>
<body >
  <div class="container pt-5 ">
    <div class="jumbotron  container text-light bg-success  col-md-8 col-lg-8 col-xl-5 shadow mt-2 ">
        <h1 class="display-5 text-center  text-center animated   fadeInDown delay-2s">Student Income</h1>
        <p class="lead text-center  animated   flip delay-2s ">Manage Government incomes!</p>
        <!-- <hr class="my-2"> -->
     </div>
     <div class=" card container col-md-8 col-lg-8 col-xl-5 p-2 shadow">

    	<!------------FORM STUDENT INCOME----------->
      <form class="needs-validation  " action="Loan" method="get">
      
        <div class="form-group mt-2 ">
          <label for="exampleFormControlSelect1">Government Departaments</label>
          <select class="form-control   is-valid " id="exampleFormControlSelect1" id="validationServer01" name="institutions" required>
            <option value="UCAS">UCAS</option>
            <option value="SFE">SFE</option>
            <option value="BirckbeckGrand">Birckbeck Grand</option>
            <option value="others">Other Support</option>
         
          </select>
        </div>

        <div class="form-group ">
            <label for="exampleFormControlSelect1">Course</label>
            <select class="form-control is-valid" id="exampleFormControlSelect1" id="validationServer01" name="courses" required>
              <option value="partTime">Part Time</option>
              <option value="fullTime">Full Time</option>
           
            </select>
          </div>

        <div class="form-group ">
          <label for="exampleFormControlSelect2">Amount</label>
          <select multiple class="form-control    is-valid text-muted" id="exampleFormControlSelect2 " name="numbers" id="validationServer01" required>
           
            <option>5860</option>
            <option>13000</option>
            <option>200</option>
            <option>1520</option>
            <option>2345</option>
           
          </select>
        </div>
        <button type="submit" class="btn btn-outline-success btn-block shadow  ">Submit</button>
   
      </form>
    </div>
  </div>
</body>
</html>