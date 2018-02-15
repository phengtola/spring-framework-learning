package com.phengtola.services;

import com.phengtola.domain.Category;
import com.phengtola.domain.form.CategoryAddFrm;
import com.phengtola.domain.form.CategoryUpdateFrm;


import java.util.List;

public interface CategoryService {
	
	Category findByUUID(String uuid);
	
	List<Category> findAll();

	boolean update(Category category);

	boolean delete(String uuid);

	boolean updateStatusByUUID(String status, String uuid);

	boolean save(CategoryAddFrm categoryAddFrm);
	
	boolean update(CategoryUpdateFrm categoryUpdateFrm);

}
