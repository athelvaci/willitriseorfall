package com.willitriseorfall.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "treshold")
public class Treshold {

	@Id
	@Column(name = "treshold_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer tresholdId;

	@Column(name = "value_raise")
	private Double valueRise;

	@Column(name = "vale_fall")
	private Double valueFall;

	@Column(name = "score_successful")
	private Integer scoreSuccessful;

	@Column(name = "score_fail")
	private Integer scoreFail;

	@Column(name = "change_rate_percent")
	private Double changeRate;

	public Integer getTresholdId() {
		return tresholdId;
	}

	public void setTresholdId(Integer tresholdId) {
		this.tresholdId = tresholdId;
	}

	public Double getValueRise() {
		return valueRise;
	}

	public void setValueRise(Double valueRise) {
		this.valueRise = valueRise;
	}

	public Double getValueFall() {
		return valueFall;
	}

	public void setValueFall(Double valueFall) {
		this.valueFall = valueFall;
	}

	public Integer getScoreSuccessful() {
		return scoreSuccessful;
	}

	public void setScoreSuccessful(Integer scoreSuccessful) {
		this.scoreSuccessful = scoreSuccessful;
	}

	public Integer getScoreFail() {
		return scoreFail;
	}

	public void setScoreFail(Integer scoreFail) {
		this.scoreFail = scoreFail;
	}

	public Double getChangeRate() {
		return changeRate;
	}

	public void setChangeRate(Double changeRate) {
		this.changeRate = changeRate;
	}

}
