package com.willitriseorfall.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.willitriseorfall.mvc.model.CurrentValues;

public interface CurrentValuesRepository extends JpaRepository<CurrentValues, Integer> {
	
	 @Modifying
	    @Transactional
	    @Query("update CurrentValues c set c.itemValue = :itemvalue where c.itemId = :itemid")
	    void update(@Param("itemvalue") Double itemvalue , @Param("itemid") Integer itemid );
	
}