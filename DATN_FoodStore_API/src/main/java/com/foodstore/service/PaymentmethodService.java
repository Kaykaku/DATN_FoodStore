package com.foodstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Paymentmethod;


@Service
public interface PaymentmethodService extends IService<Paymentmethod> {
	List<Paymentmethod> getByIsDisplay();

	void deleteLogical(Long id) throws Exception;

	Paymentmethod getByName(String name);
}
