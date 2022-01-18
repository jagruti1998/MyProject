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
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from debtordetails where id=?;
            <sql:param value="${param.id}" />
        
        </sql:query>   
           
        <form action="DebtorServlet">
            <table border="0" width="40%">
                <caption>Edit Debtor Details</caption>
                <tr>
                    <!-- <th>Debtor ID:</th> -->
                    <th>Debtor Name:</th>
                    <th>Address Line 1:</th>
                    <th>Address Line 2:</th>
                    <th>Fax Number:</th>
                    <th>Phone Number:</th>
                    <th>E-Mail ID:</th>
                </tr>
                
                 <c:forEach var="row" items="${result.rows}" >  
                <input type="hidden" value="${param.id}" name="id" />
             
                   <tr> 
             <td><input type="text"   value="${row.name}" name="name"/></td> 
             <td><input type="text"   value="${row.address1}" name="address1"/></td> 
             <td><input type="text"  value="${row.address2}" name="address2"/></td>
             <td><input type="number"  value="${row.faxno}" name="faxno"/></td>
             <td><input type="number"  value="${row.phno}" name="phno"/></td>
             <td><input type="email"  value="${row.email}" name="email"/></td>
              </tr>
              
         </c:forEach>  
            </table>
            
            
          <input type="hidden" value="modify" name="action"/>
          <input type="submit" value="submit"/><br><br>
            
            
            <a href="view.jsp">Go Back</a>
        </form>
    </body>
</html>      
                            
           