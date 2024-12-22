package com.finflow.synchronization.dto;

import lombok.Data;

@Data
public class CategoryDTO {
    private String name; // Unique per user and type
    private String type; // "income" or "expense"
}
