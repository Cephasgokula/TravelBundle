package com.example.TravelBundle.bundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/bundles")
public class BundleController {

    @Autowired
    private BundleService bundleService;

    @PostMapping("/search")
    public ResponseEntity<?> searchBundles(@RequestBody BundleRequest request,
            Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("error", "Please login to search bundles"));
        }

        String userEmail = (String) authentication.getPrincipal();
        BundleResponse response = bundleService.buildBundles(request);
        return ResponseEntity.ok(Map.of(
                "searchedBy", userEmail,
                "result", response));
    }
}
