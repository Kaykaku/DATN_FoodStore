package com.foodstore.model.transaction;

import javax.persistence.*;

import com.foodstore.model.entity.Permission;
import com.foodstore.model.entity.User;

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
@Table(name = "user_permissions")
public class User_permission implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "user_id",nullable = false)
    private User user_p;
    
    @ManyToOne 
    @JoinColumn(name = "permission_id",nullable = false)
    private Permission permission_u;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
}
