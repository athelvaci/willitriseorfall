package com.willitriseorfall.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "overall_score")
public class OverallScore {

	@Id
	@Column(name = "user_id")
	private Integer userId;

	@Column(name = "overall_score")
	private Integer overallScore;
	
	@Column(name = "totalPredictions")
	private Integer totalPredictions;
	
	@Column(name = "rightPredictions")
	private Integer rightPredictions;
	
	@Column(name = "accuracy")
	private Double accuracy;

	public Integer getTotalPredictions() {
		return totalPredictions;
	}

	public void setTotalPredictions(Integer totalPredictions) {
		this.totalPredictions = totalPredictions;
	}

	public Integer getRightPredictions() {
		return rightPredictions;
	}

	public void setRightPredictions(Integer rightPredictions) {
		this.rightPredictions = rightPredictions;
	}

	public Double getAccuracy() {
		return accuracy;
	}

	public void setAccuracy(Double accuracy) {
		this.accuracy = accuracy;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getOverallScore() {
		return overallScore;
	}

	public void setOverallScore(Integer overallScore) {
		this.overallScore = overallScore;
	}
}
