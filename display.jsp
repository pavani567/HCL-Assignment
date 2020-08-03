<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

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
PreparedStatement ps=null,ps1=null;
ResultSet rs = null,rs2=null,rs1=null;


%>
<!DOCTYPE html>
<html>
<body>
<p align="center" ><b> TRANSACTIONS</b></p><center>
<table border="1"><tr style="color:blue"><td>Transaction_id</td><td>credited/debited</td><td>amount</td></tr>

<%
try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","root");
st=con.createStatement();
String sql ="SELECT * FROM banking.transaction ORDER BY transaction_id DESC LIMIT 5";
String sql1="select sum(amount) from banking.transaction where transaction_type='credited'";
String sql2="select sum(amount) from banking.transaction where transaction_type='debited'";
rs = st.executeQuery(sql);
ps=con.prepareStatement(sql1);
ps1=con.prepareStatement(sql2);

int i=0,j=0;
rs1=ps.executeQuery();
rs2=ps1.executeQuery();

while(rs.next()){
%>
<tr >
<td align="center"><%=rs.getInt("transaction_id") %></td>
<td align="center"><%=rs.getString("transaction_type") %></td>
<td align="center"><%=rs.getInt("amount") %></td>
</tr>
<%
}
%>
</table>
<%
while(rs1.next())
{
	i=rs1.getInt(1);
}
while(rs2.next()){
	j=rs2.getInt(1);
}
%>
<br/><br/><p style="color:red"><b>AVAILABLE BALANCE : <%=i-j %></b></p>
<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</center>



</body>
</html>