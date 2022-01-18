package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDao {
public void authorize(String id) throws SQLException{
	Connection con=MySqlConn.getCon();
	PreparedStatement ps=con.prepareStatement("update debtordetails set status=? where id=?");
	PreparedStatement ps2=con.prepareStatement("update debtordetails set reason=? where id=?");
	ps2.setString(2, id);
 	ps2.setString(1,"NIL");
	ps.setString(2,id);
 	ps.setString(1,"Authorized");
 	ps.executeUpdate();
}
public void reject(String id,String rs) throws SQLException{
	Connection con=MySqlConn.getCon();
	PreparedStatement ps=con.prepareStatement("update debtordetails set status=? where id=?");
	PreparedStatement ps2=con.prepareStatement("update debtordetails set reason=? where id=?");
	ps2.setString(2,id);
	ps2.setString(1,rs);
	ps2.executeUpdate();
	ps.setString(2,id);
 	ps.setString(1,"Rejected");
 	ps.executeUpdate();
}
}
