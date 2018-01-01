package com.willitriseorfall.mvc.controllers;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.willitriseorfall.mvc.data.entities.DashboardEntitie;
import com.willitriseorfall.mvc.data.entities.Searchuser;
import com.willitriseorfall.mvc.data.entities.TopPredictorsEntitie;
import com.willitriseorfall.mvc.model.CurrentValues;
import com.willitriseorfall.mvc.model.FollowActivity;
import com.willitriseorfall.mvc.model.ItemDB;
import com.willitriseorfall.mvc.model.OverallScore;
import com.willitriseorfall.mvc.model.Prediction;
import com.willitriseorfall.mvc.model.ScoreCategory;
import com.willitriseorfall.mvc.model.User;
import com.willitriseorfall.mvc.repository.CurrentValuesRepository;
import com.willitriseorfall.mvc.repository.FollowActivityRepository;
import com.willitriseorfall.mvc.repository.ItemDBRepository;
import com.willitriseorfall.mvc.repository.OverallScoreRepository;
import com.willitriseorfall.mvc.repository.PredictionIntervalRepository;
import com.willitriseorfall.mvc.repository.PredictionRepository;
import com.willitriseorfall.mvc.repository.ScoreCategoryRepository;
import com.willitriseorfall.mvc.repository.UserRepository;
import com.willitriseorfall.mvc.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ScoreCategoryRepository scoreCategoryRepository;

	@Autowired
	private CurrentValuesRepository cvRepo;
	@Autowired
	private PredictionRepository prediction;
	@Autowired
	private ItemDBRepository itemDBRepository;
	@Autowired
	private PredictionIntervalRepository predictionIntervalRep;

	@Autowired
	private OverallScoreRepository overAllRep;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private FollowActivityRepository followRep;

	@RequestMapping("/home")
	public String goHome(Model model) {

		return "home";
	}

	@RequestMapping(value = { "", "/", "/index" })
	public String goIndex(Model model, Principal user) {
		for (CurrentValues stock : this.cvRepo.findAll()) {
			if (stock.getItemValue().toString().length() >= 5) {
				// add model stock values in 5 digits
				model.addAttribute(stock.getItemName(), stock.getItemValue().toString().substring(0, 5));
			} else {
				model.addAttribute(stock.getItemName(), stock.getItemValue().toString()+"0");
			}

		}
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		List<ItemDB> olditems = itemDBRepository.findAll();
		for (ItemDB itemDB : olditems) {
			
			model.addAttribute("old"+itemDB.getItem_name(),itemDB.getItem_value() );
		}

		return "index";
	}

	@RequestMapping(value = "/predict-now", method = RequestMethod.GET)
	public String goPredictNow(Model model, Principal user) {
		User loggedInUser = userRepository.findByUsername(user.getName());
		model.addAttribute("items", itemDBRepository.findAll());
		// check if prediction can changeable and add to model
		for (ItemDB item : itemDBRepository.findAll()) {
			List<Prediction> prediction = this.prediction.findPredicted(loggedInUser.getId().intValue(), item.getItemid(), 1);
			if (prediction.size() > 0) {

				model.addAttribute("update" + item.getItemid(), 1);
				model.addAttribute("oldprediction" + item.getItemid(), prediction.get(prediction.size() - 1));
				System.out.println("update" + item.getItemid() + "-" + prediction.get(prediction.size() - 1).getPrediction_id());
			} else {
				model.addAttribute("update" + item.getItemid(), 0);
			}
		}
		for (CurrentValues item : this.cvRepo.findAll()) {
			model.addAttribute("currentvalue" + item.getItemId(), item.getItemValue());
		}
		model.addAttribute("chartdollar", "usdtry=x");
		model.addAttribute("chartpound", "gbptry=x");
		model.addAttribute("charteuro", "eurtry=X");
		model.addAttribute("chartimkb", "XU100.IS");
		

		model.addAttribute("predictionmodel", new Prediction());
		model.addAttribute("predictioninterval", predictionIntervalRep.findOne(2).getTime());
		return "predict-now";
	}

	@RequestMapping(value = "/predict-now", method = RequestMethod.POST)
	public String postPredictNow(@ModelAttribute("predictionmodel") Prediction predictionform, Principal user, @RequestParam(required = false, value = "update") String updateFlag,
			@RequestParam(required = false, value = "predict") String predictFlag) {
		if (predictionform.getPrediction_point() == null) {
			return "redirect:/predict-now";
		}

		User loggedInUser = userRepository.findByUsername(user.getName());

		if (loggedInUser.getId() != null) {// be sure if user logged in
			predictionform.setUserid(loggedInUser.getId().intValue());

			if (predictFlag != null) { // check if predict button selected
				System.out.println(predictFlag);
				System.out.println("prediction selected");
				Date date = new Date();
				predictionform.setPredictiontime(date);
				predictionform.setIs_changable(1);
				prediction.save(predictionform);

			}

			else if (updateFlag != null) { // check if update button selected

				prediction.deletePrediction(predictionform.getUserid(), predictionform.getItemid(), 1);

			}

			return "redirect:/predict-now";
		}

		else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = "/top-predictors")
	public String goTopPredictors(Model model, Principal user) {
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();
		for (ScoreCategory scoreCategory : scoreCategoryRepository.findTop10ByItemidOrderByScoreDesc(0)) {
			System.out.println(scoreCategory.getUserId() + "-" + scoreCategory.getScore());
			User topUser = userRepository.findOne(scoreCategory.getUserId().longValue());
			topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), scoreCategory.getScore().toString(), scoreCategory.getAccuracy()));
		}
		model.addAttribute("scoreitemnew", "0");
		model.addAttribute("stockname", "all stocks");

		model.addAttribute("scoreitem", new ItemDB());
		model.addAttribute("items", itemDBRepository.findAll());

		model.addAttribute("topPredictorsList", topPredictorsEntitie);

		return "top-predictors";
	}

	@RequestMapping(value = "/top-predictors", method = RequestMethod.POST)
	public ModelAndView postTopPredictors(@ModelAttribute("scoreitem") ItemDB scoreitemForm, Model model, Principal user, @RequestParam(required = false, value = "sortbyscore") String sortbyscore,
			@RequestParam(required = false, value = "sortbyaccuracy") String sortbyaccuracy) {
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();

		if (sortbyscore != null) { // if user selected sort by score
			for (ScoreCategory scoreCategory : scoreCategoryRepository.findTop10ByItemidOrderByScoreDesc(scoreitemForm.getItemid())) {
				// System.out.println(scoreCategory.getUserId() + "-" + scoreCategory.getScore());
				User topUser = userRepository.findOne(scoreCategory.getUserId().longValue());
				topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), scoreCategory.getScore().toString(), scoreCategory.getAccuracy()));
			}
		} else { // if user selected sort by accuracy
			for (ScoreCategory scoreCategory : scoreCategoryRepository.findTop10ByItemidOrderByAccuracyDesc(scoreitemForm.getItemid())) {
				// System.out.println(scoreCategory.getUserId() + "-" + scoreCategory.getScore());
				User topUser = userRepository.findOne(scoreCategory.getUserId().longValue());
				topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), scoreCategory.getScore().toString(), scoreCategory.getAccuracy()));
			}

		}

		if (scoreitemForm.getItemid() == 0) {
			model.addAttribute("stockname", "all stocks");
		} else {
			model.addAttribute("stockname", itemDBRepository.findOne(scoreitemForm.getItemid()).getItem_name());

		}

		// System.out.println(scoreitemForm.getItemid());
		model.addAttribute("items", itemDBRepository.findAll());
		model.addAttribute("topPredictorsList", topPredictorsEntitie);
		return new ModelAndView("top-predictors", "scoreitemnew", scoreitemForm.getItemid());
	}
	
	@RequestMapping(value = "/top-predictors2")
	public String goTopPredictors2(Model model, Principal user) {
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();
		for (ScoreCategory scoreCategory : scoreCategoryRepository.findTop10ByItemidOrderByScoreDesc(0)) {
			System.out.println(scoreCategory.getUserId() + "-" + scoreCategory.getScore());
			User topUser = userRepository.findOne(scoreCategory.getUserId().longValue());
			topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), scoreCategory.getScore().toString(), scoreCategory.getAccuracy()));
		}
		model.addAttribute("scoreitemnew", "0");
		model.addAttribute("stockname", "all stocks");

		model.addAttribute("scoreitem", new ItemDB());
		model.addAttribute("items", itemDBRepository.findAll());

		model.addAttribute("topPredictorsList", topPredictorsEntitie);

		return "top-predictors2";
	}

	@RequestMapping(value = "/top-predictors2", method = RequestMethod.POST)
	public ModelAndView postTopPredictors2(@ModelAttribute("scoreitem") ItemDB scoreitemForm, Model model, Principal user, @RequestParam(required = false, value = "sortbyscore") String sortbyscore,
			@RequestParam(required = false, value = "sortbyaccuracy") String sortbyaccuracy) {
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();

		if (sortbyscore != null) { // if user selected sort by score
			for (ScoreCategory scoreCategory : scoreCategoryRepository.findTop10ByItemidOrderByScoreDesc(scoreitemForm.getItemid())) {
				// System.out.println(scoreCategory.getUserId() + "-" + scoreCategory.getScore());
				User topUser = userRepository.findOne(scoreCategory.getUserId().longValue());
				topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), scoreCategory.getScore().toString(), scoreCategory.getAccuracy()));
			}
		} else { // if user selected sort by accuracy
			for (ScoreCategory scoreCategory : scoreCategoryRepository.findTop10ByItemidOrderByAccuracyDesc(scoreitemForm.getItemid())) {
				// System.out.println(scoreCategory.getUserId() + "-" + scoreCategory.getScore());
				User topUser = userRepository.findOne(scoreCategory.getUserId().longValue());
				topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), scoreCategory.getScore().toString(), scoreCategory.getAccuracy()));
			}

		}

		if (scoreitemForm.getItemid() == 0) {
			model.addAttribute("stockname", "all stocks");
		} else {
			model.addAttribute("stockname", itemDBRepository.findOne(scoreitemForm.getItemid()).getItem_name());

		}

		// System.out.println(scoreitemForm.getItemid());
		model.addAttribute("items", itemDBRepository.findAll());
		model.addAttribute("topPredictorsList", topPredictorsEntitie);
		return new ModelAndView("top-predictors2", "scoreitemnew", scoreitemForm.getItemid());
	}

	

	@RequestMapping(value = "/top-predictors/{itemid}")
	public String showTopPredictorsByItemName(Model model, Principal user, @PathVariable("itemid") String token, @RequestParam(required = false, value = "sortby") String sortby) {
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();
		for (OverallScore overallScore : overAllRep.findTop10ByOrderByOverallScoreAsc()) {
			// System.out.println(overallScore.getUserId() + "--" + overallScore.getOverallScore());
			// System.out.println(userRepository.findOne(overallScore.getUserId().longValue()).getUsername());
			User topUser = userRepository.findOne(overallScore.getUserId().longValue());
			topPredictorsEntitie.add(new TopPredictorsEntitie(topUser.getUsername(), overallScore.getOverallScore().toString(), 32.0));
		}

		model.addAttribute("items", itemDBRepository.findAll());

		model.addAttribute("topPredictorsList", topPredictorsEntitie);

		return "top-predictors";
	}

	@RequestMapping("/about-me")
	public String goAboutMe(Model model, Principal user) {

		User loggedInUser = userRepository.findByUsername(user.getName());
		model.addAttribute("username", loggedInUser.getUsername());
		model.addAttribute("useremail", loggedInUser.getEmail());
		try {
			model.addAttribute("score", scoreCategoryRepository.findScoreByUserAndItemid(loggedInUser.getId().intValue(), 0).get(0));
			model.addAttribute("items", itemDBRepository.findAll());
			for (ItemDB item : itemDBRepository.findAll()) {
				model.addAttribute("i" + item.getItemid().toString(), item.getItem_name());
				model.addAttribute("s" + item.getItemid().toString(), scoreCategoryRepository.findScoreByUserAndItemid(loggedInUser.getId().intValue(), item.getItemid()).get(0));
			}
		} catch (Exception e) {
			// TODO: handle exception

		}
		// Double average = (prediction.countByPredictionfinalscoreAndUserid(5, 1).doubleValue() / prediction.countByUserid(loggedInUser.getId().intValue()).doubleValue()) * 100;
		// DecimalFormat df = new DecimalFormat("#.00");
		// model.addAttribute("average", df.format(average));

		return "about-me";
	}

	@RequestMapping("/dashboard")
	public String godashboard(Model model) {
		Date date = new Date();
		// find between now and 1 day before predictions 100 limit
		try {
			List<DashboardEntitie> oldPredictionList = new ArrayList<>();
			for (Prediction prediction : this.prediction.findTop100ByPredictiontimeBetweenOrderByPredictiontimeDesc(new Date(date.getTime() - (24 * 60 * 60 * 1000)), new Date())) {
				String userName = userRepository.findOne(prediction.getUserid().longValue()).getUsername();
				oldPredictionList.add(new DashboardEntitie(prediction.getPredictiontime(), prediction.getItemid(), prediction.getPrediction_point(), prediction.getPrediction_comment(), userName));
			}
			
			model.addAttribute("oldpredictions", oldPredictionList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		for (ItemDB item : itemDBRepository.findAll()) {
			model.addAttribute("i" + item.getItemid().toString(), item.getItem_name());
		}

		return "dashboard";
	}

	@RequestMapping(value = "/prediction-history", method = RequestMethod.GET)
	public String goPredictionHistory(Model model, Principal user) {
		User loggedInUser = userRepository.findByUsername(user.getName());
		model.addAttribute("oldpredictions", this.prediction.findPredictionHistoryByIdOrdered(loggedInUser.getId().intValue()));

		for (ItemDB item : itemDBRepository.findAll()) {
			model.addAttribute("i" + item.getItemid().toString(), item.getItem_name());
		}
		model.addAttribute("items", itemDBRepository.findAll());
		model.addAttribute("categorizeitem", new ItemDB());
		

		return "prediction-history";
	}

	@RequestMapping(value = "/prediction-history", method = RequestMethod.POST)
	public String goPostPredictionHistory(@ModelAttribute("categorizeitem") ItemDB categorizeitem, Model model, Principal user) {
		User loggedInUser = userRepository.findByUsername(user.getName());
		System.out.println("silam" + categorizeitem.getItemid());
		if (categorizeitem.getItemid() == 0) {
			System.out.println("olamas");
			model.addAttribute("oldpredictions", this.prediction.findPredictionHistoryByIdOrdered(loggedInUser.getId().intValue()));
			System.out.println("after old predictions");
		} else {
			model.addAttribute("oldpredictions", this.prediction.findPredictionHistoryByIdAndItemId(loggedInUser.getId().intValue(), categorizeitem.getItemid()));

		}
		for (ItemDB item : itemDBRepository.findAll()) {
			model.addAttribute("i" + item.getItemid().toString(), item.getItem_name());
		}
		model.addAttribute("scoreitem", new ItemDB());
		model.addAttribute("items", itemDBRepository.findAll());
		return "prediction-history";
	}

	@RequestMapping("/privacy")
	public String goTerms(Model model, Principal user) {
		if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
		return "privacy";
	}

	@RequestMapping(value="/following", method = RequestMethod.GET)
	public String goFollowing(Model model, Principal user) {
		User loggedInUser = userRepository.findByUsername(user.getName());
		List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();
		
		//System.out.println("size -- " + followRep.findFollowings(loggedInUser.getId().intValue()).size());
		for (FollowActivity following : followRep.findFollowings(loggedInUser.getId().intValue())) {
			//System.out.println(following.getFollowinguserid());
			List<ScoreCategory> scoreOfFollowings = scoreCategoryRepository.findScoreByUserAndItemid(following.getFollowinguserid(), 0);
			if (scoreOfFollowings.size() != 0) {
				ScoreCategory scoreOfFollowing = scoreOfFollowings.get(0);
				User followingUser = userRepository.findOne(following.getFollowinguserid().longValue());
				topPredictorsEntitie.add(new TopPredictorsEntitie(followingUser.getUsername(), scoreOfFollowing.getScore().toString(), scoreOfFollowing.getAccuracy()));
			} else {
				System.out.println(following.getFollowinguserid() + " this user has no score");
			}

		}
		model.addAttribute("searchuser", new Searchuser());
		model.addAttribute("followingusers", topPredictorsEntitie);

		return "following";
	}
	
	@RequestMapping(value="/following", method = RequestMethod.POST)
	public String postFollowing(Model model, Principal user,@ModelAttribute("searchuser") Searchuser searcheduser) {
		
		System.out.println("-----------"+searcheduser.getUserName());
		if (!searcheduser.getUserName().equals("")) {
			return "redirect:/user-profile/"+searcheduser.getUserName();
		}
		else{
			model.addAttribute("searchuser", new Searchuser());
			User loggedInUser = userRepository.findByUsername(user.getName());
			List<TopPredictorsEntitie> topPredictorsEntitie = new ArrayList<TopPredictorsEntitie>();

			//System.out.println("size -- " + followRep.findFollowings(loggedInUser.getId().intValue()).size());
			for (FollowActivity following : followRep.findFollowings(loggedInUser.getId().intValue())) {
				//System.out.println(following.getFollowinguserid());
				List<ScoreCategory> scoreOfFollowings = scoreCategoryRepository.findScoreByUserAndItemid(following.getFollowinguserid(), 0);
				if (scoreOfFollowings.size() != 0) {
					ScoreCategory scoreOfFollowing = scoreOfFollowings.get(0);
					User followingUser = userRepository.findOne(following.getFollowinguserid().longValue());
					topPredictorsEntitie.add(new TopPredictorsEntitie(followingUser.getUsername(), scoreOfFollowing.getScore().toString(), scoreOfFollowing.getAccuracy()));
				} else {
					System.out.println(following.getFollowinguserid() + " this user has no score");
				}

			}
			model.addAttribute("followingusers", topPredictorsEntitie);
			
		}
		
		

		return "following";
	}

	@RequestMapping(value = "/user-profile/{username:.+}", method = RequestMethod.GET)
	public String goUserProfile(Model model, @PathVariable("username") String username, Principal user) {
		System.out.println(username);
		User selectedUser = userRepository.findByUsername(username);
		User loggedInUser = userRepository.findByUsername(user.getName());
		if (selectedUser == null) {
			model.addAttribute("exist", "0");
		} else if (selectedUser.getUsername().equals(user.getName())) {
			
		} else {
			model.addAttribute("username", selectedUser.getUsername());
			model.addAttribute("useremail", selectedUser.getEmail());
			model.addAttribute("score", scoreCategoryRepository.findScoreByUserAndItemid(selectedUser.getId().intValue(), 0).get(0));
			model.addAttribute("oldpredictions", this.prediction.findPredictionHistoryByIdOrdered(selectedUser.getId().intValue()));
			model.addAttribute("items", itemDBRepository.findAll());
			if (followRep.findIfFollowing(loggedInUser.getId().intValue(), selectedUser.getId().intValue()).isEmpty()) {
				System.out.println("follow");
				model.addAttribute("canfollow", 1);
			} else {
				System.out.println("unfollow");
			}

			for (ItemDB item : itemDBRepository.findAll()) {
				model.addAttribute("i" + item.getItemid().toString(), item.getItem_name());
				model.addAttribute("s" + item.getItemid().toString(), scoreCategoryRepository.findScoreByUserAndItemid(selectedUser.getId().intValue(), item.getItemid()).get(0));
			}
		}
		model.addAttribute("followactivity", new FollowActivity());

		return "user-profile";
	}

	@RequestMapping(value = "/user-profile/{username:.+}", method = RequestMethod.POST)
	public String postUserProfile(@ModelAttribute("followactivity") FollowActivity followactivity, @PathVariable("username") String username, Principal user,
			@RequestParam(required = false, value = "follow") String follow, @RequestParam(required = false, value = "unfollow") String unfollow) {
		User loggedInUser = userRepository.findByUsername(user.getName());
		followactivity.setUserid(loggedInUser.getId().intValue());
		System.out.println("follow-" + follow);
		System.out.println("unfollow-" + unfollow);
		if (follow != null) {
			System.out.println("follow user");

			System.out.println("-------" + followactivity.getFollowinguserid());
			followRep.save(followactivity);
		} else {
			System.out.println("unfollow user");
			followRep.unfollowuser(loggedInUser.getId().intValue(), followactivity.getFollowinguserid());
		}

		return "redirect:/user-profile/" + username;

	}
}
