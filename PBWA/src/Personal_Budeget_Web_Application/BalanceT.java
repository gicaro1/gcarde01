package Personal_Budeget_Web_Application;

/**
 * @author giocardenas
 *
 */
public class BalanceT {
	private int id ;
	private double  total;
	private String dfecdep;
	
//	<-------------- CONSTRUCTOS ----------------->
	public BalanceT(int id) {
	
		this.id = id;
	}

	public BalanceT(double total, String dfecdep) {
	
		this.total = total;
		this.dfecdep = dfecdep;
	}

	public BalanceT(double total, String dfecdep, int id) {
		super();
		this.total = total;
		this.dfecdep = dfecdep;
		this.id = id;
	}
	
//	<-------------- GETTERS AND SETTERS ----------------->
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getDfecdep() {
		return dfecdep;
	}
	public void setDfecdep(String dfecdep) {
		this.dfecdep = dfecdep;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
