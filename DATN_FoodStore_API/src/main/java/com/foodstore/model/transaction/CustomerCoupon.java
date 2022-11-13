package com.foodstore.model.transaction;

import javax.persistence.*;

import com.foodstore.model.entity.Coupon;
import com.foodstore.model.entity.Customer;
import com.foodstore.util.constraints.CouponStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "customer_coupons")
public class CustomerCoupon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
	
    @ManyToOne 
    @JoinColumn(name = "customer_id",nullable = false)
    private Customer customer_cp;
    
    @ManyToOne 
    @JoinColumn(name = "coupon_id",nullable = false)
    private Coupon coupon_c;

    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date = new Date();
    
    @Column(name = "status",nullable = false)
    private int status = CouponStatus.OPEN;   
}
