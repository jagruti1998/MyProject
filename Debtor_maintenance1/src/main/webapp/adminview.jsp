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
            SELECT debtordetails.*,date_format(date," %e-%c-%Y & %H:%i ") as date2 from debtordetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query> 
                <h2>DebtorDetails</h2>
                <table>
                <c:forEach var="row" items="${result.rows}" > 
                <tr><td>Debtor Name:</td><td>${row.name}</td></tr>
                <tr><td>Debtor ID:</td><td>${row.id}</td></tr>
                <tr><td>Status:</td><td>${row.status}</td></tr>
                <tr><td>Date & Time of Added/Modified:</td><td>${row.date2}</td></tr>
                <tr><td><a href="viewdetails.jsp?id=${row.id}">View Details</a></td></tr>
                 <tr><td> <a href="authorizepage.jsp"><button>Cancel</button></a> <br><br>
                 <form action="reject.jsp?id=${row.id}">
                <input type="hidden" name="id" value="${row.id}"/>
                <input type="submit" value="Reject">
                </form><br>
                <form action="AdminServlet">
                <input type="hidden" name="action" value="authorize"/>
                <input type="hidden" name="id" value="${row.id}"/>
                <input type="submit" value="Authorize">
                </form></td></tr>
                </c:forEach>
                </table>
</body>
</html>