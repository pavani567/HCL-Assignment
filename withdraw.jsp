<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
</head>
<body>
<form method="get" action="Deposit">
<div align="center">
<a href="deposit.jsp">Deposit</a>
<a href="withdraw.jsp">Withdraw</a>
<a href="ministatement">ministatement</a>
<h2>Withdraw</h2>
<input type="hidden" name="deposit" value="0.00"/>
<p>Enter Amount:</p><input type="number" name="withdraw">
<input type="submit" value="submit">
<c:if test="${balance eq 'back'}">
		<p>Your withdraw is sucsessfull and your final balance is  ${score}</p>
		</c:if>
</div>
</form>
</body>
</html>