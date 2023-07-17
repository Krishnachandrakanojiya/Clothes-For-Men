package com.example.Clothes4Men.Entity;

public class LoginEntity {
	
	private String Email;
	private String Password;
	
	
	public LoginEntity() {
	}
	
	public LoginEntity(String email, String password) {
		super();
		Email = email;
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
	
	


}
