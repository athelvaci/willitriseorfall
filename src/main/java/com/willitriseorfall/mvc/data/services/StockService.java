package com.willitriseorfall.mvc.data.services;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;

import com.willitriseorfall.mvc.data.entities.StockEntitie;
import com.willitriseorfall.mvc.interfaces.CurrencyConverter;
import com.willitriseorfall.mvc.model.CurrentValues;

import yahoofinance.YahooFinance;

public class StockService implements CurrencyConverter {
	
	private TaskScheduler scheduler = new ConcurrentTaskScheduler();
	private final ScheduledExecutorService scheduler1 = Executors.newScheduledThreadPool(1);
	private HttpClient httpclient;

	public StockService() {

	}

	public String convert(String currencyFrom, String currencyTo) throws IOException {

		httpclient = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(
				"http://quote.yahoo.com/d/quotes.csv?s=" + currencyFrom + currencyTo + "=X&f=l1&e=.csv");
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String responseBody = httpclient.execute(httpGet, responseHandler);
		httpclient.getConnectionManager().shutdown();
		return responseBody;
	}

	public List<StockEntitie> getStockValues() {
		StockService ycc = new StockService();
		List<StockEntitie> stockValues = new LinkedList<>();

		try {
			Double currentEUR = Double.parseDouble(ycc.convert("EUR", "TRY"));
			Double currentUSD = Double.parseDouble(ycc.convert("USD", "TRY"));
			Double currentGBP = Double.parseDouble(ycc.convert("GBP", "TRY"));
			Double currentIMKB = Double.parseDouble(YahooFinance.get("XU100.IS").getQuote().getPrice().toString());
			
			StockEntitie USD = new StockEntitie(1, currentUSD);
			StockEntitie EUR = new StockEntitie(2, currentEUR);
			StockEntitie GBP = new StockEntitie(3, currentGBP);
			StockEntitie IMKB = new StockEntitie(4, currentIMKB);
			
			stockValues.add(EUR);
			stockValues.add(USD);
			stockValues.add(GBP);
			stockValues.add(IMKB);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return stockValues;

	}

	
}
