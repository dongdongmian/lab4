package bean;

import java.sql.Connection;
import java.sql.DriverManager;
/w.rdc.sae.sina.com.cn:3307/app_zyqbook";
	//private String user = "root";
	//private String password = "LOVE<cj2014";
	private String user = "1l3mnzwmw2";
	private String password = "hi4mzwx0wwhk0k4y5j552jyl42lmzmmxxj3iz3z4";
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Connection getConnection(){
		try{
			Class.forName(driverName);
			return DriverManager.getConnection(url, user, password);
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}
	} 
}
