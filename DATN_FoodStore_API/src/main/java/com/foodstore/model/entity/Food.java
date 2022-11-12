package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.extend.Discount;
import com.foodstore.model.extend.Image;
import com.foodstore.model.transaction.Cart;
import com.foodstore.model.transaction.CategoryFood;
import com.foodstore.model.transaction.FoodCoupon;
import com.foodstore.model.transaction.OrderDetail;
import com.foodstore.model.transaction.Review;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "foods")
public class Food implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotBlank(message = "Không được bỏ trống name")
    @Column(name = "name", nullable = false, length = 300)
    private String name;

    @Column(name = "price", nullable = false)
    @Min(value = 0, message = "Giá phải lớn hơn 0")
    private double price;

    @Column(name = "quantity_limit", nullable = false)
    @Min(value = 0, message = "Số lượng phải lớn hơn hoặc bằng 0")
    private int quantity_limit;
    
    @Column(name = "view_count", nullable = false)
    @Min(value = 0, message = "Lượt xem phải lớn hơn hoặc bằng 0")
    private int view_count;
    
    @Column(name = "description", length = 1000)
    private String description;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date;
    
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
    @Column(name = "status")
    private long status;
    
    @ManyToOne 
    @JoinColumn(name = "create_by",nullable = false)
    private User user_f;
    
	@JsonIgnore
    @OneToMany(mappedBy = "food_d", cascade = CascadeType.ALL) 
    private List<Discount> food_discounts;
    
	@JsonIgnore
    @OneToMany(mappedBy = "food_c", cascade = CascadeType.ALL) 
    private List<CategoryFood> category_foods;
    
	@JsonIgnore
    @OneToMany(mappedBy = "food_i", cascade = CascadeType.ALL) 
    private List<Image> food_images;
    
	@JsonIgnore
    @OneToMany(mappedBy = "food_cart", cascade = CascadeType.ALL) 
    private List<Cart> carts;
	
	@JsonIgnore
    @OneToMany(mappedBy = "food_r", cascade = CascadeType.ALL) 
    private List<Review> food_reviews;
	
	@JsonIgnore
    @OneToMany(mappedBy = "food_od", cascade = CascadeType.ALL) 
    private List<OrderDetail> order_details;
    
    @JsonIgnore
    @OneToMany(mappedBy = "food_cp", cascade = CascadeType.ALL) 
    private List<FoodCoupon> food_coupons;
}
