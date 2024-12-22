package com.finflow.synchronization;

import com.finflow.synchronization.dto.*;
import com.finflow.synchronization.entity.*;
import com.finflow.synchronization.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class SyncService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Transactional
    public SyncResponse synchronize(String username, SyncRequest syncRequest) {
        Integer userId = findUserIdByUsername(username);

        if (syncRequest.getLastChangeDate().isAfter(getLastSyncDate(userId))) {
            applyChanges(userId, syncRequest);
            return buildResponse("Client changes applied successfully.", userId);
        } else {
            return buildResponse("Returning server changes.", userId);
        }
    }

    private void applyChanges(Integer userId, SyncRequest syncRequest) {
        // Apply categories
        for (CategoryDTO category : syncRequest.getCategories().getAdded()) {
            categoryRepository.findByUserIdAndNameAndType(userId, category.getName(), category.getType())
                    .orElseGet(() -> categoryRepository.save(new CategoryEntity(userId, category.getName(), category.getType())));
        }

        // Apply transactions
        for (TransactionDTO transaction : syncRequest.getTransactions().getAdded()) {
            CategoryEntity category = categoryRepository.findByUserIdAndNameAndType(userId, transaction.getCategoryName(), transaction.getType())
                    .orElseThrow(() -> new IllegalStateException("Category not found: " + transaction.getCategoryName()));

            transactionRepository.findByUserIdAndCategoryAndTransactionDateAndAmount(userId, category.getId(), transaction.getTransactionDate(), transaction.getAmount())
                    .orElseGet(() -> transactionRepository.save(new TransactionEntity(userId, category, transaction.getAmount(), transaction.getTransactionDate(), transaction.getDescription())));
        }
    }

    private SyncResponse buildResponse(String message, Integer userId) {
        SyncResponse response = new SyncResponse();
        response.setMessage(message);

        SyncResponse.ServerChanges serverChanges = new SyncResponse.ServerChanges();
        serverChanges.setCategories(mapToCategoryDTOs(categoryRepository.findAllByUserId(userId)));
        serverChanges.setTransactions(mapToTransactionDTOs(transactionRepository.findAllByUserId(userId)));

        response.setServerChanges(serverChanges);
        return response;
    }

    private Integer findUserIdByUsername(String username) {
        // Mocked; replace with actual user lookup
        return 1;
    }

    private LocalDateTime getLastSyncDate(Integer userId) {
        // Placeholder; fetch last sync date
        return LocalDateTime.now().minusDays(1);
    }

    private List<CategoryDTO> mapToCategoryDTOs(List<CategoryEntity> entities) {
        return entities.stream().map(entity -> {
            CategoryDTO dto = new CategoryDTO();
            dto.setName(entity.getName());
            dto.setType(entity.getType());
            return dto;
        }).toList();
    }

    private List<TransactionDTO> mapToTransactionDTOs(List<TransactionEntity> entities) {
        return entities.stream().map(entity -> {
            TransactionDTO dto = new TransactionDTO();
            dto.setCategoryName(entity.getCategory().getName());
            dto.setType(entity.getCategory().getType());
            dto.setAmount(entity.getAmount());
            dto.setTransactionDate(entity.getTransactionDate());
            dto.setDescription(entity.getDescription());
            return dto;
        }).toList();
    }
}
