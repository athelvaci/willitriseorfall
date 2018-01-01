package com.willitriseorfall.mvc.data.entities;

import java.util.Date;

public class DashboardEntitie {

	private Date predictionDate;
	private Integer itemid;
	private String predictionPoint;
	private String comment;
	private String userName;
	public DashboardEntitie(Date predictionDate, Integer itemid, String predictionPoint, String comment, String userName) {
		this.predictionDate = predictionDate;
		this.itemid = itemid;
		this.predictionPoint = predictionPoint;
		this.comment = comment;
		this.userName = userName;
	}
	public Date getPredictionDate() {
		return predictionDate;
	}
	public void setPredictionDate(Date predictionDate) {
		this.predictionDate = predictionDate;
	}
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public String getPredictionPoint() {
		return predictionPoint;
	}
	public void setPredictionPoint(String predictionPoint) {
		this.predictionPoint = predictionPoint;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	
}
