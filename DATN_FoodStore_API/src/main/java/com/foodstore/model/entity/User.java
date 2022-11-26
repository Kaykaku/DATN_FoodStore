package com.foodstore.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodstore.model.extend.History;
import com.foodstore.model.transaction.UserPermission;
import com.foodstore.model.transaction.UserRole;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.Gender;
import com.foodstore.util.constraints.ImageConstraints;
import com.foodstore.util.constraints.Password;

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
    private String password = Password.Default;

    @Column(name = "fullname", length = 200)
    private String fullname;
    
    @Column(name = "gender", nullable = false)
    private boolean gender = Gender.MALE;
    
    @Column(name = "birthday")
    @Temporal(TemporalType.DATE)
    private Date birthday;

    @Column(name = "avatar", length = 100)
    private String avatar = ImageConstraints.DEFAULT_AVATAR;

    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Column(name = "phone", length = 100)
    private String phone;
    
    @Column(name = "address", length = 200)
    private String address;
    
    @Column(name = "remember_token", length = 100)
    private String remember_token;
    
    @Column(name = "code", length = 100)
    private String code;
   
    @Column(name = "status", nullable = true)
    private long status = 0;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.DATE)
    private Date create_date = new Date();
    
    @Column(name = "create_by")
    private Long create_by;
    
    @Column(name = "is_display")
    private boolean is_display = Display.SHOW;
    
	@JsonIgnore
    @OneToMany(mappedBy = "user_p", cascade = CascadeType.ALL) 
    private List<UserPermission> user_permissions;
    
	@JsonIgnore
    @OneToMany(mappedBy = "user_r", cascade = CascadeType.ALL) 
    private List<UserRole> user_roles;
    
	@JsonIgnore
    @OneToMany(mappedBy = "user_h", cascade = CascadeType.ALL) 
    private List<History> histories;
    
	@JsonIgnore
    @OneToMany(mappedBy = "user_f", cascade = CascadeType.ALL) 
    private List<Food> foods;
    
	@JsonIgnore
    @OneToMany(mappedBy = "user_c", cascade = CascadeType.ALL) 
    private List<Category> categories;
	
	@JsonIgnore
    @OneToMany(mappedBy = "user_cp", cascade = CascadeType.ALL) 
    private List<Coupon> coupons;
	
}
