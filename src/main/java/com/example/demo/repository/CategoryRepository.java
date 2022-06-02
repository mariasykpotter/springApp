package com.example.demo.repository;

import com.example.demo.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    @Query("SELECT c.categoryName,COUNT(a.activityName),c.id FROM Activity a RIGHT JOIN Category c ON c.id=a.category GROUP BY a.category,c.id,c.categoryName")
    public List<String[]> getActivititiesNumPerCategory();
    @Modifying
    @Query(value = "delete from Category a WHERE a.id IN :categories", nativeQuery = true)
    void deleteCategories(Integer... categories);
}