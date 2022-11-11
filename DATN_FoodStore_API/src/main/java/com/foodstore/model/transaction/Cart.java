package com.foodstore.model.transaction;

import javax.persistence.*;

import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.Food;

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
@Table(name = "cart")
public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "food_id",nullable = false)
    private Food food_cart;
    
    @ManyToOne 
    @JoinColumn(name = "customer_id",nullable = false)
    private Customer customer_cart;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
}
