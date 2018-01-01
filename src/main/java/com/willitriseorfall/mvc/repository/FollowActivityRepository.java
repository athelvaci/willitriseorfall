package com.willitriseorfall.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.willitriseorfall.mvc.model.FollowActivity;

public interface FollowActivityRepository extends JpaRepository<FollowActivity, Integer>{

	@Query("SELECT F FROM FollowActivity F WHERE F.userid = :userid AND F.followinguserid = :followinguserid")
	public List<FollowActivity> findIfFollowing(@Param("userid") Integer userid, @Param("followinguserid") Integer followinguserid);
	
	@Query("SELECT F FROM FollowActivity F WHERE F.userid = :userid ")
	public List<FollowActivity> findFollowings(@Param("userid") Integer userid);
	
	@Modifying
	@Transactional
	@Query("DELETE FROM FollowActivity F WHERE F.userid = :userid AND F.followinguserid = :followinguserid")
	public void unfollowuser(@Param("userid") Integer userid, @Param("followinguserid") Integer followinguserid);
}
