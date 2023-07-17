package com.example.Clothes4Men.Dao;

import com.example.Clothes4Men.Entity.LoginEntity;
import com.example.Clothes4Men.Entity.SignUpEntity;

public interface LoginDao {
	
	LoginEntity getByEmail(String Email);
	
	int createNewUser(SignUpEntity register);


    boolean checkEmail(String email);

    void addOrder(String name, String email, String credit, String cvv, String expiry, float totalPrice);
}


