package com.foodstore.model.transaction;

import javax.persistence.*;

import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.Food;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.Favorite;
import com.foodstore.util.constraints.ReviewStatus;

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
@Table(name = "reviews")
public class Review implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "food_id",nullable = false)
    private Food food_r;
    
    @ManyToOne 
    @JoinColumn(name = "customer_id",nullable = false)
    private Customer customer_r;
    
    @Column(name = "rating")
    private int rating =0;
    
    @Column(name = "views", nullable = false)
    private int views =0;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date = new Date();
    
    @Column(name = "update_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date update_date;
    
    @Column(name = "status", nullable = false)
    private int status = ReviewStatus.DEFAULT;
    
    @Column(name = "is_favorite", nullable = false)
    private boolean is_favorite = Favorite.NO;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display = Display.SHOW;
}
