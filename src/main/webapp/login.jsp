<%-- 
    Document   : login
    Created on : 21-Feb-2023, 1:23:12 am
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login User: MyShop</title>
        <%@include file="components/comman_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-4">
                    <div class="card mt-5">

                        <div class="card-header custom-bg text-white">

                            <h3>LogIn here</h3>

                        </div>

                        <div class="card-body">
                            <%@include file="components/invalid.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="label-form">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <a href="register.jsp" class="text-center d-block mb-2 ">if not register click here</a>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                                </div>

                            </form>

                        </div>

                     
                    </div>

                </div>
            </div>
        </div>


    </body>
</html>
