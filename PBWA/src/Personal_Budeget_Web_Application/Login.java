package Personal_Budeget_Web_Application;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * @author giocardenas
 *
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	private jdbcDAO Exp1;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		Exp1 = new jdbcDAO(jdbcURL, jdbcUsername, jdbcPassword);
	}
       
    
    public Login() {
    super();
        }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	


		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		
		String passwordEncrypted = Encrysecuryty.encode(userpass);

		response.setContentType("text/html");

		try {
			if (Exp1.validate(username, passwordEncrypted)) {
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.

//			<-------------------SESSION -------------------------->

				request.getSession(true).setAttribute("USER_SESSION", username);

				List<ProductExpense> list1 = Exp1.listAll();
				request.setAttribute("ELIST", list1);

				List<BalanceT> list2 = Exp1.listBalance();
				request.setAttribute("ELISTBAL", list2);
				
				List<LoanGOv> list4 = Exp1.listLoansGov();
				request.setAttribute("ELISTGOV", list4);

				RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
				rd.forward(request, response);
				
			} else {

				request.setAttribute("MESSAGE", "Sorry username or password are incorrect!");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		
	}
}


