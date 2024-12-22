package com.finflow.synchronization.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "transactions")
public class TransactionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer transactionId;

    @Column(name = "user_id", nullable = false)
    private Integer userId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = false, foreignKey = @ForeignKey(name = "transactions_category_id_fkey"))
    private CategoryEntity category;

    @Column(nullable = false, precision = 15, scale = 2)
    private BigDecimal amount;

    @CreationTimestamp
    @Column(name = "transaction_date", nullable = false)
    private LocalDateTime transactionDate;

    @UpdateTimestamp
    @Column(name = "last_modified", nullable = false)
    private LocalDateTime lastModified;

    @Column
    private Boolean isDeleted = false;

    @Column
    private String description;

    public TransactionEntity(Integer userId, CategoryEntity category, BigDecimal amount, LocalDateTime transactionDate, String description) {
        this.userId = userId;
        this.category = category;
        this.amount = amount;
        this.transactionDate = transactionDate;
        this.description = description;
    }

    public TransactionEntity() {}
}

