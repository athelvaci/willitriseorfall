package com.willitriseorfall.mvc.data.entities;

public class StockEntitie {

	private Integer stockId;
	private Double stockValue;
	public StockEntitie(Integer stockId, Double stockValue) {
		this.stockId=stockId;
		this.stockValue=stockValue;
	}

	

	public Integer getStockId() {
		return stockId;
	}



	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}



	public Double getStockValue() {
		return stockValue;
	}

	public void setStockValue(Double stockValue) {
		this.stockValue = stockValue;
	}

	

}
