package com.example.Clothes4Men.Dao;

import java.util.List;

import com.example.Clothes4Men.Entity.ProductEntity;

public interface ProductDao {
	
	ProductEntity findById(long id);

    List<ProductEntity> findAll();

    void save(ProductEntity user);

    void update(ProductEntity user);

    void delete(int id);
    

    void updateProduct(ProductEntity product);

}
