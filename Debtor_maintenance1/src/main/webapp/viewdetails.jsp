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
            select debtordetails.*,date_format(date," %e-%c-%Y / %H:%i ") as date2 from sample1.debtordetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <sql:query dataSource="${dbsource}" var="result2">
            SELECT * from bankdetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>

           
                <h3>DebtorDetails</h3>
                <table>
                <c:forEach var="row" items="${result.rows}">
                  <tr><td>Date & Time of Added/Modified:</td><td><c:out value="${row.date2}"/></td></tr>
                  <tr><td>DebtorID:</td><td> <c:out value="${row.id}"/></td></tr>
                  <tr><td>DebtorName:</td><td> <c:out value="${row.name}"/></td></tr>
                  <tr><td>Address Line 1:</td><td>  <c:out value="${row.address1}"/></td></tr>
                    <tr><td>Address Line 2:</td><td>  <c:out value="${row.address2}"/></td></tr>
                    <tr><td>Fax Number:</td><td>  <c:out value="${row.faxno}"/></td></tr>
                    <tr><td>Phone Number:</td><td>  <c:out value="${row.phno}"/> </td></tr>
                    <tr><td>E-Mail ID:</td><td>  <c:out value="${row.email}"/></td></tr>
                </c:forEach>
                </table>
                
                <h3>BankDetails</h3>
                <table>
                <c:forEach var="row" items="${result2.rows}">
                  <tr><td>Bank Name:</td><td><c:out value="${row.name}"/></td></tr>
                  <tr><td>Branch Name:</td><td><c:out value="${row.branch}"/></td></tr>
                  <tr><td>Swift Address:</td><td><c:out value="${row.address}"/></td></tr>
                  <tr><td>Account Number:</td><td><c:out value="${row.accno}"/></td></tr>
                    <tr><td>Currency Type:</td><td><c:out value="${row.curr}"/></td></tr>
                </c:forEach>
                </table><br>
        <a href="adminview.jsp?id=${param.id}">Go Back</a>
    
</body>
</html>