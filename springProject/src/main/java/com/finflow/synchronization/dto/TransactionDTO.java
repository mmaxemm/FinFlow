package com.finflow.synchronization.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class TransactionDTO {
    private String categoryName; // Linked to Category by name
    private String type;         // Linked to Category by type
    private BigDecimal amount;
    private LocalDateTime transactionDate;
    private String description;  // Optional but helps identify unique transactions
}
