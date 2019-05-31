<!-- sblendorio christian -->
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<body>
<%          
            
            try{

            String connection = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=sblendorio.christian;password=xxx123#";
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection(connection);
            
			String citta = request.getParameter("nomecittà");
			String pmax = request.getParameter("numeroMassimo");
			String pmin = request.getParameter("numeroMinimo");
			
			
			String sql = "SELECT nome,prezzoPerNotte,numeroPostiLetto FROM Appartamento WHERE citta = ? AND prezzoPerNotte > ? AND prezzoPerNotte < ? ORDER BY prezzoPerNotte, numeroPostiLetto DESC";
			PreparedStatement prepStmt = con.prepareStatement(sql);
			prepStmt.setString(1, citta);
			prepStmt.setString(2, pmin);
			prepStmt.setString(3, pmax);
			
			ResultSet rs = prepStmt.executeQuery();
			
			
			
		
			    while(rs.next()){

				String nome= rs.getString("nome");
				int prezzo = rs.getInt("prezzoPerNotte");
				int numero2 = rs.getInt("numeroPostiLetto");
				
                
                out.print("<ul><li>" + nome + "</li><li>" + prezzo + "</li><li>" + numero2 + "</li></ul>");
	}	

			rs.close();
		

         con.close(); 
     }catch(Exception e){
         out.println(e);
     }

         %>
         
    
</body>     
</html>      