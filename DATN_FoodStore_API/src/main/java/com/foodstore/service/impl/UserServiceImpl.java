package com.foodstore.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserDAO;
import com.foodstore.model.entity.User;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.convert.Convert;

@Service
public class UserServiceImpl implements UserService {

	@Autowired private UserDAO userDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public User getById(Long id) {
		return userDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<User> getAll() {
		return userDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public User create(User entiy) {
		return userDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public User update(User entiy) {
		return userDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		userDAO.deleteById(id);
	}

	@Override
	public Page<User> getAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<User> getByIsDisPlay() {
		return userDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<User> getByIsDisplay(Pageable pageable) throws Exception {
		return userDAO.findByIsDisplay(Display.SHOW, pageable);
	}
	
	@Override
	public User getByUsername(String username) {
		return userDAO.findByUsername(username).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		userDAO.deleteLogical(Display.HIDE, id);
	}



	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public String[] getAllPermission(String username) {
		User user = userDAO.findByUsername(username).orElse(null);
		if(user == null)return null;
		Set<String> set = new HashSet<>();
		user.getUser_roles().forEach(r ->r.getRole_u().getRole_permissions().forEach(p -> set.add(p.getPermission_r().getName())));
		user.getUser_permissions().forEach(p ->set.add(p.getPermission_u().getName()));
		return set.toArray(new String[0]);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public User getByEmail(String email) {
		return userDAO.findByEmail(email).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<User> getByKeyword(String keyword) {
		return userDAO.findByKeyword(keyword);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<User> getByFilter(String keyword, Optional<Boolean> gender, Optional<Long> birth_date ,  Optional<Long> create_date, Optional<Long> create_by,
			Optional<Boolean> is_display, Optional<Integer> status,Optional<Long> role_id, Pageable pageable) {
		List<User> list = getByFilter(keyword,gender,birth_date,create_date,create_by,is_display,status,role_id);
		Page<User> page =(Page<User>) Convert.toPage(list, pageable);
		return page ;
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<User> getByFilter(String keyword, Optional<Boolean> gender, Optional<Long> birth_date,
			Optional<Long> create_date, Optional<Long> create_by, Optional<Boolean> is_display,
			Optional<Integer> status,Optional<Long> role_id) {
		List<User> list = userDAO.findByKeyword(keyword.trim());
		if(gender.isPresent()) list = list.stream().filter(o-> o.isGender() == gender.get()).toList();
		if(birth_date.isPresent()) list = list.stream().filter(o-> o.getBirthday().getTime() >= birth_date.get()).toList();
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date().getTime() >= create_date.get()).toList();
		if(create_by.isPresent()) list = list.stream().filter(o-> o.getCreate_by() == create_by.get()).toList();
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() >= status.get()).toList();
		if(role_id.isPresent()) list = list.stream().filter(o-> o.getUser_roles().stream().anyMatch(ur -> ur.getRole_u().getId() ==role_id.get())).toList();

		return list ;
	}
}
