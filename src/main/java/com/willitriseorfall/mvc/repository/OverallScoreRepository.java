package com.willitriseorfall.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.willitriseorfall.mvc.model.OverallScore;

public interface OverallScoreRepository extends JpaRepository<OverallScore, Integer> {

	public List<OverallScore> findTop10ByOrderByOverallScoreAsc();

	@Modifying
	@Transactional
	@Query("update OverallScore O set O.overallScore =:overallScore , O.totalPredictions =:totalPredictions , O.rightPredictions =:rightPredictions , O.accuracy =:accuracy where O.userId =:userId")
	public void updateOverallScorebyUserid(@Param("userId") Integer userId, @Param("overallScore") Integer overallScore, @Param("totalPredictions") Integer totalPredictions,
			@Param("rightPredictions") Integer rightPredictions, @Param("accuracy") Double accuracy);

}
