package com.willitriseorfall.mvc.model;

public class PredictionModel {
	private String prediction_date;
	private int user_id;
	private int item_id;
	private String prediction_comment;
	private String prediction_point;
	private int prediction_result;

	public String getPrediction_date() {
		return prediction_date;
	}

	public void setPrediction_date(String prediction_date) {
		this.prediction_date = prediction_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
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

	public int getPrediction_result() {
		return prediction_result;
	}

	public void setPrediction_result(int prediction_result) {
		this.prediction_result = prediction_result;
	}

}
