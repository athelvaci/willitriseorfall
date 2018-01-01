package com.willitriseorfall.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "follow_activity")
public class FollowActivity {

	@Id
	@Column(name = "activity_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer activityid;

	@Column(name = "USER_id")
	private Integer userid;
	
	@Column(name = "following_user_id")
	private Integer followinguserid;

	public Integer getActivityid() {
		return activityid;
	}

	public void setActivityid(Integer activityid) {
		this.activityid = activityid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getFollowinguserid() {
		return followinguserid;
	}

	public void setFollowinguserid(Integer followinguserid) {
		this.followinguserid = followinguserid;
	}
	
	
}
