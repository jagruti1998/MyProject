<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 
          <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
                           
        <sql:query dataSource="${dbsource}" var="result2">
            SELECT * from bankdetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>  
           
        <form action="BankServlet">
            <table border="0" width="40%">
                <caption>Edit Bank Details</caption>
                <tr>
                    <th>Bank Name:</th>
                    <th>Branch:</th>
                    <th>Swift Address:</th>
                    <th>Account Number:</th>
                    <th>Currency Type:</th>
                </tr>
                
                 <c:forEach var="row2" items="${result2.rows}" >
                 <input type="hidden" value="${param.id}" name="id" />
                  
                   <tr> 
             <td><input type="text"   value="${row2.name}" name="bank"/></td> 
             <td><input type="text"   value="${row2.branch}" name="branch"/></td> 
             <td><input type="text"  value="${row2.address}" name="address"/></td>
             <td><input type="number"  value="${row2.accno}" name="accno"/></td>
             <td><select name="curr" style="width:155px">
             <option>USD</option>
             <option>INR</option>
             <option>EUR</option>
             <option>RUB</option>
             <option>PKR</option>
             <option>OTHER</option></td>
              </tr>
              
         </c:forEach>  
            </table>
            
            
          <input type="hidden" value="modify" name="action"/>
          <input type="submit" value="submit"/><br><br>
            
            
            
            <a href="view.jsp">Go Back</a>
        </form>
    </body>
</html>      
                            
           