package com.phengtola.spring.services;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phengtola.spring.entities.Category;
import com.phengtola.spring.entities.form.CategoryForm;
import com.phengtola.spring.entities.form.CategoryFrm;
import com.phengtola.spring.entities.form.CategoryFrmPP;
import com.phengtola.spring.entities.responses.Pagination;

public interface CategoryService {
	
	Category findByUUID(String uuid);
	
	List<Category> findAll();

	boolean update(Category category);

	boolean delete(String uuid);

	boolean updateStatusByUUID(String status, String uuid);

	boolean save(CategoryFrmPP categoryFrmPP);

}
