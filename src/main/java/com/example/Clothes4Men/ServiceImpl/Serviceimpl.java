package com.example.Clothes4Men.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Clothes4Men.Dao.LoginDao;
import com.example.Clothes4Men.Entity.LoginEntity;
import com.example.Clothes4Men.Entity.SignUpEntity;
import com.example.Clothes4Men.Service.LoginService;


@Service
public class Serviceimpl implements LoginService {
	
	@Autowired
	LoginDao Dao;

	@Override
	public boolean checkEmail(String email) {
		return Dao.checkEmail(email);
	}

	@Override
	public LoginEntity GetUserByEmail(String Email) {
		LoginEntity user = Dao.getByEmail(Email);
		return user;
	}
	

	@Override
	public int createNewUser(SignUpEntity user) {
		return Dao.createNewUser(user);
		
	}

	@Override
	public void addOrder(String name, String email, String credit, String cvv, String expiry, float totalPrice) {
		Dao.addOrder(name, email, credit, cvv, expiry, totalPrice);
	}
	

}
