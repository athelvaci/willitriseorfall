package com.willitriseorfall.mvc.repository;

import com.willitriseorfall.mvc.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByEmail(String email);
    @Modifying
    @Transactional
    @Query("update User u set u.password = :password where u.username = :username")
    void update(@Param("password") String password , @Param("username") String username );
    
}