package com.app.rest.repo;

import org.springframework.data.repository.CrudRepository;
import com.app.rest.domain.Product;

public interface IProductRepository extends CrudRepository<Product, Long> {

}
