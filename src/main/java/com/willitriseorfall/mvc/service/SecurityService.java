package com.willitriseorfall.mvc.service;

public interface SecurityService {
    String findLoggedInUsername();
    Integer findLoggedInID();

    void autologin(String username, String password);
}
