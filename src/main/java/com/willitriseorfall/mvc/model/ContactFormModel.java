package com.willitriseorfall.mvc.model;

public class ContactFormModel {

	private String firstName;
	private String lastName;
	private String emailAddress;
	private String messageOfUser;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {

		this.emailAddress = emailAddress;
	}
	public String getMessageOfUser() {
		return messageOfUser;
	}
	public void setMessageOfUser(String messageOfUser) {
		this.messageOfUser = messageOfUser;
	}
	@Override
	public String toString() {
		return "[firstName=" + firstName + ", lastName=" + lastName + ", emailAddress=" + emailAddress
				+ ", messageOfUser=" + messageOfUser + "]";
	}
}
