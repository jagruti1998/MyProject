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
            SELECT * from bankdetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
    
        <form>
            <table border="1" width="40%">
                <caption>BankDetails</caption>
                <tr>
                    <th>Bank Name</th>
                    <th>Branch Name</th>
                    <th>Swift Address</th>
                    <th>Account Number</th>
                    <th>Currency Type</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.branch}"/></td>
                         <td><c:out value="${row.address}"/></td>
                          <td><c:out value="${row.accno}"/></td> 
                           <td><c:out value="${row.curr}"/></td> 
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="view.jsp">Go Back</a>
    
</body>
</html>