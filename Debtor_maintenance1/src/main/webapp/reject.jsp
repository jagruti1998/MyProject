<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Reject Reason</h3>
<form action="AdminServlet">
<input type="hidden" name="id" value="${param.id}"/>
<input type="hidden" name="action" value="reject"/>
<input type="text" name="reason">
<input type="submit" value="submit">
</form>
</body>
</html>