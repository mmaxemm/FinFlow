package com.finflow.synchronization.repository;

import com.finflow.synchronization.entity.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Integer> {
    Optional<TransactionEntity> findByUserIdAndCategoryAndTransactionDateAndAmount(
            Integer userId,
            Integer categoryId,
            LocalDateTime transactionDate,
            BigDecimal amount
    );

    List<TransactionEntity> findAllByUserId(Integer userId);
}
