package com.willitriseorfall.mvc.scheduling;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.willitriseorfall.mvc.data.entities.StockEntitie;
import com.willitriseorfall.mvc.data.services.StockService;
import com.willitriseorfall.mvc.repository.CurrentValuesRepository;


@Component("currentStockUpdater")
public class CurrentStockUpdater {

	@Autowired
	private CurrentValuesRepository currentValue;
	
	public void getStocks() {
		try {
			StockService stockService = new StockService();
			for (StockEntitie stock : stockService.getStockValues()) {
				this.currentValue.update(stock.getStockValue(), stock.getStockId());
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("stock service is unavailable");
		}
		

	}

}
