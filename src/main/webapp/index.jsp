<%-- 
    Document   : index
    Created on : 11-Feb-2023, 11:02:11 pm
    Author     : Rahul
--%>
<%@page import="com.myshop.dao.ProductDao"%>
<%@page import="com.myshop.dao.CategoryDao"%>
<%@page import="com.myshop.helper.FactoryProvider"%>
<%@page import="com.myshop.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.myshop.entities.Product"%>
<%@page import="com.myshop.entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyShop-Home </title>
        <%@include file="components/comman_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
        
        <div class="row mt-3 mx-2">

            <%
                
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = dao.getAllProducts();
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategorys();
                            
            %>

            <!--show categories-->
            <div class="col-md-2">
                
                
                <div class="list-group mt-4">
                    
                    <a href="#" class="list-group-item list-group-item-action active custom-bg text-white border-0">
                        All Products
                    </a>
                    
                    
                    
                
                    <% for (Category c:clist){
                    %>
                
                    
                    <a href="#" class="list-group-item list-group-item-action "><%= c.getCategoryTitel()  %></a>
                
                
                    <%
                     }
                    %>
                
                </div> 
                
            </div>

            <!--show product-->
            <div class="col-md-10">
                 
                <!--row-->
                <div class="row mt-4">
                    
                    <!--col:12-->
                    <div class="col-md-12">
                        
                        <div class="card-columns">
                            
                            <!--traversing products-->
                            
                            <% 
                            
                            for(Product p:list){
                            
                            %>
                            
                            <div class="card container text-center">
                                
                                
                                <div class="container text-center">
                                    <img src="img/products/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-auto " alt="...">
                                </div>
                                
                                
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName() %></h5>
                                    
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDesc()) %>
                                        
                                    </p>
                                    
                                </div>
                                
                                        <div class="card-footer ">
                                            
                                            <button class="btn custom-bg text-white mt-2">ADD TO CART</button>
                                            <button class="btn btn-outline-primary mt-2">&#8377; <%= p.getpPrice() %></button>
                                            
                                        </div>
                                
                                
                            </div>
                            
                            
                            <%
                                }
                            %>
                            
                        </div>
                        
                        
                    </div>
                    
                    
                    
                </div>
                
                
                
                
            </div>




        </div>

        </div>

    </body>
</html>
