package com.willitriseorfall.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.willitriseorfall.mvc.model.ScoreCategory;

public interface ScoreCategoryRepository extends JpaRepository<ScoreCategory, Integer> {

	@Modifying
	@Transactional
	@Query("update ScoreCategory S set S.score =:score , S.totalPredictions =:totalPredictions , S.rightPredictions =:rightPredictions , S.accuracy =:accuracy where S.userId =:userId and S.itemid =:itemid")
	public void updateOverallScorebyUseridanditemid(@Param("userId") Integer userId, @Param("itemid") Integer itemid, @Param("score") Integer score, @Param("totalPredictions") Integer totalPredictions,
			@Param("rightPredictions") Integer rightPredictions, @Param("accuracy") Double accuracy);
	
	@Query("SELECT S FROM ScoreCategory S WHERE S.userId = :userId and S.itemid =:itemid")
	public List<ScoreCategory> findScoreByUserAndItemid(@Param("userId") Integer userId, @Param("itemid") Integer itemid);
	
	public List<ScoreCategory> findTop10ByItemidOrderByScoreDesc(Integer itemid);
	
	public List<ScoreCategory> findTop10ByItemidOrderByAccuracyDesc(Integer itemid);
}
