<%
    String message = (String) session.getAttribute("message");
    if(message!=null){
    
    
        //print
        
        //out.println(message);
        
%>   

<div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Welcome to MyShop !!</h4>
    <strong> <%= message%> </strong>
    <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>
    <hr>
    <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
</div>  


<%
        session.removeAttribute("message");
    }
    



%>