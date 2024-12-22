package com.finflow.synchronization.repository;

import com.finflow.synchronization.entity.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Integer> {
    List<TransactionEntity> findByUserIdAndLastModifiedAfter(Integer userId, LocalDateTime lastModified);

    public void deleteById(Integer id);
}
