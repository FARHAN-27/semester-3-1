import java.io.IOException ;
import java.net.ServerSocket ;
import java.net.Socket ;
import java.io.ObjectInputStream ;
import java.io.ObjectOutputStream ;
import java.io.* ;
import java.util.* ;

public class Client
{
	public static void main(String args[]) throws IOException
	{
		Socket socket = new Socket("192.168.0.106",22224) ;
		

		ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream()) ;
		
		ObjectInputStream ois = new ObjectInputStream(socket.getInputStream()) ;



		while(true)
		{
			Scanner sc = new Scanner(System.in) ;
			String message = sc.nextLine() ;
			if(message.equals("exit"))break ;
			// send to server :
			oos.writeObject(message) ;

			try 
			{	
				// receive from server .
				Object fromServer = ois.readObject() ;
				System.out.println("\n                    From server : "+(String)fromServer+"\n") ;


			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace() ;
			}
		}
		socket.close() ;
	}
}

