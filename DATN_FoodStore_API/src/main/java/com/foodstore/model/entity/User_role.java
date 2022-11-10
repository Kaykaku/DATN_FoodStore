package com.foodstore.model.entity;

import javax.persistence.*;

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
@Table(name = "user_roles")
public class User_role implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "user_id",nullable = false)
    private User user_r;
    
    @ManyToOne 
    @JoinColumn(name = "role_id",nullable = false)
    private Role role_u;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
}
