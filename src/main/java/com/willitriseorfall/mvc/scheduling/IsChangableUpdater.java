package com.willitriseorfall.mvc.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.willitriseorfall.mvc.model.CurrentValues;
import com.willitriseorfall.mvc.model.ItemDB;
import com.willitriseorfall.mvc.repository.CurrentValuesRepository;
import com.willitriseorfall.mvc.repository.ItemDBRepository;
import com.willitriseorfall.mvc.repository.PredictionRepository;

/*
 * set item value beginning where is changable 1 
 * set ischangable 0 where is changable 1 
 */
@Component("IsChangableUpdater")
public class IsChangableUpdater {


	
	@Autowired
	private PredictionRepository predictionRepository;

	@Autowired
	private CurrentValuesRepository currentValuesRepository;
	
	@Autowired
	private ItemDBRepository itemDB;

	
	public void update(){
		System.out.println("ischagable worrkskskskskksk");
		System.out.println("setItemValueBeginning()"+setItemValueBeginning());
	}
	private boolean setItemValueBeginning(){	//set beginning value from item repository and set ischangables 0
		System.out.println("setItemValueBeginning on action");
		try {
			
			for (ItemDB item : itemDB.findAll()) {
				predictionRepository.updateItemBeginingValueandIsChangable(item.getItem_value(), 0, 1, item.getItemid());
			}

			System.out.println("updatePredictionBeginningValueAndIsChangable end action");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}
