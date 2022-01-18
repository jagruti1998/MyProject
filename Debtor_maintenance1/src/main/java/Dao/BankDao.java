package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Model.Bank;

public class BankDao {
	public   int save(Bank dt){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps2=con.prepareStatement("insert into bankdetails(id,name,branch,address,accno,curr)  values(?,?,?,?,?,?)");
			ps2.setString(1,dt.getId());
			ps2.setString(2,dt.getBank());
			ps2.setString(3,dt.getBranch());
			ps2.setString(4,dt.getAddress());
			ps2.setString(5,dt.getAccno());
			ps2.setString(6,dt.getCurr());
			status=ps2.executeUpdate();
		}
		
		catch(Exception e){System.out.println(e);}
	    return status;	
	}
	
	public   int change(Bank dt){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps2=con.prepareStatement("update bankdetails set name=?,branch=?,address=?,accno=?,curr=? where id=?");
			PreparedStatement ps=con.prepareStatement("update debtordetails set date=sysdate() where id=?");
			ps.setString(1, dt.getId());
			ps2.setString(6,dt.getId());
			ps2.setString(1,dt.getBank());
			ps2.setString(2,dt.getBranch());
			ps2.setString(3,dt.getAddress());
			ps2.setString(4,dt.getAccno());
			ps2.setString(5,dt.getCurr());
			ps.execute();
			status=ps2.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}
			return status;
	}
}
