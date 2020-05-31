<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- media queries  -->
  
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Orbitron&display=swap" rel="stylesheet">
<!-- Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootraap -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


  <!-- customs CSS -->
  <link rel="stylesheet" href="/CSS/styles.css">
    <title>Deposit</title>
</head>

	 <body> 
        <div class="row  d-flex justify-content-center row_login_container ">
            <div class="col-lg-5  A  ">
                <div class="container   ">
   
                <div class="  card p-3 mt-3 login_main_container shadow rounded  card_container">
                
                        <div class="col-12-sm   welcome_tittle text-muted  ">
                                <h1 class=" text-center py-3 ">Deposit</h1>
                        </div>
                        
                    <div class="text-center card-header bg-success rounded shadow">
                   			 <h1 class="h1 text-light my-4  card_welcome_tittle ">Add Cash!</h1>
                    </div>

                    <div class="car-body pt-3">
                            <form class=" needs-validation user"  action="insertDep"   method="get">
                       
                                    <div class="form-group shadow">
                                        <input type="text" class="form-control form-control-user is-valid" name="total" placeholder="amount" class="form-control is-valid"   required >
                                    </div>
                             
                                    <div class="form-group d-flex align-items-center rounded">
                                        <label class="p-2 m-1 text-muted rounded shadow is-valid" >Date</label>
                                         <input type="date" name="dateD" max="3000-12-31" 
                                               min="1000-01-01" class="form-control shadow"  id="validationServer01"   required  >
                                       </div> 
                                                                      
                                    <button type="submit" class="btn btn-outline-success btn-lg  btn-block shadow">Deposit</button>                            
                             </form>
                    </div>
             
                    <hr>
                </div>
            </div>
      </div>
    </div>
</body>

</body>
</html>