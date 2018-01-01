package com.willitriseorfall.mvc.data.entities;

public class TopPredictorsEntitie {

	
	private String predictorName;
	private String predictorScore;
	private Double predictorAccuracy;
	
	public TopPredictorsEntitie(String predictorName , String predictorScore , Double predictorAccuracy) {
		this.predictorName = predictorName;
		this.predictorScore = predictorScore;
		this.predictorAccuracy = predictorAccuracy;
	}
	public String getPredictorName() {
		return predictorName;
	}
	public void setPredictorName(String predictorName) {
		this.predictorName = predictorName;
	}
	
	public String getPredictorScore() {
		return predictorScore;
	}
	public void setPredictorScore(String predictorScore) {
		this.predictorScore = predictorScore;
	}
	public Double getPredictorAccuracy() {
		return predictorAccuracy;
	}
	public void setPredictorAccuracy(Double predictorAccuracy) {
		this.predictorAccuracy = predictorAccuracy;
	}
	
	
	
}
