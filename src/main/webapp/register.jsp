<%-- 
    Document   : register
    Created on : 12-Feb-2023, 1:33:32 pm
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
        <%@include file="components/comman_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">

            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        
                        
                        
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/usericon.png" style="max-width: 100px;" class="img-fluid" alt="">
                            </div>

                            <h3 class="text-center my-3">Sign-Up Here !!</h3>

                            <form action="RegisterServlets" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" type="phone" class="form-control" id="phone" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name="user_address" style="height: 150px;" class="form-control" placeholder="Enter your address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>

                            </form>


                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
