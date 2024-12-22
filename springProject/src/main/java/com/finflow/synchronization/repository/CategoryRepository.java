package com.finflow.synchronization.repository;

import com.finflow.synchronization.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
    Optional<CategoryEntity> findByUserIdAndNameAndType(Integer userId, String name, String type);

    List<CategoryEntity> findAllByUserId(Integer userId);

}
