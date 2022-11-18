package com.foodstore.util.services;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SessionUtil {

	@Autowired
	HttpSession session;

	public void setAttribute(String name, Object value) {
		session.setAttribute(name, value);
	}

	@SuppressWarnings("unchecked")
	public <T> T getAttribute(String name) {
		return (T) session.getAttribute(name);
	}

	public void removeAttribute(String name) {
		session.removeAttribute(name);
	}
}
