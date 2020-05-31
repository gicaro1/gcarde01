package Personal_Budeget_Web_Application;
import java.io.UnsupportedEncodingException;
import java.util.Base64;


/**
 * @author giocardenas
 * Methods Encode and Decode Password when is sent from the Register  form
 */


public class Encrysecuryty {
	
	public static String encode (String value) throws UnsupportedEncodingException {
		
		Base64.Encoder e= Base64.getEncoder();
		return e.encodeToString(value.getBytes("utf-8"));
		
	}
public static String decode (String encrypted ) throws UnsupportedEncodingException {
		
	byte [] b = Base64.getDecoder().decode(encrypted);
		return new String(b,"utf-8");
		
	}
//	public static void main(String [] args) throws UnsupportedEncodingException {
//		System.out.println(encode("Gio"));
//		System.out.println(decode("YWJjMTIz"));  
//		
//	}
//	
}
