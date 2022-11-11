package com.foodstore.model.transaction;

import javax.persistence.*;

import com.foodstore.model.entity.Customer;

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
@Table(name = "notifications")
public class Notification implements Serializable {
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
    private Order order_n;
    
    @ManyToOne 
    @JoinColumn(name = "customer_id",nullable = false)
    private Customer customer_n;

    @Column(name = "create_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_at;
    
    @Column(name = "content", length = 1000)
    private String content;   
    
    @Column(name = "is_watched", nullable = false)
    private boolean is_watched;
}
