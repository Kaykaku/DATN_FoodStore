package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.extend.Notification;
import com.foodstore.model.extend.PhoneAddress;
import com.foodstore.model.transaction.Cart;
import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.model.transaction.Review;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.Gender;
import com.foodstore.util.constraints.ImageConstraints;
import com.foodstore.util.constraints.Password;

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
@Table(name = "customers")
public class Customer implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotBlank(message = "Không được bỏ trống username")
    @Column(name = "username", nullable = false, length = 100)
    private String username;

    @Column(name = "password", nullable = false)
    private String password = Password.Default;

    @Column(name = "fullname", length = 200)
    private String fullname;
    
    @Column(name = "gender")
    private boolean gender = Gender.MALE;
    
    @Column(name = "birthday")
    @Temporal(TemporalType.DATE)
    private Date birthday;

    @Column(name = "avatar", length = 100)
    private String avatar = ImageConstraints.DEFAULT_AVATAR;

    @Column(name = "email", nullable = false, length = 100)
    private String email;
    
    @Column(name = "remember_token", length = 100)
    private String remember_token;
    
    @Column(name = "code", length = 100)
    private String code;
   
    @Column(name = "status")
    private long status;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.DATE)
    private Date create_date = new Date();
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display = Display.SHOW;
    
    
	@JsonIgnore
    @OneToMany(mappedBy = "customer_pa", cascade = CascadeType.ALL) 
    private List<PhoneAddress> phoneAddresses;
	
	@JsonIgnore
    @OneToMany(mappedBy = "customer_cart", cascade = CascadeType.ALL) 
    private List<Cart> carts;
	
	@JsonIgnore
    @OneToMany(mappedBy = "customer_r", cascade = CascadeType.ALL) 
    private List<Review> food_reviews;
	
	@JsonIgnore
    @OneToMany(mappedBy = "customer_n", cascade = CascadeType.ALL) 
    private List<Notification> notifications;
	
    @JsonIgnore
    @OneToMany(mappedBy = "customer_cp", cascade = CascadeType.ALL) 
    private List<CustomerCoupon> customer_coupons;
}
