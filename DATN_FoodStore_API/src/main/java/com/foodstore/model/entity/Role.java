package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.transaction.RolePermission;
import com.foodstore.model.transaction.UserRole;
import com.foodstore.util.constraints.Display;

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
@Table(name = "roles")
public class Role implements Serializable {
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
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date = new Date();
    
    @Column(name = "create_by", nullable = false)
    private Long create_by;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display = Display.SHOW;
    
	@JsonIgnore
    @OneToMany(mappedBy = "role_u", cascade = CascadeType.ALL) 
    private List<UserRole> user_roles;
    
	@JsonIgnore
    @OneToMany(mappedBy = "role_p", cascade = CascadeType.ALL) 
    private List<RolePermission> role_permissions;
}
