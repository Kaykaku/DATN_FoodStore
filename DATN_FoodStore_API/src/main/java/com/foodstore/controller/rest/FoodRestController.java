package com.foodstore.controller.rest;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Food;
import com.foodstore.model.entity.User;
import com.foodstore.model.extend.Image;
import com.foodstore.model.transaction.CategoryFood;
import com.foodstore.model.transaction.RolePermission;
import com.foodstore.service.CategoryFoodService;
import com.foodstore.service.FoodService;
import com.foodstore.service.ImageService;
import com.foodstore.service.UserService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/food")
public class FoodRestController {
	
	@Autowired
	private FoodService foodService;
	@Autowired
	private ImageService imageService;

	@Autowired
	private UserService userService;
	@Autowired
	private CategoryFoodService categoryFoodService;
	
	@GetMapping("/all")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			List<Food> list = foodService.getAll();
			return ResponseEntity.ok(list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/detail/{id}")
	public ResponseEntity<?> doGetById(
			@PathVariable("id")Long id) {
		try {
			Food food = foodService.getById(id);
			return ResponseEntity.ok(food);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "price_min") Optional<Double> price_min,
			@RequestParam(value = "price_max") Optional<Double> price_max,
			@RequestParam(value = "quantity") Optional<Integer> quantity,
			@RequestParam(value = "view") Optional<Integer> view,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "create_by") Optional<Long> create_by,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "status") Optional<Integer> status,
			@RequestParam(value = "category_id") Optional<Long> category_id,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {

			Page<Food> pageFood = foodService.getByFilter(
					keyword.orElse("")
					,price_min
					,price_max
					,quantity
					,view
					,create_date
					,status
					,is_display
					,category_id
					,PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(pageFood);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("/create")
	public Food create(@RequestBody Food food) {
		food.setCreate_date(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userService.getByUsername(((UserDetails)principal).getUsername());
		food.setUser_f(user);
		return foodService.create(food);
	}
	
	@PutMapping("/update/{id}")
	public Food update(@RequestBody Food food,@PathVariable("id")Integer id) {
		return foodService.update(food);
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		foodService.delete(id);
	}
	
	@GetMapping("/image/default")
	public ResponseEntity<?> doGetAllDefaultPhone() {
		try {
			List<Image> page = imageService.getByFilter("",Optional.ofNullable(null));
			return ResponseEntity.ok(page);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/image/default/{id}")
	public ResponseEntity<?> doChangeDefault(@PathVariable("id")Long id,@RequestParam("image_id")Long image_id) {
		try {
			Image image1 = imageService.getById(image_id);
			Image image2 = imageService.getByFilter("",Optional.ofNullable(id)).get(0);
			String name1 = image1.getImage_name();
			String name2 = image2.getImage_name();
			image1.setImage_name("TEMPTEMP");
			imageService.update(image1);
			
			image2.setImage_name(name1);
			imageService.update(image2);
			
			image1.setImage_name(name2);
			imageService.update(image1);
			return ResponseEntity.ok(image2);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/image/{id}")
	public ResponseEntity<?> doGetImageById(@PathVariable("id")Long id) {
		try {
			List<Image> page = imageService.getByFilter("",Optional.ofNullable(id));
			return ResponseEntity.ok(page);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("/image/create")
	public Image createImage(@RequestBody Image image) {
		return imageService.create(image);
	}
	
	
	@DeleteMapping("/image/delete/{id}")
	public void deleteImage(@PathVariable("id")Long id) {
		imageService.delete(id);
	}
	
	@GetMapping("/category/{id}")
	public ResponseEntity<?> doGetCategoriesByFoodId(@PathVariable("id")Long id) {
		try {
			List<CategoryFood> page = categoryFoodService.getByFoodId(id);
			return ResponseEntity.ok(page);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	

	@PostMapping("/category/create")
	public CategoryFood addPermission(@RequestBody CategoryFood categoryFood) {
		return categoryFoodService.create(categoryFood);
	}
	
	@DeleteMapping("/category/delete/{id}")
	public void deletePermission(@PathVariable("id")Long id) {
		categoryFoodService.delete(id);
	}
}
