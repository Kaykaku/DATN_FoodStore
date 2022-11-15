package com.foodstore.model.transaction;

import javax.persistence.*;
import javax.validation.constraints.Min;

import com.foodstore.model.entity.Food;
import com.foodstore.util.constraints.Amount;
import com.foodstore.util.constraints.Display;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "order_details")
public class OrderDetail implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
	
    @ManyToOne 
    @JoinColumn(name = "order_id",nullable = false)
    private Order order;
    
    @ManyToOne 
    @JoinColumn(name = "food_id",nullable = false)
    private Food food_od;

    @Column(name = "price", nullable = false)
    @Min(value = 0, message = "Giá phải lớn hơn 0")
    private double price =0;

    @Column(name = "quantity", nullable = false)
    @Min(value = 0, message = "Số lượng phải lớn hơn hoặc bằng 0")
    private int quantity= 0;
    
    @Column(name = "discount_amount", nullable = false)
    @Min(value = 0, message = "Lượng giảm giá phải lớn hơn 0")
    private double amount = 0;
    
    @Column(name = "is_fixed", nullable = false)
    private boolean is_fixed = Amount.PERCENT;
    
    @Column(name = "coupon_code", length = 100)
    private String coupon_code;
    
    @Column(name = "memo", length = 1000)
    private String memo;
    
    @Column(name = "status", nullable = false)
    private int status;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display = Display.SHOW;
}
