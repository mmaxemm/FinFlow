package com.finflow.synchronization;

import com.finflow.authorization.UserService;
import com.finflow.synchronization.dto.SyncRequest;
import com.finflow.synchronization.dto.SyncResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/sync")
public class SyncController {

    @Autowired
    private SyncService syncService;

    @Autowired
    private UserService userService;

    @PatchMapping
    public ResponseEntity<?> synchronizeData(
            @RequestBody SyncRequest syncRequest,
            Authentication authentication
    ) {
        String username = authentication.getName();// Get username from auth context
        SyncResponse response = syncService.synchronize(username, syncRequest);
        return ResponseEntity.ok(response);
    }
}

