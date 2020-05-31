package Personal_Budeget_Web_Application;
/**
 * @author giocardenas
 *
 */
public class RegisterModel {
	private String username;
	private String userpass;
	private String surname;
	private String email;
	
//	<-----------CONSTRUCTOR------------>
	public RegisterModel(String username, String userpass, String surname, String email) {
		super();
		this.username = username;
		this.userpass = userpass;
		this.surname = surname;
		this.email = email;
	}

//	<-----------GETTER AND SETTERS------------>
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserpass() {
		return userpass;
	}


	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}


	public String getSurname() {
		return surname;
	}


	public void setSurname(String surname) {
		this.surname = surname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

}
