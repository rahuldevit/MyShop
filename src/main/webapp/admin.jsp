<%@page import="com.myshop.dao.CategoryDao"%>
<%@page import="com.myshop.entities.User"%>
<%@page import="com.myshop.entities.Category"%>
<%@page import="com.myshop.helper.FactoryProvider"%>
<%@page import="java.util.List"%>

<%

    User user=(User)session.getAttribute("current-user");
    if(user==null){
        
        session.setAttribute("message","You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message","You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>  
        <%@include file="components/comman_css_js.jsp" %>

    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/invalid.jsp" %>
            </div>


            <!--   first row-->
            <div class="row mt-3">

                <!--  first col-->
                <div class="col-md-4">
                    <div class="card text-center">

                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                            </div>

                            <h1 style="font-size: x-large" >123</h1>
                            <h1 style="font-size: medium" class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>


                </div>

                <!--  second col-->
                <div class="col-md-4">
                    <div class="card text-center">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/categories.png" alt="categories_icon">
                            </div>

                            <h1 style="font-size: x-large" >123</h1>
                            <h1 style="font-size: medium" class="text-uppercase text-muted">Categories</h1>

                        </div>

                    </div>


                </div>

                <!--  third col-->
                <div class="col-md-4">
                    <div class="card text-center">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/products.png" alt="user_icon">
                            </div>

                            <h1 style="font-size: x-large" >123</h1>
                            <h1 style="font-size: medium" class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>


                </div>

            </div>

            <!--Second row First col-->

            <div class="row mt-3">
                <div class="col-md-6">

                    <div class="card text-center" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/AddCategory.png" alt="addcategories_icon">
                            </div>

                            <p style="font-size: smaller" class="mt-2">Click here to add new Category</p>
                            <h1 style="font-size: medium" class="text-uppercase text-muted">Add-Category</h1>

                        </div>

                    </div>

                </div>
                
                <!--Second row : Second col-->

                <div class="col-md-6">

                    <div class="card text-center" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/addproduct.png" alt="addproduct_icon">
                            </div>
                            
                            <p style="font-size: smaller " class="mt-2">Click here to add new Product</p>
                            <h1 style="font-size: medium" class="text-uppercase text-muted">Add-Product</h1>

                        </div>

                    </div>

                </div>


            </div>

        </div>





        <!-- Modal for Add-Category-->

        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />

                            </div>

                            <div class="form-group">
                                <textarea style="height: 200px" class="form-control" placeholder="Enter Category Desciption" name="catDescription" required ></textarea>

                            </div>
                            <div class="container text-center">

                                <button class="btn btn-outline-success" >Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>


                        </form>


                    </div>

                </div>
            </div>
        </div>
        <a href="../../../../../../../C:/Users/Rahul/AppData/Local/Temp/14 19-08 Now playing #14 Designing Add Category form - E Commerce Application using java in Hindi Learn Code With Durgesh 8.1.url"></a>
        <!--  End add category modal-->
        

        <!--  --------------------------------------------------------------------- -->


        <!--   add product modal-->
        
        <!--  product modal-->

        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--  Form -->
                        
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >
                            
                            <input type="hidden" name="operation" value="addproduct"/>
                            
                            <!--  product title/price/Discount/Qnty -->

                            <div class="form-group">

                                <input type="text" class="form-control" name="pName" placeholder="Enter Product Title"  required />
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required />
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required />
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />

                            </div>


                            <!--   product categories-->

                            <%
                             
                            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list = cdao.getCategorys();
                            
                            %>

                            <div class="form-group">
                                <select name="catId" class="form-control" id="">

                                    <%
                                        for(Category c:list){
                                    
                                    %>

                                    <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitel() %></option>

                                    <% 
                                        }
                                    %>

                                </select>

                            </div>


                            <!--   product Desciption -->

                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control" placeholder="Enter Product Desciption" name="pDesc" required ></textarea>

                            </div>

                            <!--   product files -->

                            <div class="form-group">

                                <label for="pPic">Select Pictures of Product</label>
                                <br>
                                <input type="file" id="pPic" class="form-control" name="pImage" required multiple />

                            </div>

                            <!--  Submit button   -->

                            <div class="container text-center">

                                <button class="btn btn-outline-success custom-bg text-white" >Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>

                     <!--  End form -->
                                    
                    </div>

                </div>
            </div>
        </div>

        <!--  End add product modal-->


    </body>
</html>
