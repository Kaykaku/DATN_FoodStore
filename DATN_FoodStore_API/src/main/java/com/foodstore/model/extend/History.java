package com.foodstore.model.extend;

import javax.persistence.*;

import com.foodstore.model.entity.User;

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
@Table(name = "histories")
public class History implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "user_id",nullable = false)
    private User user_h;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date;
    
    @Column(name = "record_id", nullable = false)
    private Long record_id;
    
    @Column(name = "table_name" ,nullable = false, length = 100)
    private String table_name;
    
    @Column(name = "memo" ,nullable = true, length = 1000)
    private String memo;
}
