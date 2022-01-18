<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<tr><td>Transaction Reference No:</td><td><p id="transno"></p></td></tr>
<tr><td>Date:</td><td><p id="date"></p></td></tr>
<tr><td>Status:</td><td>P (Pending)</td></tr>
<tr><td>Transaction Information:</td><td>Transaction was successful</td></tr>
</table>

<a href="userpage.html"><button>Cancel</button></a>
<a href="bankform.html"><button>Back</button></a>
<a href="success.html"><button>Submit</button></a>

<script type="text/javascript">
document.getElementById("transno").innerHTML=Math.floor(Math.random()*1000000000);
d=new Date();
document.getElementById("date").innerHTML=d.getDate()+"/"+(d.getMonth()+1)+"/"+d.getFullYear();
</script>
</body>
</html>