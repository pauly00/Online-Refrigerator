package controller;

public class User {
	String NAME;
	String ID;
	String PW;
	
	User(String name, String id, String pw) {
		setName(name);
		setId(id);
		setPw(pw);
	}
	
	void setName(String name) {
		this.NAME = name;
	}
	
	void setId(String id) {
		this.ID = id;
	}
	
	void setPw(String pw) {
		this.PW = pw;
	}
	
	String getName() {
		return NAME;
	}
	
	String getId() {
		return ID;
	}
	
	String getPw() {
		return PW;
	}
	
	void printInfo() {
		
	}
}
