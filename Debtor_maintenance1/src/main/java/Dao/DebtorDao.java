package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Model.Debtor;

public class DebtorDao {
	public   int save(Debtor dt){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("insert into debtordetails(date,name,address1,address2,faxno,phno,email,status,reason)  values(SYSDATE(),?,?,?,?,?,?,?,?)");
		 	ps.setString(1,dt.getName());
			ps.setString(2,dt.getAddress1());
			ps.setString(3,dt.getAddress2());
			ps.setString(4,dt.getFaxno());
			ps.setString(5,dt.getPhno());
			ps.setString(6,dt.getEmail());
			ps.setString(7,"Pending");
			ps.setString(8,"NIL");
			status=ps.executeUpdate();
		}
		
		catch(Exception e){System.out.println(e);}
		return status;	
	}
	public   int change(Debtor dt){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			
			PreparedStatement ps=con.prepareStatement("update debtordetails set date=sysdate(),name=?,address1=?,address2=?,faxno=?,phno=?,email=? where id=?");
			ps.setString(7,dt.getId());
			ps.setString(1,dt.getName());
			ps.setString(2,dt.getAddress1());
			ps.setString(3,dt.getAddress2());
			ps.setString(4,dt.getFaxno());
			ps.setString(5,dt.getPhno());
			ps.setString(6,dt.getEmail());
			status=ps.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}
		return status;
	}
	
	public   int delete(int id){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("delete from debtordetails where id=?");
			PreparedStatement ps2=con.prepareStatement("delete from bankdetails where id=?");
			ps.setInt(1,id);
			ps2.setInt(1,id);
			ps2.executeUpdate();
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
}
