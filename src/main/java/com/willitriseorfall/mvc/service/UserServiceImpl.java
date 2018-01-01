package com.willitriseorfall.mvc.service;

import com.willitriseorfall.mvc.model.ItemDB;
import com.willitriseorfall.mvc.model.OverallScore;
import com.willitriseorfall.mvc.model.ScoreCategory;
import com.willitriseorfall.mvc.model.User;
import com.willitriseorfall.mvc.repository.ItemDBRepository;
import com.willitriseorfall.mvc.repository.OverallScoreRepository;
import com.willitriseorfall.mvc.repository.RoleRepository;
import com.willitriseorfall.mvc.repository.ScoreCategoryRepository;
import com.willitriseorfall.mvc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
   
    @Autowired
    private ItemDBRepository itemDBRepository;
    @Autowired
    private ScoreCategoryRepository scoreCategoryRepository;
    
    
    private SecureRandom random = new SecureRandom();

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        user.setPasswordToken(new BigInteger(130,random).toString());
        userRepository.save(user);
        
        createScoreCategoryOfUser(user.getId().intValue());	//add user to score category
        
        
    }
    private void createScoreCategoryOfUser(Integer userId){
    	ScoreCategory overallscore = new ScoreCategory();
    	overallscore.setUserId(userId);
    	overallscore.setItemid(0);
    	overallscore.setScore(0);
    	overallscore.setTotalPredictions(0);
    	overallscore.setRightPredictions(0);
    	overallscore.setAccuracy(0.0);
		scoreCategoryRepository.save(overallscore);
    	for (ItemDB item : itemDBRepository.findAll()) {
    		ScoreCategory scoreCategory = new ScoreCategory();
    		scoreCategory.setUserId(userId);
    		scoreCategory.setItemid(item.getItemid());
    		scoreCategory.setScore(0);
    		scoreCategory.setTotalPredictions(0);
    		scoreCategory.setRightPredictions(0);
    		scoreCategory.setAccuracy(0.0);
    		System.out.println("----------------------------"+item.getItem_name());
    		scoreCategoryRepository.save(scoreCategory);
    	}
    }

    @Override
    public void update(String password , String username) {
   
        userRepository.update(bCryptPasswordEncoder.encode(password),username);
    }
    
    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}