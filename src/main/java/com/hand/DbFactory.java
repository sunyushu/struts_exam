package com.hand;

import java.io.InputStream;
import java.util.Properties;

import javax.sound.sampled.Port;

public  class DbFactory {
	
	/**
	 * 端口默认为3306
	 * 地址为本机地址
	 * 
	 */
	private static String port;
	private static String ip;
	private static String dbname;
	private static String userName="root";
	private static String userPass="123456";
	
	

	
	static{
		Properties prop = new Properties();
		try{
			InputStream in= DbFactory.class.getClassLoader().getResourceAsStream("com/hand/dbconfig.properties");
			prop.load(in);
		}
		catch(Exception e){
			System.out.println("配置文件错误");
		}
		

		ip=prop.getProperty("ip");
		dbname=prop.getProperty("dbname");
		userName=prop.getProperty("userName");
		userPass=prop.getProperty("userPass");
		port=prop.getProperty("port");
	}
	public String  getPort() {
		return port;
	}
	public void setPort(String  port) {
		this.port = port;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDbname() {
		return dbname;
	}
	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
	public static void main(String[] args) {
		System.out.println(ip+dbname+port+userName+userPass);
	}
	
}
