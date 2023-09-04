package com.org.abitmedia.repository;

import com.org.abitmedia.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    Boolean existsByEmail(String email);

    User findUserById(Long id);
}
