package com.org.abitmedia.controller;

import com.org.abitmedia.domain.User;
import com.org.abitmedia.pagosmedios.payload.RequestData;
import com.org.abitmedia.pagosmedios.payload.UserData;
import com.org.abitmedia.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @PutMapping(value = "/update-user")
    @PreAuthorize("hasAnyAuthority('STANDAR_USER')")
    public ResponseEntity<?> UpdateUser(@Valid @RequestBody UserData userData) {
        User user = userRepository.findUserById(userData.getUser_id());
        if (user != null) {
            user.setName(userData.getName());
            user.setLastName(userData.getLastName());
            user.setEmail(userData.getEmail());
            Boolean valid = userRepository.existsByEmail(userData.getEmail());
            if (valid)
                return ResponseEntity.badRequest().body(true);
        }
        userRepository.save(user);
        return ResponseEntity.ok(userData);
    }

    @GetMapping(value = "/get-user/{id}")
    @PreAuthorize("hasAnyAuthority('STANDAR_USER')")
    public ResponseEntity<?> GetUser(@PathVariable Long id) {
        User user = userRepository.findUserById(id);
        return ResponseEntity.ok(user);
    }

}
