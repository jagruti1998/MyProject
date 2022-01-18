<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <form action="DebtorServlet">
 <input type="hidden" value="${param.id}" name="id">
 <input type="hidden" name="action" value="delete">
 <h3>Do u really want to delete ?</h3>
 <a href="view.jsp">Cancel</a>
 <input type="submit" value="Confirm">
 </form>
</body>
</html>