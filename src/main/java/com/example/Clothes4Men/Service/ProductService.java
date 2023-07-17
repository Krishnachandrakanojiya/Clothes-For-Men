package com.example.Clothes4Men.Service;

import java.util.List;
import com.example.Clothes4Men.Entity.ProductEntity;

public interface ProductService {
	

    ProductEntity findById(long id);

    List<ProductEntity> findAll();

    void save(ProductEntity user);

    void update(ProductEntity user);

    void delete(int id);
    
    void updateProduct(Long productId, Integer newQuantity);

}
