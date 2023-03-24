/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.myshop.servlets;

import com.myshop.dao.CategoryDao;
import com.myshop.dao.ProductDao;
import com.myshop.entities.Category;
import com.myshop.entities.Product;
import com.myshop.helper.FactoryProvider;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Rahul
 */

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Servlet 2:
            // add category
            // add product
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                //add category

                //fetching category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitel(title);
                category.setCategoryDescription(description);
                
                //category save to database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                
                int catId = categoryDao.saveCategory(category);
//                out.println("Category Saved !!");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Category added successfully !! "+"<br> Category Id is: "+catId);
                response.sendRedirect("admin.jsp");
                return; 
            } else if (op.trim().equals("addproduct")) {
                //add product
                //product work coding
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pImage");
                        
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpPhoto(pDesc);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //get category by id
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                
                p.setCategory(category);
                
                //product save
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                //pic upload
                //find out the path to  upload photo
                ServletContext context = request.getServletContext();
                String path = context.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path );
               
                
                //uploading code
                
                try {
               
                FileOutputStream fos=new FileOutputStream(path);
                InputStream is = part.getInputStream();
                
                //reading data
                byte[]data=new byte[is.available()];
                is.read(data);
                
                //writing the data
                fos.write(data);
                fos.close();
                is.close();
                
                
                } catch (Exception e) {
                    e.printStackTrace();
                }
               
               
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Product added successfully !! "+"<br> Category Id is: "+catId);
                response.sendRedirect("admin.jsp");
                return; 
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
