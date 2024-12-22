package com.finflow.synchronization.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.UpdateTimestamp;
import java.time.LocalDateTime;

@Data
@Entity
@Table(
        name = "categories",
        uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "name", "type"})
)
public class CategoryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_id", nullable = false)
    private Integer userId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String type; // "income" or "expense"

    @UpdateTimestamp
    @Column(name = "last_modified", nullable = false)
    private LocalDateTime lastModified;

    @Column
    private Boolean isDeleted = false;

    public CategoryEntity(Integer userId, String name, String type) {
        this.userId = userId;
        this.name = name;
        this.type = type;
    }

    public CategoryEntity() {}
}
