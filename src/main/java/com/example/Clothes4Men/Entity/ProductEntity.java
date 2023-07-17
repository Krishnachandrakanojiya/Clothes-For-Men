package com.example.Clothes4Men.Entity;

public class ProductEntity {
	
	    private int id;
	    private double price;
	    private String image;
	    private String name;
	    private int categoryId;
	    private int quantity;

	    public ProductEntity(int id, double price, String image, String name, int categoryId, int quantity) {
	        this.id = id;
	        this.price = price;
	        this.image = image;
	        this.name = name;
	        this.categoryId = categoryId;
	        this.quantity = quantity;
	    }

	    public ProductEntity() {
	    }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public double getPrice() {
			return price;
		}

		public void setPrice(double price) {
			this.price = price;
		}

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getCategoryId() {
			return categoryId;
		}

		public void setCategoryId(int categoryId) {
			this.categoryId = categoryId;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
	    
	    

}
