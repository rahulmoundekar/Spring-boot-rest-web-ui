package com.app.rest.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.app.rest.domain.Product;
import com.app.rest.repo.IProductRepository;

@RestController
public class ProductController {

	@Autowired
	IProductRepository productService;

	/*---Add new product---*/
	@PostMapping(value = "/product/", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ResponseEntity<?> save(@ModelAttribute Product product, BindingResult result) {
		product = productService.save(product);
		return ResponseEntity.ok().body("New product has been saved with ID:" + product.getId());
	}

	/*---Get a product by id---*/
	@GetMapping("/product/{id}")
	public ResponseEntity<Product> get(@PathVariable("id") Long id) {
		Optional<Product> products = productService.findById(id);
		return ResponseEntity.ok().body(products.get());
	}

	/*---get all products---*/
	@GetMapping("/product/")
	@ResponseBody
	public ResponseEntity<List<Product>> list() {
		List<Product> list = new ArrayList<Product>();
		Iterable<Product> products = productService.findAll();
		products.forEach(e -> list.add(e));
		return ResponseEntity.ok().body(list);
	}

	/*---Update a product by id---*/
	@PutMapping("/product/")
	public ResponseEntity<Product> update(@ModelAttribute Product product) {
		product = productService.save(product);
		return ResponseEntity.ok().body(product);
	}

	/*---Delete a product by id---*/
	@DeleteMapping("/product/{id}")
	public ResponseEntity<?> delete(@PathVariable("id") long id) {
		productService.deleteById(id);
		return ResponseEntity.ok().body("product has been deleted successfully.");
	}
}
