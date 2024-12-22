package com.finflow.synchronization.dto;

import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class SyncRequest {
    private LocalDateTime lastChangeDate;
    private TransactionChanges transactions;
    private CategoryChanges categories;
}

