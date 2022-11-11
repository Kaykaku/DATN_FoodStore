package com.foodstore.model.extend;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.foodstore.model.transaction.Review;

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
@Table(name = "comments")
public class Comment implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne 
    @JoinColumn(name = "review_id",nullable = false)
    private Review review;
    
    @NotBlank(message = "Không được bỏ trống tiêu đề")
    @Column(name = "title", nullable = false, length = 200)
    private String title;
    
    @NotBlank(message = "Không được bỏ trống tên nội dung")
    @Column(name = "content", nullable = false, length = 1000)
    private String content;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date create_date;
    
    @Column(name = "update_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date update_date;
    
    @Column(name = "status", nullable = false)
    private int status;
    
    @Column(name = "is_display", nullable = false)
    private boolean is_display;
}
