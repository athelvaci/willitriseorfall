package com.willitriseorfall.mvc.data.entities;

public class PredictNowView {

	private Integer item_id;
	private String item_name;
	private Integer treshold_id;
	private Double item_value;
	private Integer is_changable;

	public Integer getItem_id() {
		return item_id;
	}

	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public Integer getTreshold_id() {
		return treshold_id;
	}

	public void setTreshold_id(Integer treshold_id) {
		this.treshold_id = treshold_id;
	}

	public Double getItem_value() {
		return item_value;
	}

	public void setItem_value(Double item_value) {
		this.item_value = item_value;
	}

	public Integer getIs_changable() {
		return is_changable;
	}

	public void setIs_changable(Integer is_changable) {
		this.is_changable = is_changable;
	}

}
