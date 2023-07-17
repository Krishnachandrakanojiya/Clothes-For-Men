package com.example.Clothes4Men.Service;

import com.example.Clothes4Men.Entity.LoginEntity;
import com.example.Clothes4Men.Entity.SignUpEntity;


public interface LoginService {
	
	    LoginEntity GetUserByEmail(String Email);
		
		int createNewUser(SignUpEntity user);


	    boolean checkEmail(String email);

	    void addOrder(String name, String email, String credit, String cvv, String expiry, float totalPrice);

}
