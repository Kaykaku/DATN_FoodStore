package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.transaction.Role_permission;
import com.foodstore.model.transaction.User_permission;

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
@Table(name = "permissions")
public class Permission implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotBlank(message = "Không được bỏ trống name")
    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "display_name", length = 100)
    private String display_name;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
	@JsonIgnore
    @OneToMany(mappedBy = "permission_u", cascade = CascadeType.ALL) 
    private List<User_permission> user_permissions;
    
	@JsonIgnore
    @OneToMany(mappedBy = "permission_r", cascade = CascadeType.ALL) 
    private List<Role_permission> role_permissions;
}
