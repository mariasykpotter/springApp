package com.example.demo.service;

import com.example.demo.model.Category;
import com.example.demo.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;
    public void saveCategory(Category category) {
        categoryRepository.save(category);
    }

    public List<Category> findAllCategories() {
        return categoryRepository.findAll();
    }
    public List<String[]> getActivititiesNumPerCategory(){
        return categoryRepository.getActivititiesNumPerCategory();
    }
    public void delete(Integer... ids) {
        categoryRepository.deleteCategories(ids);
    }
}
