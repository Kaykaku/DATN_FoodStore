package com.foodstore.model.transaction;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

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
@Table(name = "food_images")
public class Food_image implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "food_id",nullable = false)
    private Food food_i;
    
    @NotBlank(message = "Không được bỏ trống tên hình")
    @Column(name = "image_name", nullable = false, length = 500)
    private String image_name;
}
