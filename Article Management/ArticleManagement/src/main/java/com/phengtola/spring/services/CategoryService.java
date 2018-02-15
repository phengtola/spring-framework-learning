package com.phengtola.spring.services;

import java.util.List;

import com.phengtola.spring.entities.Category;
import com.phengtola.spring.entities.form.CategoryAddFrm;
import com.phengtola.spring.entities.form.CategoryUpdateFrm;

public interface CategoryService {
	
	Category findByUUID(String uuid);
	
	List<Category> findAll();

	boolean update(Category category);

	boolean delete(String uuid);

	boolean updateStatusByUUID(String status, String uuid);

	boolean save(CategoryAddFrm categoryAddFrm);
	
	boolean update(CategoryUpdateFrm categoryUpdateFrm);

}
