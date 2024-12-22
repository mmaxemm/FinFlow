package com.finflow.synchronization.dto;

import lombok.Data;

import java.util.List;

@Data
public class CategoryChanges {
    private List<CategoryDTO> added;
    private List<CategoryDTO> deleted; // Use the same attributes as `CategoryDTO` to identify deletions
}
