package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CommentDAO;
import com.foodstore.model.extend.Comment;
import com.foodstore.service.CommentService;


@Service
public class CommentServiceImpl implements CommentService {
	@Autowired private CommentDAO commentDAO;
	
	@Override
	public Comment getById(Long id) {
		// TODO Auto-generated method stub
		return commentDAO.findById(id).get();
	}

	@Override
	public List<Comment> getAll() {
		// TODO Auto-generated method stub
		return commentDAO.findAll();
	}

	@Override
	public Comment create(Comment cart) {
		// TODO Auto-generated method stub
		return commentDAO.save(cart);
	}

	@Override
	public Comment update(Comment cart) {
		// TODO Auto-generated method stub
		return commentDAO.save(cart);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		commentDAO.deleteById(id);
	}

}
