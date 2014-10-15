package conn;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class connDB {
	public Connection conn = null;
	  public Statement stmt = null;
	  public ResultSet rs = null;
	
	private static String dbClassName ="com.mysql.jdbc.Driver";
	
	/**
	 * 获取数据库的链接
	 * @return
	 */
	
	public static Connection getConnection() {
	    Connection conn = null;
	    try {
	      Class.forName(dbClassName).newInstance();
	      //conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","LOVE<cj2014");
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_zyqbook","1l3mnzwmw2","hi4mzwx0wwhk0k4y5j552jyl42lmzmmxxj3iz3z4");
	    }
	    catch (Exception ee) {
	      ee.printStackTrace();
	    }
	    if (conn == null) {
	      System.err.println(
	          "警告: DbConnectionManager.getConnection() 获得数据库链接失败.\r\n\r\n链接类型:" +
	          dbClassName);
	    }
	    return conn;
	  }
	
	/**
	 * 功能：执行查询语句
	 */
	
	public ResultSet executeQuery(String sql) {
		try {
			conn = getConnection();
			stmt = (Statement) conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage());
		}
		return rs;
	}
	
	/**
	 * 功能:执行更新操作
	 */
	public int executeUpdate(String sql) {
		int resultU = 0;
		try {
			conn = getConnection();				
			stmt = (Statement) conn.createStatement();
			resultU = stmt.executeUpdate(sql);		//执行更新操作
		} catch (SQLException ex) {
			resultU = 0;
		}
		return resultU;
	}
	
	/**
	 * 功能:执行删除操作
	 */
	public int executeDelete(String sql) {
		int resultD = 0;
		try {
			conn = getConnection();				
			stmt = (Statement) conn.createStatement();
			resultD = stmt.executeUpdate(sql);		//执行删除操作
		} catch (SQLException ex) {
			resultD = 0;
		}
		return resultD;
	}
	
	/*
	 * 功能:关闭数据库的连接
	 */
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}

}
