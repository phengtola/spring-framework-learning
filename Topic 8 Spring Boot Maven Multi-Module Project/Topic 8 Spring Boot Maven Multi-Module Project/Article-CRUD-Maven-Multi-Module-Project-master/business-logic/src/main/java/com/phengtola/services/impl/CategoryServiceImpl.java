package com.phengtola.services.impl;

import java.util.List;
import java.util.UUID;

import com.phengtola.domain.Category;
import com.phengtola.domain.form.CategoryAddFrm;
import com.phengtola.domain.form.CategoryUpdateFrm;
import com.phengtola.persistence.CategoryRepository;
import com.phengtola.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CategoryServiceImpl implements CategoryService {

	private CategoryRepository categoryRepo;
	
	@Autowired
	public CategoryServiceImpl(CategoryRepository categoryRepo) {
		this.categoryRepo = categoryRepo;
	}
	
	@Override
	public Category findByUUID(String uuid) {
		return categoryRepo.findByUUID(uuid);
	}

	@Override
	public List<Category> findAll() {
		return categoryRepo.findAll();
	}

	@Override
	public boolean update(Category category) {
		return categoryRepo.update(category);
	}

	@Override
	public boolean delete(String uuid) {
		return categoryRepo.delete(uuid);
	}

	@Override
	public boolean updateStatusByUUID(String status, String uuid) {
		return categoryRepo.updateStatusByUUID(status, uuid);
	}

	@Override
	public boolean save(CategoryAddFrm categoryAddFrm ) {
		Category category = new Category();
		category.setUuid(UUID.randomUUID().toString());
		category.setName(categoryAddFrm.getName());
		category.setRemark(categoryAddFrm.getRemark());
		category.setStatus(categoryAddFrm.getStatus());
		
		
//		category.setDateTime( categoryAddFrm.getDatetime());
//		
//		System.out.println("Frm DATE TIME : " + categoryAddFrm.getDatetime());
//		
//		System.out.println("Cls DATE TIME : " + category.getDateTime());
		
		return categoryRepo.save(category);
	}

	@Override
	public boolean update(CategoryUpdateFrm categoryUpdateFrm) {
		Category category = new Category();
		category.setUuid(categoryUpdateFrm.getUuid());
		category.setName(categoryUpdateFrm.getName());
		category.setRemark(categoryUpdateFrm.getRemark());
		category.setIndex(categoryUpdateFrm.getIndex());
		category.setStatus(categoryUpdateFrm.getStatus());
		return categoryRepo.update(category);
	}
	
	

}
