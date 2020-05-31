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
import javax.servlet.http.HttpSession;

/**
 * @author giocardenas
 *
 */

@WebServlet("/controllerPBWA")
public class controllerPBWA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private jdbcDAO Exp1;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		Exp1 = new jdbcDAO(jdbcURL, jdbcUsername, jdbcPassword);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.removeAttribute("username");

			session.invalidate();

//            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
//            dispatcher.forward(request, response);
			response.sendRedirect("index.jsp");
		}
	}
//<--------- METHOD DOGET-------------->
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {

			case "/register":
				registerInsert(request, response);
				break;
			case "/Loan":
				insertLoan(request, response);
				break;
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertExpense(request, response);
				break;
			case "/insertDep":
				insertDeposit(request, response);
				break;
			case "/delete":
				deleteExpense(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
//			case "/update":
//				updateExpense(request, response);
//				
//				break;
			default:

				listexpenses(request, response);
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

//	 <-----------INSERT GOV LOAN ---------------->
private void insertLoan(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	
	String institutions = request.getParameter("institutions");
	String courses = request.getParameter("courses");
	int numbers = Integer.parseInt(request.getParameter("numbers"));
	
	LoanGOv incomeGovernment = new LoanGOv(institutions,courses,numbers);

	Exp1.insertLoanGov(incomeGovernment);

	response.sendRedirect("list");	
	}

//	<--------------------- lIST METHODS -------------------->

	private void listexpenses(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		List<ProductExpense> list1 = Exp1.listAll();
		request.setAttribute("ELIST", list1);

		List<BalanceT> list2 = Exp1.listBalance();
		request.setAttribute("ELISTBAL", list2);
		
		List<LoanGOv> list4 = Exp1.listLoansGov();
		request.setAttribute("ELISTGOV", list4);

		RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");

		dispatcher.forward(request, response);

	}
	


//
//	private void updateExpense(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException {
//
//		int idUpdated = Integer.parseInt(request.getParameter("id"));
//
//		Double to = Double.parseDouble(request.getParameter("total"));
//		
//		String dat = request.getParameter("dateD");
//		
//		
//		
//
//		BalanceT BalP = new BalanceT( to, dat,idUpdated);
//
//		Exp1.updateExpense(BalP);
//		
//		response.sendRedirect("list");
//
//	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		ProductExpense existingBook = Exp1.getUnique(id);

		RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");

		request.setAttribute("EX1", existingBook);
		dispatcher.forward(request, response);
	}
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");
		dispatcher.forward(request, response);
	}
	// <------------------INSERT METHOD-------------------> //

	private void insertExpense(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String pu = request.getParameter("purpose");
		String cat = request.getParameter("dish");
		Double sum = Double.parseDouble(request.getParameter("sum"));
		String dfec = request.getParameter("date");

		ProductExpense newExp = new ProductExpense(pu, cat, sum, dfec);

		Exp1.insertExp(newExp);

		response.sendRedirect("list");
	}
	// <------------------INSERT REGISTER-------------------> //
	
	private void registerInsert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String Surname = request.getParameter("surname");
		String email = request.getParameter("email");
		
		String password = Encrysecuryty.encode(userpass);
	
		RegisterModel regist = new RegisterModel(username, password, Surname,email);

		Exp1.insertDAOregister(regist);

		response.sendRedirect("index.jsp");
	}
	// <------------------INSERT METHOD Deposit Page-------------------> //
	
	private void insertDeposit(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		Double to = Double.parseDouble(request.getParameter("total"));
		String dfecD = request.getParameter("dateD");

		BalanceT newExp = new BalanceT(to, dfecD);

		Exp1.insertDepositExp(newExp);

		response.sendRedirect("list");

	}
	// <------------------DELETE METHOD -------------------> //
	private void deleteExpense(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int idParse = Integer.parseInt(request.getParameter("id"));

		ProductExpense newExp = new ProductExpense(idParse);

		Exp1.deleteDao(newExp);

		response.sendRedirect("list");
	}
}
