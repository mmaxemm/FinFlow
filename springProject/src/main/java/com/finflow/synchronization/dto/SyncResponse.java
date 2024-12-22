package com.finflow.synchronization.dto;

import lombok.Data;

import java.util.List;

@Data
public class SyncResponse {
    private String message;
    private ServerChanges serverChanges;

    @Data
    public static class ServerChanges {
        private List<CategoryDTO> categories;
        private List<TransactionDTO> transactions;
        //private List<CategoryDTO> categorys;
    }
}
