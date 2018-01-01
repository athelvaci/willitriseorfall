package com.willitriseorfall.mvc.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "prediction")
public class Prediction {
	@Id
	@Column(name = "prediction_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer prediction_id;
	
	@Column(name="user_id")
	private Integer userid;
	
	@Column(name="item_id")
	private Integer itemid;
	
	@Column(name="prediction_comment")
	private String prediction_comment;
	
	@Column(name="prediction_point")
	private String prediction_point;
	
	@Column(name="prediction_result")
	private String prediction_result;
	
	@Column(name="prediction_time")
	private Date predictiontime;
	
	@Column(name="item_value_begining")
	private Double item_value_begining;
	
	@Column(name="item_value_end")
	private Double item_value_end;
	
	@Column(name="prediction_final_score")
	private Integer predictionfinalscore;
	
	@Column(name="is_changable")
	private Integer is_changable;

	public Integer getPrediction_id() {
		return prediction_id;
	}

	public void setPrediction_id(Integer prediction_id) {
		this.prediction_id = prediction_id;
	}

	

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public String getPrediction_comment() {
		return prediction_comment;
	}

	public void setPrediction_comment(String prediction_comment) {
		this.prediction_comment = prediction_comment;
	}

	public String getPrediction_point() {
		return prediction_point;
	}

	public void setPrediction_point(String prediction_point) {
		this.prediction_point = prediction_point;
	}

	public String getPrediction_result() {
		return prediction_result;
	}

	public void setPrediction_result(String prediction_result) {
		this.prediction_result = prediction_result;
	}

	

	public Date getPredictiontime() {
		return predictiontime;
	}

	public void setPredictiontime(Date predictiontime) {
		this.predictiontime = predictiontime;
	}

	public Double getItem_value_begining() {
		return item_value_begining;
	}

	public void setItem_value_begining(Double item_value_begining) {
		this.item_value_begining = item_value_begining;
	}

	public Double getItem_value_end() {
		return item_value_end;
	}

	public void setItem_value_end(Double item_value_end) {
		this.item_value_end = item_value_end;
	}

	

	public Integer getPredictionfinalscore() {
		return predictionfinalscore;
	}

	public void setPredictionfinalscore(Integer predictionfinalscore) {
		this.predictionfinalscore = predictionfinalscore;
	}

	public Integer getIs_changable() {
		return is_changable;
	}

	public void setIs_changable(Integer is_changable) {
		this.is_changable = is_changable;
	}

	@Override
	public String toString() {
		return "Prediction [prediction_id=" + prediction_id + ", user_id=" + userid + ", itemid=" + itemid
				+ ", prediction_comment=" + prediction_comment + ", prediction_point=" + prediction_point
				+ ", prediction_result=" + prediction_result + ", predictiontime=" + predictiontime
				+ ", item_value_begining=" + item_value_begining + ", item_value_end=" + item_value_end
				+ ", prediction_final_score=" + predictionfinalscore + ", is_changable=" + is_changable + "]";
	}

}
