package com.willitriseorfall.mvc.service;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class PredictNowJDBCTemplate implements PredictNowDAO {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	
	 public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	   }
	 
	 public void createPredict(int USER_user_id, int ITEM_item_id , String prediction_comment, int prediction_point, String prediction_date){
		 String SQL = "insert into prediction (prediction_date , USER_user_id , ITEM_item_id , prediction_comment , prediction_point) values (? , ? , ? , ? , ? , ?)";
		 jdbcTemplateObject.update( SQL, prediction_date, USER_user_id, ITEM_item_id , prediction_comment , prediction_point );
		 System.out.println("Created Record USER_user_id = " + USER_user_id);
		 return;
		 
	 }
	
}
