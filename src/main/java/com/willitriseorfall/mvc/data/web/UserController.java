package com.willitriseorfall.mvc.data.web;

import com.willitriseorfall.mvc.mailSender.SendEmail;
import com.willitriseorfall.mvc.model.ContactFormModel;
import com.willitriseorfall.mvc.model.NewPasswordModel;
import com.willitriseorfall.mvc.model.User;
import com.willitriseorfall.mvc.service.SecurityService;
import com.willitriseorfall.mvc.service.UserService;
import com.willitriseorfall.mvc.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
   
    private SendEmail email = new SendEmail();
    
   
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "signup";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/predict-now";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
    
    @RequestMapping(value = "/contact-us", method = RequestMethod.GET)
    public String goContactus(Model model, Principal user) {
    	if (user != null) {
			model.addAttribute("islogin", true);
			model.addAttribute("username", user.getName());
		} else {
			model.addAttribute("islogin", false);
		}
        return "contact-us";
    }

    @RequestMapping(value = "/contact-us", method = RequestMethod.POST)
    public String postcontactus( @ModelAttribute ContactFormModel contactFormModel,Model model) {
    	
    	System.out.println(contactFormModel);
    	email.SendEmailToUser("willitriseorfall@gmail.com", "Contact us message", contactFormModel.toString());
    	model.addAttribute("thankyouresponse", "Thank you for your message!");
        return "thankyou";
    }
    
    @RequestMapping(value = "/forgettenpassword", method = RequestMethod.GET)
    public String goForgettenpassword(Model model) {

        return "forgettenpassword";
    }

    @RequestMapping(value = "/forgettenpassword", method = RequestMethod.POST)
    public String postforgettenpassword(@ModelAttribute(value="username") String username, Model model) {
    	System.out.println("forgetpost in process");
    	
    	try {
    		User user = userService.findByUsername(username);
    		String mailBody="<html><body>Hi "+user.getUsername()+",<br/><a href=' http://www.willitriseorfall.com/willitriseorfall/willitriseorfall/newpassword/"+"athelvaci"+"/"+user.getPasswordToken()+"'> Click here</a> to reset password</body></html>";
        	email.SendEmailToUser(user.getEmail(), "Forgetten Password", mailBody);
        	System.out.println("mail sended");
        	model.addAttribute("thankyouresponse", "Check your email!");
		} catch (Exception e) {
			e.getMessage();
			model.addAttribute("thankyouresponse", "There is no user with this name");
		}
    	
        return "thankyou";
    }
    
   
    @RequestMapping(value = "/newpassword/{username}/{token:.+}", method = RequestMethod.GET)
    public String gonewpassword(@PathVariable("username") String username, @PathVariable("token") String token, Model model ){
    	
    	
    	 model.addAttribute("newpassword", new NewPasswordModel());
    	User user = userService.findByUsername(username);
    
    	System.out.println();
    	if (user.getPasswordToken().equals(token)) {
			System.out.println("basarili");
			model.addAttribute("usersuccess", "Check your email");
		}
    	else {
			System.out.println("there is no user with this name");
			model.addAttribute("usersuccess", "there is no user with this name");
		}
        return "newpassword" ;
    }

    @RequestMapping(value = "/newpassword/{username}/{token:.+}", method = RequestMethod.POST)
    public String postnewpassword(@ModelAttribute("newpassword") NewPasswordModel newpassword, Model model, BindingResult bindingResult, @PathVariable("username") String username) {
    	
    	userValidator.newpasswordvalidate(newpassword, bindingResult);
    	System.out.println(bindingResult);
    	System.out.println("-----------"+username);
    	if (bindingResult.hasErrors()) {
            return "newpassword";
        } 
    	userService.update(newpassword.getPassword(), username);
    	model.addAttribute("message", "You have been changed your password successfully.");
    	//TODO dont forget to handle with change password
    	
    	
        return "login";
    }
    
}
