package Personal_Budeget_Web_Application;


/**
 * @author giocardenas
 *
 */
public class LoanGOv {
	
	
	private int id ;
	private String institutions;
	private String partFullTime;
	private int  govFigures;
	
	
//	<-----------CONSTRUCTORS------------>
	public LoanGOv(int id, String institutions, String partFullTime, int govFigures) {
		super();
		this.id = id;
		this.institutions = institutions;
		this.partFullTime = partFullTime;
		this.govFigures = govFigures;
	}
	
	
	public LoanGOv(String institutions, String partFullTime, int govFigures) {
		super();
		this.institutions = institutions;
		this.partFullTime = partFullTime;
		this.govFigures = govFigures;
	}

//	<-----------GETTER AND SETTERS------------>
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInstitutions() {
		return institutions;
	}
	public void setInstitutions(String institutions) {
		this.institutions = institutions;
	}
	public String getPartFullTime() {
		return partFullTime;
	}
	public void setPartFullTime(String partFullTime) {
		this.partFullTime = partFullTime;
	}
	public int getGovFigures() {
		return govFigures;
	}
	public void setGovFigures(int govFigures) {
		this.govFigures = govFigures;
	}

	

}
