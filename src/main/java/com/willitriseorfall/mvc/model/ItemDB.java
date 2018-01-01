package com.willitriseorfall.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "item")
public class ItemDB {

	@Id
	@Column(name = "item_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer itemid;

	@Column(name = "item_name")
	private String item_name;

	@Column(name = "treshold_id")
	private Integer treshold_id;

	@Column(name = "item_value")
	private Double item_value;

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
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

}
