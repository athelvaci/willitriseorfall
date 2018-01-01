package com.willitriseorfall.mvc.repository;

import com.willitriseorfall.mvc.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
}