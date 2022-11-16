package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.transaction.CategoryFood;

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
@Table(name = "categories")
public class Category implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotBlank(message = "Không được bỏ trống tên danh mục")
    @Column(name = "name", nullable = false, length = 300)
    private String name;
    
    @Column(name = "display_name", length = 300)
    private String display_name;

    @Column(name = "description", length = 1000)
    private String description;
    
    @Column(name = "image_name", length = 300)
    private String image_name;
    
    @Column(name = "color", length = 650)
    private String color;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
    @Column(name = "type")
    private long type;
    
    @ManyToOne 
    @JoinColumn(name = "create_by",nullable = false)
    private User user_c;

	@JsonIgnore
    @OneToMany(mappedBy = "category_f", cascade = CascadeType.ALL) 
    private List<CategoryFood> category_foods;
}
