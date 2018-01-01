package com.willitriseorfall.mvc.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.willitriseorfall.mvc.model.Prediction;

public interface PredictionRepository extends JpaRepository<Prediction, Integer> {

	@Query("SELECT P FROM Prediction P WHERE P.userid = :userid AND P.itemid = :itemid AND P.is_changable = :is_changable")
	public List<Prediction> findPredicted(@Param("userid") Integer userid, @Param("itemid") Integer itemid, @Param("is_changable") Integer is_changable);

	@Query("SELECT P FROM Prediction P WHERE P.userid = :userid AND P.is_changable = :is_changable")
	public List<Prediction> findByChangable(@Param("userid") Integer userid, @Param("is_changable") Integer is_changable);
	
	@Query("SELECT P FROM Prediction P WHERE P.userid = :userid AND P.prediction_result is not null order by P.predictiontime DESC")
	public List<Prediction> findPredictionHistoryByIdOrdered(@Param("userid") Integer userid);
	
	@Query("SELECT P FROM Prediction P WHERE P.userid = :userid AND P.prediction_result is not null AND P.itemid = :itemid order by P.predictiontime DESC")
	public List<Prediction> findPredictionHistoryByIdAndItemId(@Param("userid") Integer userid, @Param("itemid") Integer itemid);

	public Long countByUserid(Integer userid);

	public Long countByUseridAndItemid(Integer userid, Integer itemid);

	// count prediction with prediction final score and user id
	public Long countByPredictionfinalscoreAndUserid(Integer predictionFinalScore, Integer userid);

	public Long countByPredictionfinalscoreAndUseridAndItemid(Integer predictionFinalScore, Integer userid, Integer itemid);

	public List<Prediction> findByPredictiontimeBetween(Date dayBegin, Date dayEnd);
	
	@Query("SELECT P FROM Prediction P WHERE P.predictiontime between :dayBegin and :dayEnd order by P.predictiontime DESC")
	public List<Prediction> findLatestPredictions(@Param("dayBegin") Date dayBegin, @Param("dayEnd") Date dayEnd);	
	
	public List<Prediction> findTop100ByPredictiontimeBetweenOrderByPredictiontimeDesc(Date dayBegin, Date dayEnd);

	@Modifying
	@Transactional
	@Query("DELETE FROM Prediction P WHERE P.userid = :userid AND P.itemid = :itemid AND P.is_changable = :is_changable")
	public void deletePrediction(@Param("userid") Integer userid, @Param("itemid") Integer itemid, @Param("is_changable") Integer is_changable);

	@Modifying
	@Transactional
	@Query("update Prediction P set P.item_value_end =:item_value_end where P.is_changable =:is_changable and P.item_value_begining is not null and P.prediction_result is null and P.itemid =:itemid")
	public void updateItemEndValue(@Param("item_value_end") Double item_value_end, @Param("is_changable") Integer is_changable, @Param("itemid") Integer itemid);

	@Modifying
	@Transactional
	@Query("update Prediction P set P.item_value_begining =:item_value_begining , P.is_changable =:setischangable where P.is_changable =:whereischangable and P.itemid =:itemid")
	public void updateItemBeginingValueandIsChangable(@Param("item_value_begining") Double item_value_begining, @Param("setischangable") Integer setischangable, @Param("whereischangable") Integer whereischangable,
			@Param("itemid") Integer itemid);

	@Query("SELECT P FROM Prediction P WHERE P.item_value_end is not null AND P.item_value_begining is not null AND P.prediction_result is null AND P.itemid =:itemid ")
	public List<Prediction> findResultedPredictionsByItemId(@Param("itemid") Integer itemid);

	@Modifying
	@Transactional
	@Query("update Prediction P set P.prediction_result =:prediction_result where P.itemid =:itemid AND P.item_value_begining is not null AND P.item_value_end is not null")
	public void updatepredictionresultByItemId(@Param("prediction_result") String prediction_result, @Param("itemid") Integer itemid);

	@Modifying
	@Transactional
	@Query("update Prediction P set P.predictionfinalscore =:predictionfinalscore where P.prediction_id =:prediction_id")
	public void updatepredictionfinalscorebyID(@Param("predictionfinalscore") Integer predictionfinalscore, @Param("prediction_id") Integer prediction_id);

	// find sum of predictionfinalscore by user id
	@Query(value = "select sum(predictionfinalscore) from Prediction P where P.userid = :userid")
	public Integer findSumOfpredictionfinalscore(@Param("userid") Integer userid);

	// find sum of predictionfinalscore by user id and item id
	@Query(value = "select sum(predictionfinalscore) from Prediction P where P.userid = :userid and P.itemid = :itemid")
	public Integer findSumOfpredictionfinalscorebyItemId(@Param("userid") Integer userid, @Param("itemid") Integer itemid);

}
