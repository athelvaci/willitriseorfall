package com.willitriseorfall.mvc.validator;

import com.willitriseorfall.mvc.model.NewPasswordModel;
import com.willitriseorfall.mvc.model.User;
import com.willitriseorfall.mvc.service.UserService;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
	@Autowired
	private UserService userService;

	@Override
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		User user = (User) o;
		Pattern ptr = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
		if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
			errors.rejectValue("username", "Size.userForm.username");
		}
		if (userService.findByUsername(user.getUsername()) != null) {

			errors.rejectValue("username", "Duplicate.userForm.username");
		}
		if (!ptr.matcher(user.getEmail()).find()) {
			errors.rejectValue("email", "Unvalid.email.address");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		if (userService.findByEmail(user.getEmail()) != null) {

			errors.rejectValue("email", "Duplicate.userForm.email");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		
		if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
			errors.rejectValue("password", "Size.userForm.password");
		}

		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}
	}

	public void newpasswordvalidate(Object o, Errors errors) {
		NewPasswordModel newPasswordModel = (NewPasswordModel) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");

		if (newPasswordModel.getPassword().length() < 8 || newPasswordModel.getPassword().length() > 32) {
			errors.rejectValue("password", "Size.userForm.password");
		}

		if (!newPasswordModel.getPasswordConfirm().equals(newPasswordModel.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}
	}

}