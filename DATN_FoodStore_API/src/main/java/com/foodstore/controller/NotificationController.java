package com.foodstore.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.model.extend.Comment;
import com.foodstore.model.extend.Notification;
import com.foodstore.model.transaction.Review;
import com.foodstore.service.CommentService;
import com.foodstore.service.NotificationService;
import com.foodstore.service.ReviewService;

@Controller
@RequestMapping("user")
public class NotificationController {
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/notification/{id}")
	public String checkNotificatio(@PathVariable(value = "id") Long id,Model model) {
		Notification notification = notificationService.getById(id);
		notification.set_watched(true);
		notificationService.update(notification);
		return "redirect:/user/"+notification.getTable_name()+"/"+notification.getRecord_id();
	}
	
	@GetMapping("/rating/{id}")
	public String rating(@PathVariable(value = "id") Long id,@RequestParam(value = "rating")int rating,Model model) {
		Review review = reviewService.getById(id);
		review.setRating(rating);
		reviewService.update(review);
		return "redirect:/shop/detail/"+review.getFood_r().getId();
	}
	
	@PostMapping("/comment/{id}")
	public String comment(@PathVariable(value = "id") Long id,@RequestParam(value = "content")String content,Model model) {
		Review review = reviewService.getById(id);
		Comment comment = new Comment();
		comment.setReview(review);
		comment.setContent(content);
		comment.setTitle(content);
		commentService.create(comment);
		return "redirect:/shop/detail/"+review.getFood_r().getId();
	}
}
