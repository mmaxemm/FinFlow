package com.finflow.synchronization.dto;

import lombok.Data;

import java.util.List;

@Data
public class CategoryChanges {
    private List<CategoryDTO> added;
    private List<Integer> deleted;
}
