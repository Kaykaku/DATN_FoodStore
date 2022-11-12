package com.foodstore.model.transaction;

import javax.persistence.*;

import com.foodstore.model.entity.Category;
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
@Table(name = "category_foods")
public class CategoryFood implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "category_id",nullable = false)
    private Category category_f ;
    
    @ManyToOne 
    @JoinColumn(name = "food_id",nullable = false)
    private Food food_c;

}
