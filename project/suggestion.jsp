<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html> 
<html>
 <head>    
  <title>DEMO</title>
       <!-- <link rel="stylesheet" type="text/css" href="style_report.css"> -->
	   	<style type="text/css">
		body{
      background:white;
      /*overflow: scroll;*/
		}
    a {
      text-decoration: none;
      color: white;
    }
    .vssutLogo img {
       margin-left: 30px;
       float: left;
       width: 100px;
       height: 100px;

  }
    .button {
    display: inline-block;
     padding: 0.5em 1em;
    font-size: 20px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    outline: none;
    color: #fff;
    background-color: #636466;
    border: none;
    border-radius: 15px;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  }

  .button:hover {background-color: #D3FFE0;color: black;}

  .button:active {
    background-color: #D3FFE0;
    box-shadow: 0 5px #666;
    transform: translateY(4px);

  }
  .button1{
    margin-top: 2em;
    margin-bottom: 3em;
    padding: 0.5em 1em;
    font-size: 20px;
    color: white;
    background-color: #636466;
    border: none;
    border-radius: 15px;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    text-align: center;
    text-decoration: none;
    display: inline-block;
  }
		
	
	.w3-myfont {
   font-family: 'Alfa Slab One', cursive, sans-serif;

  }
.w3-container {
  margin-top: 1em;
}
.w3-myfont h1 {
  margin-left: 7em;
}
.w3-myfont p {
  margin-left: 35em;
}
h1 h2 h3 {
  text-align: center;
}
    
    
    
   
    .w3-theme { background-color:#efc050 !important}

	</style>
  </head>
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
   <body>
     
  <div id="element-to-print">
      <div class="w3-row">
    <div class="w3-container w3-theme">
      <div class="w3-col  m3 vssutLogo ">
      <img src="NuaOdisha-158-vssut.png">
    </div>
    <div class="w3-col  m9">  
      <div class=" w3-center w3-myfont ">
        <h1 class="w3-xxlarge">VEER SURENDRA SAI UNIVERSITY OF TECHNOLOGY</h1>
        <p class=" w3-center w3-xlarge">BURLA,ODISHA</p>
      </div>
    </div>
    </div>
  </div>
</div>
<div>

<div class="w3-container">
    <center><h1>SUGGESTIONS REPORT</h1></center>

<%

	String course = request.getParameter("course");
	String branch = request.getParameter("branch");
	String semester = request.getParameter("semester");
	int sem = Integer.parseInt(semester);
	String id = request.getParameter("regid");

	try{

		Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

	    ResultSet rs = st.executeQuery("select suggestion from system,suggestion where system.course='"+course+"' and system.branch='"+branch+"' and system.semester='"+semester+"' and system.regid=suggestion.id");


	    out.println("<html>");
        out.println("<body>");
        out.println("<center>");
        


		while(rs.next()){
       
        out.println("<p class='w3-container'>"+rs.getString(1)+"</p>");
      
		}
  out.println("</center>");
  out.println("</body>");
  out.println("</html>");
	}catch(Exception e){

	}

%>






</div>
<br>
</body>
<center>
  <div class="w3-container">
  <div class="w3-show-inline-block">
    <div class="w3-bar">
      <button class="button "><a href="logout" >Logout</a></button>
      <button  onclick="printReport()" class="button1 ">Print</button>
    </div>
</center>





  </div>
</div>
              
    
  <script type="text/javascript">
    function printReport() {
      console.log('printing');
      var element = document.getElementById('element-to-print');
      var opt = {
        margin:       1,
        filename:     'report.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 1 },
        jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
      };

      // New Promise-based usage:
      html2pdf().from(element).set(opt).save();
    }
  </script>
</html>