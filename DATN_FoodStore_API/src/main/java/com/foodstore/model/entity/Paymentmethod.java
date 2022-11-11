package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.transaction.Order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "paymentmethods")
public class Paymentmethod implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotBlank(message = "Không được bỏ trống name")
    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "description", length = 1000)
    private String description;
    
    @Column(name = "code", length = 100)
    private String code;
    
    @Column(name = "image_name", length = 100)
    private String image_name;
    
    @Column(name = "status", nullable = false)
    private int status;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
	@JsonIgnore
    @OneToMany(mappedBy = "paymentmethod", cascade = CascadeType.ALL) 
    private List<Order> orders;
}
