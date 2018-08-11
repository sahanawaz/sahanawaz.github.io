import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.io.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		String regid = req.getParameter("regno");
		String branch = req.getParameter("branch");
		String semester = req.getParameter("semester");
		String mobileno = req.getParameter("mobileno");
		String course = req.getParameter("course");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			Statement st = con.createStatement();
			int count = st.executeUpdate("insert into system values('"+regid+"','"+name+"','"+username+"','"+password+"','"+branch+"','"+semester+"','user','"+mobileno+"','"+course+"')");
			if(count>0){
				// res.sendRedirect("login.html");
				pw.println("<html><center><h1>Registered Successfully</h1></center></html>");
				pw.println("<html><center><a href='logout' style=' background-color: #4CAF50;border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer; -webkit-transition-duration: 0.4s;transition-duration: 0.4s;'>Logout</a></center></html>");
			
			}
			else{
				pw.println("<html>");
				pw.println("<body>");
				pw.println("<script>");
				pw.println("alert('Registration failed. Try again')");
				pw.println("</script>");
				pw.println("</body>");
				pw.println("</html>");
				
				res.sendRedirect("Register.html");
			}
			con.close();
		}catch(Exception e){
			
				pw.println("<html><center><h1>Already registered</h1></center></html>");
			
			//pw.println("Error:"+e);
		}
		
	}
}