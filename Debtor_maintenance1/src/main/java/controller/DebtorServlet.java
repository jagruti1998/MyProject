package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DebtorDao;
import Model.Debtor;

/**
 * Servlet implementation class DebtorServlet
 */
@WebServlet("/DebtorServlet")
public class DebtorServlet extends HttpServlet {
	DebtorDao db=new DebtorDao();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebtorServlet() {
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
		
		case "delete":
			delete(request,response);
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
        Debtor  data=new Debtor();
		
		data.setName(request.getParameter("name"));
		data.setAddress1(request.getParameter("address1"));
		data.setAddress2(request.getParameter("address2"));
		data.setFaxno(request.getParameter("faxno"));
		data.setPhno(request.getParameter("phno"));
		data.setEmail(request.getParameter("email"));
		int i= db.save(data); 
		System.out.println(i);
		if(i>0){
		response.sendRedirect("bankform.jsp?phno="+request.getParameter("phno"));
	    }  
		else{
	        System.out.println("invalid");
			response.sendRedirect("debtorform.html");
			}
		}
	
	protected void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Debtor  data=new Debtor();
		
		data.setName(request.getParameter("name"));
		data.setId(request.getParameter("id"));
		data.setAddress1(request.getParameter("address1"));
		data.setAddress2(request.getParameter("address2"));
		data.setFaxno(request.getParameter("faxno"));
		data.setPhno(request.getParameter("phno"));
		data.setEmail(request.getParameter("email"));
			int i= db.change(data); 
			System.out.println(i);
			if(i>0){
			response.sendRedirect("view.jsp");
		    }  
			else{ response.sendRedirect("editdebtor.jsp"); }
		 
			
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int id=Integer.parseInt(request.getParameter("id"));
		 
			  int i=db.delete(id);
			  if(i>0){
	  			  response.sendRedirect("view.jsp");
	          }else
	           {
	        	  System.out.println("Error");
	        	  response.sendRedirect("view.jsp"); }
	}
}
