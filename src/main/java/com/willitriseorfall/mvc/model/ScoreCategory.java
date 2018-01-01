package com.willitriseorfall.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "score_category")
public class ScoreCategory {

	@Id
	@Column(name = "score_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer scoreId;

	@Column(name = "user_id")
	private Integer userId;
	
	@Column(name = "item_id")
	private Integer itemid;
	
	@Column(name = "score")
	private Integer score;
	
	@Column(name = "totalPredictions")
	private Integer totalPredictions;
	
	@Column(name = "rightPredictions")
	private Integer rightPredictions;
	
	@Column(name = "accuracy")
	private Double accuracy;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

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

	
	
}
