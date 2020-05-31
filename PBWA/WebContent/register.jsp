

<!DOCTYPE html>
</html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Orbitron&display=swap" rel="stylesheet">

<!-- Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- bootraap -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


  <!-- customs CSS -->
  <link rel="stylesheet" href="/CSS/styles.css">
  
    <title>Register</title>
</head>
<body>
        <div class="col-12-sm my-5 welcome_tittle ">
                <h1 class=" text-center text-muted animated  fadeInDown delay-2s">Personal Budget Web Application</h1>
         </div>
        <div class="row d-flex justify-content-center row_login_container">
            <div class="col-lg-6 col-sm-6  login_main_container">
               
                <div class="container  ">

                <div class="  card p-3">
                    <div class="text-center card-header bg-success rounded shadow">
                    <h1 class="h1 text-light my-4 animated flip delay-2s ">Register!</h1>
                    </div>

                    <div class="car-body pt-4">
                       
						<!---------FORM REGISTER-------  -->                       
                            <form class="user needs-validation"  action="register" method="get">
                            
                                    <div class="form-group shadow">
                                            <input type="text" class="form-control form-control-user  is-valid " 
                                             id="name" required   id="validationServer01" aria-describedby="name" 
                                             name="username" placeholder="Name..">
                                    </div>

                                    <div class="form-group shadow">
                                            <input type="text" class="form-control form-control-use  is-valid "  required
                                             id="validationServer01"id="surname" aria-describedby="surname"
                                              name="surname"  placeholder="Surname..">
                                    </div>
                                    
                                    <div class="form-group shadow">
                                        <input type="email" class="form-control form-control-user is-valid" id="exampleInputEmail"  required
                                         id="validationServer01" aria-describedby="emailHelp" 
                                          name="email" placeholder="Enter you Email...">
                                    </div>
                                    
                                    <div class="form-group shadow">

                                        <input type="password" class="form-control form-control-user is-valid" id="exampleInputPassword"
                                         id="exampleInputEmail"  required 
                                          name="userpass" placeholder="Password">
             
                                     </div>
                                     
                                     <button type="submit" class="btn btn-outline-success btn-lg  btn-block shadow ">Register</button>
                             </form>       

                    <hr>
                    <div class="text-center ">
                            <!-- register link  -->
                                <a class="small  " href="index.jsp">Already have an Account? <br>Login</a>
                    </div>
                </div>
            </div>
      </div>
    </div>
 </div>
    
</body>
</html>