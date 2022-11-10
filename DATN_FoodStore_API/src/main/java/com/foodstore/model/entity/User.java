package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

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
@Table(name = "users")
public class User implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotBlank(message = "Không được bỏ trống username")
    @Column(name = "username", nullable = false, length = 100)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "fullname", length = 200)
    private String fullname;
    
    @Column(name = "gender", nullable = false)
    private boolean gender;
    
    @Column(name = "birthdate")
    @Temporal(TemporalType.DATE)
    private Date birthdate;

    @Column(name = "avatar", length = 100)
    private String avatar;

    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Column(name = "address", length = 200)
    private String address;
    
    @Column(name = "remember_token", length = 100)
    private String remember_token;
    
    @Column(name = "code", length = 100)
    private String code;
   
    @Column(name = "status")
    private long status;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date;
    
    @Column(name = "create_by", nullable = false)
    private Long create_by;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
    
    @OneToMany(mappedBy = "user_p", cascade = CascadeType.ALL) 
    private List<Permission> permissions;
    
    @OneToMany(mappedBy = "user_r", cascade = CascadeType.ALL) 
    private List<Role> roles;
    
    @OneToMany(mappedBy = "user_h", cascade = CascadeType.ALL) 
    private List<History> histories;
    
    @OneToMany(mappedBy = "user_f", cascade = CascadeType.ALL) 
    private List<Food> foods;
}
