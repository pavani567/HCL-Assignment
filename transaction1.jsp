<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.cj.jdbc.Driver";
try {
Class.forName(driver);
}
catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement st = null;
PreparedStatement ps=null,ps2=null,ps3=null;
ResultSet rs2=null,rs3=null;
%>
   

<html>
<body><center>
<p align="center" ><b> TRANSACTION</b></p>


<form action="online_banking" method="POST" align="center">
Transaction type:<input type="radio" id="credited" name="transaction_type" value="credited">
<label for="credited">credit</label>
<input type="radio" id="debit" name="transaction_type" value="debited">
<label for="credited">debit</label>
<input type="radio" id="debit" name="transaction_type" value="debited">
<label for="debited">fund transfer</label>

<br/><br/>
Enter amount :<input type="number" id="amount" name="amount">
<input type="submit" name="submit" id="submit" value="submit"/>
</form>
<%
try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","root");


//String sql ="select * from bank order by Transaction_id desc limit 5";
String sql2="select SUM(amount) FROM banking.transaction where transaction_type='credited' ";
String sql3="select SUM(amount) FROM banking.transaction where transaction_type='debited' ";
ps=con.prepareStatement(sql2);
ps2=con.prepareStatement(sql3);
int i=0,j=0;
//rs = st.executeQuery(sql);
rs2=ps.executeQuery();
rs3=ps2.executeQuery();


while(rs2.next())
{
i=rs2.getInt(1);
 }
while(rs3.next())
{
j=rs3.getInt(1);
 }

%>

<p style="color:red" ><B>AVAILABLE BALANCE : <%= i-j %></B></p>
<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</center>
</body>
</html>