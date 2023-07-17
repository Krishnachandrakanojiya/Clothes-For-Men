package com.example.Clothes4Men.WebController;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.Clothes4Men.Entity.LoginEntity;
import com.example.Clothes4Men.Entity.ProductEntity;
import com.example.Clothes4Men.Entity.SignUpEntity;
import com.example.Clothes4Men.Service.LoginService;
import com.example.Clothes4Men.Service.ProductService;


@Controller
public class WebController {
	
	    @Autowired
	    LoginService services;

	    @Autowired
	    ProductService userRepository;


	    @Autowired
	    JdbcTemplate jdbcTemplate;

	    String loggedEmail;

	    ArrayList<String> cart = new ArrayList<String>();

	    @RequestMapping(value = "/login", method = RequestMethod.GET)
	    public String loginPage() {
	        return "login";
	    }


	    @RequestMapping(value = "/admin", method = RequestMethod.GET)
	    public String adminPage() {
	        return "admin";
	    }

	    @RequestMapping(value = "/addNewProduct", method = RequestMethod.GET)
	    public String addNewProduct() {
	        return "addNewProduct";
	    }


	    @RequestMapping(value = "/addNewProduct", method = RequestMethod.POST)
	    public String addNewProductToDb(ModelMap modelMap, @RequestParam String name, @RequestParam String price, @RequestParam String quantity, @RequestParam String categoryName) {
	        System.out.println(name + " " + price + " " + quantity + " " + categoryName);
	        String getCategoryId = "select category_id from category where category_name = ?";
	        int categoryId = -1;
	        try {
	            categoryId = jdbcTemplate.queryForObject(getCategoryId, Integer.class, categoryName);
	        } catch (Exception e) {
	            categoryId = -1;
	        }
	        if (categoryId == -1) {
	            System.out.println("Category not found");
	            modelMap.put("errorMsg", "Category not found");
	            return "addNewProduct";
	        }
	        System.out.println("Category id is " + categoryId);
	        String imageUrl = "https://cdn-icons-png.flaticon.com/512/2935/2935183.png";
	        String sql = "insert into db.product (price,name,image,quantity,category_id) values (?,?,?,?,?)";
	        int count = jdbcTemplate.update(sql, price, name, imageUrl, quantity, categoryId);
	        if (count == 1) {
	            modelMap.put("successMsg", "Product added successfully");
	        } else {
	            modelMap.put("errorMsg", "Product not added");
	        }
	        return "addNewProduct";
	    }

	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String welcomePage(ModelMap model, @RequestParam String Email, @RequestParam String password) {
	        if (services.checkEmail(Email) == false) {
	            model.put("errorMsg", "Email is not registered");
	            return "login";
	        }
	        LoginEntity user = services.GetUserByEmail(Email);
	        if (user.getPassword().equals(password)) {
	            model.put("Email", Email);
	            loggedEmail = Email;
	            if (user.getEmail().equals("admin@gmail.com")) {
	                return "redirect:/admin";
	            }
	            return "redirect:/welcome";
	        }
	        model.put("errorMsg", "Please Provide Correct Credential");
	        return "login";
	    }

	    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
	    public String showWelcome() {
	        return "welcome";
	    }

	    @RequestMapping(value = "/cart", method = RequestMethod.GET)
	    public String showCart(ModelMap model) {
	        String sql = "select SUM(price*IFNULL(qty, 0)) FROM product LEFT JOIN cart on product.id=cart.productId";
	        float totalPrice = 0;
	        String countSql = "select count(*) from cart";
	        int totalItem = 0;
	        try {
	            totalPrice = jdbcTemplate.queryForObject(sql, Float.class);
	            totalItem = jdbcTemplate.queryForObject(countSql, Integer.class);
	        } catch (DataAccessException e) {
	            totalPrice = 0;
	        }
	        model.addAttribute("totalPrice", totalPrice);
	        model.addAttribute("totalItem", totalItem);
	        return "cart";
	    }

	    @RequestMapping(value = "/welcome", method = RequestMethod.POST)
	    public String addToCart(ModelMap model, @RequestParam String Email) {
	        String productId = Email;
	        boolean flag = false;
	        for (int i = 0; i < cart.size(); i++) {
	            if (cart.get(i).equals(productId + "-" + loggedEmail)) {
	                flag = true;
	                break;
	            }
	        }
	        if (flag) {
	            return "welcome";
	        }
	        String userId = loggedEmail;

	        String newCart = productId + "-" + loggedEmail;
	        cart.add(newCart);
	        String sql = "insert into cart (userId,productId) values (?,?)";
	        jdbcTemplate.update(sql, userId, productId);
	        return "welcome";
	    }

	    @RequestMapping(value = "/register", method = RequestMethod.GET)
	    public String signup(ModelMap model) {
	        LoginEntity user = new LoginEntity();
	        model.addAttribute("user", user);
	        return "register";
	    }

	    @RequestMapping(value = "/register", method = RequestMethod.POST)
	    public String registeruser(@ModelAttribute("user") SignUpEntity user, ModelMap model) {
	        int count = services.createNewUser(user);
	        if (count != 1) {
	            model.put("errorMsg", "error occure during registration");
	            return "register";

	        }
	        model.put("errorMsg", "success");
	        return "redirect:/login";
	    }

	    @RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	    public String addProductPage() {
	        return "addProduct";
	    }

	    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
	    public String showCheckout(ModelMap model) {
	        String sql = "select SUM(price*IFNULL(qty, 0)) FROM product LEFT JOIN cart on product.id=cart.productId";
	        float totalPrice = 0;
	        try {
	            totalPrice = jdbcTemplate.queryForObject(sql, Float.class);
	        } catch (DataAccessException e) {
	            totalPrice = 0;
	        }
	        model.addAttribute("totalPrice", totalPrice);
	        return "checkout";
	    }

	    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
	    public String checkOut(@RequestParam String name, @RequestParam String email, @RequestParam String credit, @RequestParam String cvv, @RequestParam String expiry) {
	        String sql = "select SUM(price*IFNULL(qty, 0)) FROM product LEFT JOIN cart on product.id=cart.productId";
	        float totalPrice = 0;
	        try {
	            totalPrice = jdbcTemplate.queryForObject(sql, Float.class);
	        } catch (DataAccessException e) {
	            totalPrice = 0;
	        }
	        System.out.println(name + " " + email + " " + credit + " " + cvv + " " + expiry + " " + totalPrice);
	        String sqlDelete = "DELETE FROM cart";
	        jdbcTemplate.update(sqlDelete);
	        String sqlInsert = "insert into db.order ( userName,email,credit,cvv,expiry,totalAmount) values (?,?,?,?,?,?)";
	        jdbcTemplate.update(sqlInsert, name, email, credit, cvv, expiry, totalPrice);
	        return "redirect:/welcome";
	    }

	    @RequestMapping(value = "/Products", method = RequestMethod.GET)
	    public String showAddProductForm(ModelMap model) {
	        ProductEntity product = new ProductEntity();
	        model.addAttribute("product", product);
	        return "Products";
	    }

	    @RequestMapping(value = "/increment", method = RequestMethod.POST)
	    public String incrementQty(ModelMap model, @RequestParam String productId) {
	        String countSql = "select count(*) from cart";
	        int totalItem = 0;
	        String sqlUpdate = "UPDATE cart SET qty = qty + 1 WHERE productId =" + productId;
	        jdbcTemplate.update(sqlUpdate);
	        String sql = "select SUM(price*IFNULL(qty, 0)) FROM product LEFT JOIN cart on product.id=cart.productId";
	        float totalPrice = 0;
	        try {
	            totalPrice = jdbcTemplate.queryForObject(sql, Float.class);
	            totalItem = jdbcTemplate.queryForObject(countSql, Integer.class);
	        } catch (DataAccessException e) {
	            totalPrice = 0;
	        }
	        model.addAttribute("totalPrice", totalPrice);
	        model.addAttribute("totalItem", totalItem);
	        return "cart";
	    }

	    @RequestMapping(value = "/decrement", method = RequestMethod.POST)
	    public String decrementQty(ModelMap model, @RequestParam String productId) {
	        String sq1 = "select qty from cart where productId=" + productId;
	        String countSql = "select count(*) from cart";
	        int totalItem = 0;
	        int qty = jdbcTemplate.queryForObject(sq1, Integer.class);
	        if (qty == 1) {
	            String sqlDelete = "DELETE FROM cart WHERE productId =" + productId;
	            jdbcTemplate.update(sqlDelete);
	        } else {
	            System.out.println("Decrement productId" + productId);
	            String sqlUpdate = "UPDATE cart SET qty = qty - 1 WHERE productId =" + productId + " AND qty > 1";
	            jdbcTemplate.update(sqlUpdate);
	        }
	        String sql = "select SUM(price*IFNULL(qty, 0)) FROM product LEFT JOIN cart on product.id=cart.productId";
	        float totalPrice = 0;
	        try {
	            totalPrice = jdbcTemplate.queryForObject(sql, Float.class);
	            totalItem = jdbcTemplate.queryForObject(countSql, Integer.class);
	        } catch (DataAccessException e) {
	            totalPrice = 0;
	        }
	        model.addAttribute("totalPrice", totalPrice);
	        model.addAttribute("totalItem", totalItem);
	        return "cart";
	    }

	    @RequestMapping(value = "/updateQuantity", method = RequestMethod.GET)
	    public String updateQuantityGet(@RequestParam("id") String id) {
	        String productId = id;
	        String sql = "select quantity from product where id = ?";
	        int quantity = jdbcTemplate.queryForObject(sql, Integer.class, productId);
	        quantity++;
	        String sqlUpdate = "Update product set quantity = ? where id = ?";
	        jdbcTemplate.update(sqlUpdate, quantity, productId);
	        return "redirect:/addProduct";
	    }


}
