package com.finflow.synchronization.dto;

import lombok.Data;

import java.util.List;

@Data
public class TransactionChanges {
    private List<TransactionDTO> added;
    private List<TransactionDTO> deleted; // Use the same attributes as `TransactionDTO` to identify deletions
}
