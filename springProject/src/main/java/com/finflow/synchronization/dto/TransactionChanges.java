package com.finflow.synchronization.dto;

import lombok.Data;

import java.util.List;

@Data
public class TransactionChanges {
    private List<TransactionDTO> added;
    private List<Integer> deleted;
}
