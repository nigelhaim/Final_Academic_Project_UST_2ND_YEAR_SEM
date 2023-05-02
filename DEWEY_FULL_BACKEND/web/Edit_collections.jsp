<%-- 
    Document   : Edit_collections
    Created on : 05 1, 23, 8:49:42 PM
    Author     : nigel
--%>
<%@page import="java.io.OutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            img{
                height: 200px;
                width: 150px;
            }
        </style>
        <h1>Insert a book</h1>
        <h1>List of Books</h1>
        <form action="Edit_Book_Details" method="POST">
            <table border="1" align="center">
                <tr>
                    <th></th>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Book cover</th>
                </tr>
                
                <%
                ResultSet r = (ResultSet)request.getAttribute("books");
                while(r.next())
                { %>
                <tr>
                    <td><input type="checkbox" id="book" name="book" value="<%=r.getString("BOOK_ID") %>"></td>
                    <td><%=r.getString("BOOK_ID") %> </td>
                    <td><%=r.getString("BOOK_TITLE") %> </td>
                    <td><%=r.getString("BOOK_AUTHOR") %> </td>
                    <td><%=r.getString("BOOK_TYPE") %> </td>
                    <td><%=r.getString("BOOK_DESCRIPTION") %> </td>
                    <td><%=r.getString("BOOK_QUANTITY") %> </td>
                    <td>
                        <img src="RenderImage?BOOK_ID=<%=r.getString("BOOK_ID")%>">
                    </td
                </tr>
                <% }
                %>
            </table>
        </form>
        <br>
        <br>
        <form action="Edit_Collections" method="POST" enctype="multipart/form-data">
            <h1>Book title:</h1><input type="text" name="title" placeholder="title">
            <br>
            <h1>Book author:</h1><input type="text" name="author" placeholder="author">
            <br>
            <h1>Book Type</h1>
            <select name="type">
                <option></option>
                <option>Literature</option>
                <option>Sci-fi</option>
                <option>Educational</option>
            </select>
            <br>
            <input name="description" placeholder="description">
             <br>
             <input name="quantity" placeholder="quantity">
             <br>
            <input type="file" name="cover">
             <br>
            <input type="submit" value="Upload Book">
        </form>
        
        <form action="BookList" method="POST">
            <input type="submit" value="Go to the list of books">
        </form>
    </body>
</html>