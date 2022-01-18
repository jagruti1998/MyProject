package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BankDao;
import Model.Bank;

/**
 * Servlet implementation class BankServlet
 */
@WebServlet("/BankServlet")
public class BankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BankDao db=new BankDao();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BankServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		System.out.println(action);
		switch(action)
		{
		case "insert":
			insert(request,response);
		    break;
		
		case "modify":
			  modify(request,response);
		      break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Bank data=new Bank(); 
	    data.setId(request.getParameter("id"));
		data.setBank(request.getParameter("bank"));
		data.setBranch(request.getParameter("branch"));
		data.setAddress(request.getParameter("address"));
		data.setAccno(request.getParameter("accno"));
		data.setCurr(request.getParameter("curr"));
		int i= db.save(data); 
		System.out.println(i);
		if(i>0){
		response.sendRedirect("review.jsp");
	    }  
		else{
	        System.out.println("invalid");
			response.sendRedirect("bankform.html");
			}
		}
	
	protected void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Bank data=new Bank(); 
	    data.setId(request.getParameter("id"));
		data.setBank(request.getParameter("bank"));
		data.setBranch(request.getParameter("branch"));
		data.setAddress(request.getParameter("address"));
		data.setAccno(request.getParameter("accno"));
		data.setCurr(request.getParameter("curr"));
			int i= db.change(data); 
			System.out.println(i);
			if(i>0){
			response.sendRedirect("view.jsp");
		    }  
			else{ response.sendRedirect("editbank.jsp"); }
		 
			
	}
}
