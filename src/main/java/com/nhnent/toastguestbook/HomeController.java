package com.nhnent.toastguestbook;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import toast.resolver.ParamMap;
import toast.util.EmailValidator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/guestBookTest.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/guestBook.do")
    public ModelAndView openGuestBook(ParamMap paramMap) throws Exception{
        ModelAndView mv = new ModelAndView("guestBook");
        //logger.info("Map: ", commandMap.entrySet().toString());
        logger.info("Request: {}", paramMap);
        
        return mv;
    }
	
	@RequestMapping(value="/insertGuestBook.do")
    public ModelAndView insertGuestBook(ParamMap paramMap) throws Exception{
        ModelAndView mv = new ModelAndView("home");
        //logger.info("Map: ", commandMap.entrySet().toString());
        logger.info("insertGuestBook: {}", paramMap);
        EmailValidator emailValidator = new EmailValidator();
        boolean isValid = emailValidator.validate(paramMap.get("email"));
        
        logger.info("Email Valid check : {}", isValid);
        
        return mv;
    }
	
}
