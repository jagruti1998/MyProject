<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
input[type=submit]{
 background-color: Navy;
}
input[type=reset]{
 background-color: yellow;
}
input[type=buttom]{
 background-color: green;
}
</style>
</head>
<body class="p-3 mb-2 bg-secondary">
<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT id from debtordetails where phno=?;
            <sql:param value="${param.phno}" />
        </sql:query>  
        
<form action="BankServlet" class="p-3 mb-2 bg-primary" >
<h3>Bank and Account Details</h3>
<table>
<c:forEach var="row" items="${result.rows}" >
<input type="hidden" value="${row.id}" name="id" />
</c:forEach>  
<tr><td><label for="bname">Bank Name:</label></td><td><input type="text" name="bank" id="bname"/></td></tr>
<tr><td><label for="bbname">Branch Name:</label></td><td><input type="text" name="branch" id="bbname"/></td></tr>
<tr><td><label for="badd">Swift Address:</label></td><td><input type="text" name="address" id="badd"/></td></tr>
<tr><td><label for="bacc">Account Number:</label></td><td><input type="number" name="accno" id="bacc"/></td></tr>
<tr><td><label for="bcurr">Currency Type:</label></td>
<td>
<select name="curr" style="width:155px">
<option>USD</option>
<option>INR</option>
<option>EUR</option>
<option>RUB</option>
<option>PKR</option>
<option>OTHER</option>
</select>
</td></tr>
</table>
<input type="reset" class="btn btn-white" value="Clear">
<input type="submit" class="btn btn-primary" value="Submit">
<input type="hidden" name="action" value="insert"/>
</form>
</body>
</html>