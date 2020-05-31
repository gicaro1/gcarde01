package Personal_Budeget_Web_Application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author giocardenas
 *
 */

// <------- CLASS CONNECTION PROVIDE ALL THE PARAMETER  AND FUNCTIONALITY TO CONNECT TO MySql ---------->
public class jdbcDAO {

	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public jdbcDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}
	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
	}
	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
//	<----------------- METHOD VALIDATE----------------------->

	public boolean validate(String username, String passwordEncrypted)  throws SQLException {
		
		boolean status=false;  

		String sql = "SELECT * FROM Login WHERE Name=? and Password=?";
		connect();
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		statement.setString(1,username );
		statement.setString(2, passwordEncrypted);

		ResultSet resultSet = statement.executeQuery();

		status=resultSet.next();
		statement.close();
		return status;

	}

//	<-------------LIST ALL ITEMS METHOD --------------->

	public List<ProductExpense> listAll() throws SQLException {

		List<ProductExpense> list2 = new ArrayList<>();

		String sql = "SELECT * FROM Expense";

		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {

			int id = resultSet.getInt("Id");
			String pur = resultSet.getString("Purpose");
			String cat = resultSet.getString("Category");
			Double su = resultSet.getDouble("Sum");
			String dat = resultSet.getString("Dfec");

			ProductExpense Exp1 = new ProductExpense(id, pur, cat, su, dat);
			list2.add(Exp1);
		}

		resultSet.close();
		statement.close();

		disconnect();

		return list2;
	}
	
//	 <---------------- LIST ALL BALANCE DEPOSIT--------------------->
	
	public List<BalanceT> listBalance() throws SQLException {

		List<BalanceT> list3 = new ArrayList<>();

		String sql = "SELECT * FROM Balance";

		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {

			int id = resultSet.getInt("Id");
			Double to = resultSet.getDouble("Total");
			String dat = resultSet.getString("DfecDep");

			BalanceT ExpDep = new BalanceT( to,  dat, id);
			
			list3.add(ExpDep);
		}

		resultSet.close();
		statement.close();

		disconnect();

		return list3;
	}
//	 <----------------  METHOD listLoansGov --------------------->
	public List<LoanGOv> listLoansGov() throws SQLException {

		List<LoanGOv> list4 = new ArrayList<>();

		String sql = "SELECT * FROM Loans";

		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {

			int id = resultSet.getInt("id");
			String institutions = resultSet.getString("INSTITUTIONS");
			String courses = resultSet.getString("COURSES");
			int  amount = resultSet.getInt("AMOUNT");
		

			LoanGOv ExpDep = new LoanGOv(id,institutions, courses,  amount);
			
			list4.add(ExpDep);
		}
		resultSet.close();
		statement.close();

		disconnect();

		return list4;
	}
	
	
//	 <------------------------INSERT METHOD LIST -------------------->//

	public boolean insertExp(ProductExpense newExp) throws SQLException {
		String sql = "INSERT INTO  Expense (Purpose, Category, Sum, Dfec) VALUES (?, ?, ?, ?)";
		connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		statement.setString(1, newExp.getPurpose());
		statement.setString(2, newExp.getCategory());
		statement.setDouble(3, newExp.getSum());
		statement.setString(4, newExp.getDfec());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowInserted;
	}
//	 <------------------------INSERT METHOD DEPOSIT -------------------->//
	
	
	public boolean insertDepositExp(BalanceT newExp) throws SQLException {
		String sql = "INSERT INTO  Balance (Total, DfecDep) VALUES ( ?, ?)";
		connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		statement.setDouble(1, newExp.getTotal());
		statement.setString(2, newExp.getDfecdep());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
	
		return rowInserted;
	}
	
//	 <------------------------INSERT GOVERNMENT LOAN-------------------->//
	
	public boolean insertLoanGov(LoanGOv incomeGovernment) throws SQLException{
		
		String sql = "INSERT INTO  Loans (INSTITUTIONS, COURSES, AMOUNT) VALUES ( ?, ?,?)";
		connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		statement.setString(1, incomeGovernment.getInstitutions());
		statement.setString(2, incomeGovernment.getPartFullTime());
		statement.setInt(3, incomeGovernment.getGovFigures());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
	
		return rowInserted;	
	}
//	 <------------------------INSERT DAOregister -------------------->//
	
	public boolean insertDAOregister(RegisterModel regist) throws SQLException {
	
		String sql = "INSERT INTO  Login (Name, Password, Surname, Email) VALUES ( ?, ?,?,?)";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		
		statement.setString(1, regist.getUsername());
		statement.setString(2, regist.getUserpass());
		statement.setString(3, regist.getSurname());
		statement.setString(4, regist.getEmail());
		
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
	
		return rowInserted;
	}

	public boolean deleteDao(ProductExpense newExp) throws SQLException {
		String sql = "DELETE FROM Expense where Id = ?";

		connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, newExp.getId());

		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowDeleted;
	}
	
//	 <------------------------METHOD getUnique -------------------->//
	public ProductExpense getUnique(int id) throws SQLException {

		ProductExpense expEdit = null;
		String sql = "SELECT * FROM Expense WHERE Id = ?";
		connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		statement.setInt(1, id);

		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {

			String pur = resultSet.getString("Purpose");
			String cat = resultSet.getString("Category");
			Double su = resultSet.getDouble("Sum");
			String dat = resultSet.getString("Dfec");

			expEdit = new ProductExpense(pur, cat, su, dat);
		}

		resultSet.close();
		statement.close();

		return expEdit;
	}
	
//	 <------------------------METHOD updateExpense -------------------->//
	public boolean updateExpense(BalanceT Uexp) throws SQLException {

		String sql = "UPDATE Balance SET Total = ?, DfecDep = ?";
		sql += " WHERE Id = 18";
		connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		
		statement.setDouble(1, Uexp.getTotal());
		statement.setString(2, Uexp.getDfecdep());
		statement.setInt(18, Uexp.getId());

		boolean rowUpdated = statement.executeUpdate() > 0;
		statement.close();
		disconnect();

		return rowUpdated;
	}
}
