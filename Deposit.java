package com.action;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DatabaseConnection;


/**
 * Servlet implementation class Deposit
 */
@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		double deposit =Double.parseDouble(request.getParameter("deposit"));
		double withdraw =Double.parseDouble(request.getParameter("withdraw"));


	double balance = 0;
	if(deposit==0.00)
	{

		try {
		PreparedStatement ps = DatabaseConnection.getCon().prepareStatement("select * from account");
		//ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			
			double now=rs.getDouble("balance");
			balance=now;
		}
		System.out.println("username is: " + balance);
}
		catch (SQLException e) {
			e.printStackTrace();
		}  
      balance=balance-withdraw;
    		  ;
	try {
		
		
		
		PreparedStatement ps = DatabaseConnection.getCon().prepareStatement("insert into account (deposit,withdraw,balance)values (?,?,?)");
		//ps.setInt(1, id);
	
		
		
		ps.setDouble(1, deposit);
		ps.setDouble(2, withdraw);
		ps.setDouble(3, balance);
		
		
		ps.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
		
}

	request.setAttribute("score", balance);
	request.setAttribute("balance", "back");
	request.getRequestDispatcher("withdraw.jsp").forward(request, response);
	}
	else
	{
try {
		
		
		
		PreparedStatement ps = DatabaseConnection.getCon().prepareStatement("select * from account");
		//ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			
			double now=rs.getDouble("balance");
			balance=now;
		}
		System.out.println("username is: " + balance);
}
		catch (SQLException e) {
			e.printStackTrace();
		}  
      balance=balance+deposit
    		  ;
	try {
		
		
		
		PreparedStatement ps = DatabaseConnection.getCon().prepareStatement("insert into account (deposit,withdraw,balance)values (?,?,?)");
		//ps.setInt(1, id);
	
		
		
		ps.setDouble(1, deposit);
		ps.setDouble(2, withdraw);
		ps.setDouble(3, balance);
		
		
		ps.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}  
	request.setAttribute("score", balance);
	request.setAttribute("balance", "back");
	request.getRequestDispatcher("deposit.jsp").forward(request, response);
	}
	
	
}
}


