package com.willitriseorfall.mvc.scheduling;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.willitriseorfall.mvc.model.CurrentValues;
import com.willitriseorfall.mvc.model.ItemDB;
import com.willitriseorfall.mvc.model.OverallScore;
import com.willitriseorfall.mvc.model.Prediction;
import com.willitriseorfall.mvc.model.ScoreCategory;
import com.willitriseorfall.mvc.model.Treshold;
import com.willitriseorfall.mvc.repository.CurrentValuesRepository;
import com.willitriseorfall.mvc.repository.ItemDBRepository;
import com.willitriseorfall.mvc.repository.OverallScoreRepository;
import com.willitriseorfall.mvc.repository.PredictionRepository;
import com.willitriseorfall.mvc.repository.ScoreCategoryRepository;
import com.willitriseorfall.mvc.repository.TresholdRepository;

@Component("scoreUpdater")
public class ScoreUpdater {
	/*
	 * set item value end where is changable 0 and item value beginning not null set prediction result where item value beginning and end not null and prediction result is null set prediction final score where item value beginning and item value end not null and prediction result is not null set scores of users set item value from current values
	 * 
	 */

	@Autowired
	private PredictionRepository predictionRepository;

	@Autowired
	private CurrentValuesRepository currentValuesRepository;

	@Autowired
	private TresholdRepository tresholdRepository;

	@Autowired
	private OverallScoreRepository overallScoreRepository;
	@Autowired
	private ScoreCategoryRepository scoreCategoryRep;

	@Autowired
	private ItemDBRepository itemDB;

	public void updateScore() {
		System.out.println("updatePredictionEndValue" + updatePredictionEndValue());
		System.out.println("scoreResultedPredictions" + scoreResultedPredictions());
		System.out.println("updateScoreCategory" + updateScoreCategory());
		System.out.println("updateItemValue" + updateItemValue());
	}

	private boolean updatePredictionEndValue() {
		System.out.println("updatePredictionEndValue on action");
		try {
			for (CurrentValues currentValues : currentValuesRepository.findAll()) {
				predictionRepository.updateItemEndValue(currentValues.getItemValue(), 0, currentValues.getItemId());
			}

			System.out.println("updatePredictionEndValue end action");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	private boolean scoreResultedPredictions() {

		try {

			for (Treshold treshold : tresholdRepository.findAll()) {
				List<Prediction> predictions = predictionRepository.findResultedPredictionsByItemId(treshold.getTresholdId());

				String predictionPoint = null;
				if (predictions != null) {
					Double yesterdayValue = itemDB.findOne(treshold.getTresholdId()).getItem_value();
					Double currentValue = currentValuesRepository.findOne(treshold.getTresholdId()).getItemValue();
					// Double yesterdayValue = predictions.get(0).getItem_value_begining();
					// Double currentValue = predictions.get(0).getItem_value_end();
					Double rise = yesterdayValue + yesterdayValue * treshold.getChangeRate();// rise value

					Double fall = yesterdayValue - yesterdayValue * treshold.getChangeRate();// fall value

					if (currentValue > rise) {
						predictionPoint = "rise";
						// System.out.println("item rise");
						predictionRepository.updatepredictionresultByItemId("rise", treshold.getTresholdId());
					} else if (currentValue < fall) {
						// System.out.println("item fall");
						predictionPoint = "fall";
						predictionRepository.updatepredictionresultByItemId("fall", treshold.getTresholdId());
					} else {
						// System.out.println("item stable");
						predictionPoint = "stable";
						predictionRepository.updatepredictionresultByItemId("stable", treshold.getTresholdId());
					}

					for (Prediction prediction : predictions) {
						if (prediction.getPrediction_point().toLowerCase().equals(predictionPoint)) {

							predictionRepository.updatepredictionfinalscorebyID(treshold.getScoreSuccessful(), prediction.getPrediction_id());

							// System.out.println(prediction.getPrediction_id() + "--true prediction");
						} else {
							predictionRepository.updatepredictionfinalscorebyID(treshold.getScoreFail(), prediction.getPrediction_id());
							// System.out.println(prediction.getPrediction_id() + "--false prediction");
						}

					}

				} else {
					System.out.println("prediction is empty");
				}
			}
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	

	private boolean updateScoreCategory() {
		try {
			
			for (ScoreCategory scoreCategory : scoreCategoryRep.findAll()) {
				DecimalFormat df = new DecimalFormat("#.00");
				Double accuracy = 0.0;
				Integer overallScore= 0;
				Integer totalPredictions = 0;
				Integer rightPredictions = 0;
				if (scoreCategory.getItemid() == 0) { // overall score of user with all items
					 overallScore = predictionRepository.findSumOfpredictionfinalscore(scoreCategory.getUserId());
					if (overallScore == null) {
						overallScore = 0;
					}
					 totalPredictions = predictionRepository.countByUserid(scoreCategory.getUserId()).intValue();

					 rightPredictions = predictionRepository.countByPredictionfinalscoreAndUserid(5, scoreCategory.getUserId()).intValue();
					if (totalPredictions != 0) {
						
						accuracy =Double.parseDouble(df.format((rightPredictions.doubleValue() / totalPredictions.doubleValue())*100)) ;
						
					}
					scoreCategoryRep.updateOverallScorebyUseridanditemid(scoreCategory.getUserId(), scoreCategory.getItemid(), overallScore, totalPredictions, rightPredictions, accuracy);
				} else {	//overall score of user with spesific item
					 overallScore = predictionRepository.findSumOfpredictionfinalscorebyItemId(scoreCategory.getUserId(), scoreCategory.getItemid());
					if (overallScore == null) {
						overallScore = 0;
					}
					totalPredictions = predictionRepository.countByUseridAndItemid(scoreCategory.getUserId(), scoreCategory.getItemid()).intValue();
					rightPredictions = predictionRepository.countByPredictionfinalscoreAndUseridAndItemid(5, scoreCategory.getUserId(), scoreCategory.getItemid()).intValue();
					if (totalPredictions != 0) {
						accuracy =Double.parseDouble(df.format((rightPredictions.doubleValue() / totalPredictions.doubleValue())*100)) ;
					}
					scoreCategoryRep.updateOverallScorebyUseridanditemid(scoreCategory.getUserId(), scoreCategory.getItemid(), overallScore, totalPredictions, rightPredictions, accuracy);
				}
			}
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}

	}
	
	private boolean updateItemValue(){	//update item value from item table
		try {
			for (CurrentValues current : currentValuesRepository.findAll()) {
				itemDB.update(current.getItemValue(), current.getItemId());
			}
			
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

}
