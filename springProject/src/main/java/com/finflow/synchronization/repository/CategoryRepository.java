package com.finflow.synchronization.repository;

import com.finflow.synchronization.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
    List<CategoryEntity> findByUserIdAndLastModifiedAfter(Integer userId, LocalDateTime lastModified);

    public void deleteById(Integer id);
}
