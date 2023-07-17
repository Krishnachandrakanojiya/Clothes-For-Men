package com.example.Clothes4Men.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Clothes4Men.Dao.ProductDao;
import com.example.Clothes4Men.Entity.ProductEntity;
import com.example.Clothes4Men.Service.ProductService;


@Service
public class productserviceImpl implements ProductService{
	
 	    @Autowired
	    private ProductDao userDao;


	    
	    @Override
	    public List<ProductEntity> findAll() {
	        return userDao.findAll();
	    }

	    @Override
	    public void save(ProductEntity user) {
	        userDao.save(user);
	    }

	    @Override
	    public void update(ProductEntity user) {
	        userDao.update(user);
	    }

	    @Override
	    public void delete(int id) {
	        userDao.delete(id);
	    }

		@Override
		public ProductEntity findById(long id) {
			return userDao.findById(id);
		}
		 
		
		@Override
		public void updateProduct(Long productId, Integer newQuantity) {
			ProductEntity product = userDao.findById(productId);
	        product.setQuantity(newQuantity);
	        userDao.updateProduct(product);
			
		}
	
	}
	
