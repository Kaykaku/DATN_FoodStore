package com.foodstore.model.extend;

import javax.persistence.*;

import com.foodstore.model.entity.Customer;

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
@Table(name = "customer_phone_address")
public class Customer_phone_address implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "customer_id",nullable = false)
    private Customer customer_pa;
    
    @Column(name = "is_address", nullable = false)
    private boolean is_address;
    
    @Column(name = "phone_or_address", length = 500)
    private String phone_or_address;
    
    @Column(name = "is_default", nullable = false)
    private boolean is_default;
}
