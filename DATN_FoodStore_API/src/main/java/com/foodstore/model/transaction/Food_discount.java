package com.foodstore.model.transaction;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import com.foodstore.model.entity.Food;
import com.foodstore.model.entity.User;

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
@Table(name = "food_discounts")
public class Food_discount implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "food_id",nullable = false)
    private Food food_d;
    
    @NotBlank(message = "Không được bỏ trống tên chương trình khuyến mãi")
    @Column(name = "name", nullable = false, length = 300)
    private String name;
    
    @Column(name = "amount", nullable = false)
    @Min(value = 0, message = "Lượng giảm giá phải lớn hơn 0")
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
    
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
    @ManyToOne 
    @JoinColumn(name = "create_by",nullable = false)
    private User user_d;

}
