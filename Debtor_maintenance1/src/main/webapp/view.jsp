<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>SELECT Operation</title>
        
    </head>
    <body>
 
         <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            select debtordetails.*,date_format(date," %e-%c-%Y / %H:%i ") as date2 from sample1.debtordetails
            order by date desc;
        </sql:query>

    
        <form>
            <table border="1" width="40%">
                <caption>DebtorDetails</caption>
                <tr>
                    <th>Date & Time of Added/Modified</th>
                    <th>DebtorID</th>
                    <th>DebtorName</th>
                    <th>Address Line 1</th>
                    <th>Address Line 2</th>
                    <th>Fax Number</th>
                    <th>Phone Number</th>
                    <th>E-Mail ID</th>
                    <th>Status</th>
                    <th>Reason</th>
                    <th colspan="4">Modify and more</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                       <td><c:out value="${row.date2}"/></td>
                        <td><c:out value="${row.id}"/></td>
                        <td><c:out value="${row.name}"/></td>
                         <td><c:out value="${row.address1}"/></td>
                          <td><c:out value="${row.address2}"/></td>
                            <td><c:out value="${row.faxno}"/></td>
                              <td><c:out value="${row.phno}"/></td>
                                <td><c:out value="${row.email}"/></td>
                                <td><c:out value="${row.status}"/></td>
                                  <td><c:out value="${row.reason}"/></td>
                        <td><a href="viewaccount.jsp?id=${row.id}">View Bank Details</a></td>
                        <td><a href= "editdebtor.jsp?id=${row.id}">Edit Debtor Details</a></td>
                        <td><a href= "editbank.jsp?id=${row.id}">Edit Bank Details</a></td> 
                        <td><a href= "remove.jsp?id=${row.id}">remove</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="userpage.html">Go Back</a>
    
</body>
</html>