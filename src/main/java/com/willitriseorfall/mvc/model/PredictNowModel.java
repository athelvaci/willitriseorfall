package com.willitriseorfall.mvc.model;

public class PredictNowModel {

	private String stockType;
	private String stockValue;
	private String stock;
	private String changeRate;
	private String changeValue;
	private String prediction;
	private String userName;

	public PredictNowModel(String stockType, String stockValue, String stock, String changeRate, String changeValue,
			String prediction, String userName) {
		super();
		this.stockType = stockType;
		this.stockValue = stockValue;
		this.stock = stock;
		this.changeRate = changeRate;
		this.changeValue = changeValue;
		this.prediction = prediction;
		this.userName = userName;
	}

	public String getStockType() {
		return stockType;
	}

	public void setStockType(String stockType) {
		this.stockType = stockType;
	}

	public String getStockValue() {
		return stockValue;
	}

	public void setStockValue(String stockValue) {
		this.stockValue = stockValue;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getChangeRate() {
		return changeRate;
	}

	public void setChangeRate(String changeRate) {
		this.changeRate = changeRate;
	}

	public String getChangeValue() {
		return changeValue;
	}

	public void setChangeValue(String changeValue) {
		this.changeValue = changeValue;
	}

	public String getPrediction() {
		return prediction;
	}

	public void setPrediction(String prediction) {
		this.prediction = prediction;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "PredictNowModel [stockType=" + stockType + ", stockValue=" + stockValue + ", stock=" + stock
				+ ", changeRate=" + changeRate + ", changeValue=" + changeValue + ", prediction=" + prediction
				+ ", userName=" + userName + "]";
	}

}
