package com.foodstore.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Paymentmethod;
import com.foodstore.service.PaymentmethodService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/paymentmethods")
@Slf4j
public class PaymentmethodApi {

	@Autowired
	private PaymentmethodService paymentService;

	@GetMapping("")
	public ResponseEntity<?> doGetAll() {
		List<Paymentmethod> payments = paymentService.getByIsDisplay();
		if (payments.size() == 0 || payments.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}

		return ResponseEntity.ok(payments);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		Paymentmethod paymentResp = paymentService.getById(id);
		if (ObjectUtils.isEmpty(paymentResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(paymentResp);
	}

	@PostMapping("/add")
	public ResponseEntity<?> doCreate(@Valid @RequestBody Paymentmethod paymentReq) {
		try {
			if (paymentService.getByName(paymentReq.getName()) != null) {
				log.error("Name đã tồn tại!");
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			} else {
				log.info("Create Successfully!");
				return new ResponseEntity<>(paymentService.create(paymentReq), HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! --->" + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody Paymentmethod paymentReq, @PathVariable("id") Long id) {
		Paymentmethod currentPayment = paymentService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentPayment)) {
				log.info("Update Successfully!");
				return new ResponseEntity<>(paymentService.update(paymentReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		try {
			paymentService.deleteLogical(id);
			log.info("Detele " + id + " Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception ex) {
			log.error("Delete Failed ---> " + ex.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
