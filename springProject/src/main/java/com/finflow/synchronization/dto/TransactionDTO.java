package com.finflow.synchronization.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class TransactionDTO {
    private Integer transactionId;
    private Integer categoryId;
    private String categoryName;
    private BigDecimal amount;
    private LocalDateTime transactionDate;
    private String description;
}

