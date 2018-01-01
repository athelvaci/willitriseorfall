package com.willitriseorfall.mvc.service;

public interface PredictNowDAO {

	public void createPredict(int USER_user_id, int ITEM_item_id , String prediction_comment, int prediction_point, String prediction_date);
	//public void updatePredict(int USER_user_id, int ITEM_item_id , String prediction_comment, int prediction_point, String prediction_date);
	//public void getUserPredict(int USER_user_id);
	
}
