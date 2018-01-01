package com.willitriseorfall.mvc.service;

import com.willitriseorfall.mvc.model.User;

public interface UserService {
    void save(User user);
    void update(String password , String username);
    User findByUsername(String username);
    User findByEmail(String email);
}
