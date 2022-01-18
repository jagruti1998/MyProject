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
            select row_number() over() as no,date_format(date," %e-%c-%Y / %H:%i ") as date2,status,name,id from sample1.debtordetails
            order by date desc;
        </sql:query>

    
        <form>
            <table border="1" width="40%">
                <caption>DebtorDetails</caption>
                <tr>
                    <th>sno</th>
                    <th>Date & Time</th>
                    <th>Debtor Name</th>
                    <th>Status</th>
                    <th>action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                       <td><c:out value="${row.no}"/></td>
                       <td><c:out value="${row.date2}"/></td>
                       <td><c:out value="${row.name}"/></td>
                       <td><c:out value="${row.status}"/></td>
                       <td><a href="adminview.jsp?id=${row.id}">select</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="login.html">Log Out</a>
    
</body>
</html>