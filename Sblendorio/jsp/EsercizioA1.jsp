<!-- sblendorio christian -->
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<body>
        
        
<%          try{

String connection = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=sblendorio.christian;password=xxx123#";
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection1 = DriverManager.getConnection(connection);
			
			Statement stmt = connection1.createStatement();
			String sql = "SELECT COUNT(ID) AS Numero FROM Appartamento WHERE nome ='"+request.getParameter("nomeAp")+ "' ";
			ResultSet rs = stmt.executeQuery(sql);
			
			rs.next();
            int numero = rs.getInt("Numero");
            
            if (numero == 0){
                out.println("Appartamento non trovato");
            }else if (numero == 1){
                String sql2 = "SELECT * FROM Appartamento WHERE nome ='"+request.getParameter("nomeAp")+ "' ";
                Statement stmt2 = connection1.createStatement();
			    ResultSet rs2 = stmt2.executeQuery(sql2);
			    rs2.next();
                out.println("L'apparamento "+ rs2.getString("nome") + " si trova in "+rs2.getString("indirizzo")+ " a "+ rs2.getString("citta")+ " costa "+rs2.getString("prezzoPerNotte") + " a notte e ha "+rs2.getString("numeroPostiLetto")+ " posti letto.");
                rs2.close();
            }else{
                out.println("Ci sono più appartamenti con quel nome");
                String sql3 = "SELECT ID, prezzoPerNotte, numeroPostiLetto FROM Appartamento WHERE nome ='"+request.getParameter("nomeAp")+ "' ";
                Statement stmt3 = connection1.createStatement();
			    ResultSet rs3 = stmt3.executeQuery(sql3);
                out.print("<table>");
			
			    out.print("<tr><th align=left>ID</th><th align=left>Prezzo Per Notte</th><th align=left>Numero Posti Letto</th></tr>");
			    while(rs3.next()){

				int ID = rs3.getInt("ID");
				int prezzo = rs3.getInt("prezzoPerNotte");
				int numero2 = rs3.getInt("numeroPostiLetto");
				
                
                out.print("<tr><td>" + ID + "</td><td>" + prezzo + "</td><td>" + numero2 + "</td></tr>");

	        }
	        
	        
	        out.print("</table>");
	        rs3.close();
            }
			
			rs.close();
			
         connection1.close(); 
     }catch(Exception e)
     {
         out.println(e);
     }

         %>
         
    
</body>     
</html>      