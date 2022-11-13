package com.foodstore.model.transaction;

import javax.persistence.*;
import javax.validation.constraints.Min;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.Paymentmethod;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.OrderStatus;
import com.foodstore.util.constraints.Watch;

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
@Table(name = "orders")
public class Order implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
	
    @ManyToOne 
    @JoinColumn(name = "customer_id",nullable = false)
    private Customer customer_o;
    
    @ManyToOne 
    @JoinColumn(name = "payment_id",nullable = false)
    private Paymentmethod paymentmethod;

    @Column(name = "order_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date order_date = new Date();
    
    @Column(name = "shipped_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date shipped_date;
    
    @Column(name = "shipped_address", length = 500)
    private String shipped_address;

    @Column(name = "shipped_phone", length = 50)
    private String shipped_phone;

    @Column(name = "fee", nullable = false)
    @Min(value = 0, message = "Phí phải lớn hoặc bằng 0")
    private double fee;
    
    @Column(name = "paid_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paid_date;
    
    @Column(name = "status", nullable = false)
    private int status = OrderStatus.WAITING;
    
    @Column(name = "is_watched", nullable = false)
    private boolean is_watched = Watch.NOTYET;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display = Display.SHOW;
    
	@JsonIgnore
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL) 
    private List<OrderDetail> order_details;
    
}
