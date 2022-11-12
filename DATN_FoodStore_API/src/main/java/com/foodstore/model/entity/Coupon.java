package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.transaction.Customer_coupon;
import com.foodstore.model.transaction.Food_coupon;

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
@Table(name = "coupons")
public class Coupon implements Serializable {
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
    
    @Column(name = "description", length = 1000)
    private String description;
    
    @Column(name = "code", nullable = false, length = 100)
    private String code;

    @Column(name = "user_limit", nullable = false)
    @Min(value = 0, message = "Giới hạn người dùng phải lớn hơn hoặc bằng 0")
    private int user_limit;

    @Column(name = "food_limit", nullable = false)
    @Min(value = 0, message = "Giới hạn lượng bán phải lớn hơn hoặc bằng 0")
    private int food_limit;
    
    @Column(name = "amount", nullable = false)
    @Min(value = 0, message = "Lượt xem phải lớn hơn hoặc bằng 0")
    private double amount;
    
    @Column(name = "is_fixed", nullable = false)
    private boolean is_fixed;
    
    @Column(name = "start_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date start_date;
    
    @Column(name = "end_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date end_date;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date;
    
    @ManyToOne 
    @JoinColumn(name = "create_by",nullable = false)
    private User user_cp;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
    @Column(name = "status")
    private long status;
    
    @JsonIgnore
    @OneToMany(mappedBy = "coupon_f", cascade = CascadeType.ALL) 
    private List<Food_coupon> food_coupons;
    
    @JsonIgnore
    @OneToMany(mappedBy = "coupon_c", cascade = CascadeType.ALL) 
    private List<Customer_coupon> customer_coupons;
}
