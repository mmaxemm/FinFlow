package com.finflow.synchronization;

import com.finflow.authorization.UserRepository;
import com.finflow.synchronization.dto.*;
import com.finflow.synchronization.entity.*;
import com.finflow.synchronization.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.math.BigDecimal;

@Service
public class SyncService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public SyncResponse synchronize(String username, SyncRequest syncRequest) {
        Long userId = userRepository.findUserByUsername(username).orElseThrow().getId();

        LocalDateTime lastSyncDate = getLastSyncDate((int) (long) userId);

        // Determine whether to apply or return changes
        if (syncRequest.getLastChangeDate().isAfter(lastSyncDate)) {
            applyChanges((int) (long) userId, syncRequest);
            updateLastSyncDate((int) (long) userId);

            // Return a response indicating changes were applied
            SyncResponse response = new SyncResponse();
            response.setMessage("Client changes applied successfully.");
            return response;
        } else {
            // Return the server changes
            SyncResponse.ServerChanges serverChanges = new SyncResponse.ServerChanges();
            serverChanges.setCategories(categoryRepository
                    .findByUserIdAndLastModifiedAfter((int) (long) userId, lastSyncDate)
                    .stream()
                    .map(this::mapToCategoryDTO)
                    .toList());
            serverChanges.setTransactions(transactionRepository
                    .findByUserIdAndLastModifiedAfter((int) (long) userId, lastSyncDate)
                    .stream()
                    .map(this::mapToTransactionDTO)
                    .toList());

            SyncResponse response = new SyncResponse();
            response.setMessage("Returning server changes.");
            response.setServerChanges(serverChanges);
            return response;
        }
    }


    private void applyChanges(Integer userId, SyncRequest syncRequest) {
        // Apply categories changes
        syncRequest.getCategories().getAdded().forEach(category -> {
            categoryRepository.save(new CategoryEntity(userId, category.getName(), category.getType()));
        });
        syncRequest.getCategories().getDeleted().forEach(categoryRepository::deleteById);

        // Apply transactions changes
        syncRequest.getTransactions().getAdded().forEach(transaction -> {
            transactionRepository.save(new TransactionEntity(
                    userId,
                    Integer.parseInt(transaction.getCategoryID().toString()),  // Link category by ID
                    BigDecimal.valueOf(Double.parseDouble(transaction.getAmount().toString())),
                    LocalDateTime.parse(transaction.getTransactionDate().toString()),
                    transaction.getDescription()
            ));

        });
        syncRequest.getTransactions().getDeleted().forEach(transactionRepository::deleteById);
    }

    private Map<String, Object> getServerChanges(Integer userId, LocalDateTime lastSyncDate) {
        Map<String, Object> changes = new HashMap<>();

        changes.put("transactions", transactionRepository.findByUserIdAndLastModifiedAfter(userId, lastSyncDate));
        changes.put("categories", categoryRepository.findByUserIdAndLastModifiedAfter(userId, lastSyncDate));

        return changes;
    }

    private LocalDateTime getLastSyncDate(Integer userId) {
        userRepository.findLastSyncDate(userId);
        return LocalDateTime.now().minusDays(1); // Placeholder
    }

    private void updateLastSyncDate(Integer userId) {
        // Update last sync date in the metadata table or user record
    }

    public CategoryDTO mapToCategoryDTO(CategoryEntity entity) {
        CategoryDTO dto = new CategoryDTO();
        dto.setId(entity.getId());
        dto.setName(entity.getName());
        dto.setType(entity.getType());
        return dto;
    }

    private TransactionDTO mapToTransactionDTO(TransactionEntity entity) {
        TransactionDTO dto = new TransactionDTO();
        dto.setTransactionId(entity.getTransactionId());
        dto.setCategoryId(entity.getCategory().getId()); // Map category ID
        dto.setCategoryName(entity.getCategory().getName()); // Map category name
        dto.setAmount(entity.getAmount());
        dto.setTransactionDate(entity.getTransactionDate());
        dto.setDescription(entity.getDescription());
        return dto;
    }
}

