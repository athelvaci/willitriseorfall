package com.willitriseorfall.mvc.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.willitriseorfall.mvc.model.ItemDB;


public interface ItemDBRepository extends JpaRepository<ItemDB, Integer> {

	 	@Modifying
	    @Transactional
	    @Query("update ItemDB I set I.item_value = :itemvalue where I.itemid = :itemid")
	    void update(@Param("itemvalue") Double itemvalue , @Param("itemid") Integer itemid );

}
