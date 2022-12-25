package com.foodstore.controller.rest;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.extend.History;
import com.foodstore.service.HistoryService;
import com.foodstore.util.constraints.TableName;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/history")
public class HistoryRestController {
	
	@Autowired
	private HistoryService historyService;
	
	@GetMapping("/all")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			List<History> list = historyService.getAll();
			return ResponseEntity.ok(list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "table_name") Optional<String> table_name,
			@RequestParam(value = "user_id") Optional<Long> user_id,
			@RequestParam(value = "record_id") Optional<Long> record_id,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			Page<History> pageX = historyService.getByFilter(
					keyword.orElse("")
					,table_name.orElse(null)
					,user_id
					,create_date
					,record_id
					,PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(pageX);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/tablename")
	public ResponseEntity<?> doGetTableName(){
		List<String> list = new ArrayList<String>();
		list.add(TableName.All);
		list.add(TableName.Category);
		list.add(TableName.Customer);
		list.add(TableName.Discount);
		list.add(TableName.Food);
		list.add(TableName.CategoryFood);
		list.add(TableName.Image);
		list.add(TableName.User);
		list.add(TableName.UserRole);
		list.add(TableName.UserPermission);
		list.add(TableName.Role);
		list.add(TableName.RolePermission);
		list.add(TableName.Order);
		return ResponseEntity.ok(list);
	}
}
