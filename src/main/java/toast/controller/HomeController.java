package toast.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import toast.dao.GuestBookDAO;
import toast.resolver.ParamMap;
import toast.util.EmailValidator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
    ServletContext context;
	
	@Resource(name="guestBookDAO")
	private GuestBookDAO guestBookDAO;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/guestBookTest.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("context.getAttribute:" + context.getAttribute("contextConfigLocation"));
		//locale = Locale.US;
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		System.out.println("timezone:" + dateFormat.getTimeZone().getDisplayName());
		
		TimeZone time;
		time = TimeZone.getTimeZone("America/Los_Angeles");
		dateFormat.setTimeZone(time);

		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/guestBook.do")
    public ModelAndView openGuestBook(ParamMap paramMap) throws Exception{
        ModelAndView mv = new ModelAndView("guestBook");
        //logger.info("Map: ", commandMap.entrySet().toString());
        //logger.info("Request: {}", paramMap);
        
    	List<Map<String,Object>> list = guestBookDAO.selectGuestBook(paramMap.getMap());
    	mv.addObject("list", list);
    	logger.info("selectGuestBook: {}", list);
        return mv;
    }
	
	@RequestMapping(value="/insertGuestBook_temp.do")
    public ModelAndView insertGuestBook__s(ParamMap paramMap) throws Exception{
        ModelAndView mv = new ModelAndView("home");
        //logger.info("Map: ", commandMap.entrySet().toString());
        logger.info("insertGuestBook: {}", paramMap);
        EmailValidator emailValidator = new EmailValidator();
        boolean isValid = emailValidator.validate(paramMap.get("email"));
        
        logger.info("Email Valid check : {}", isValid);
        
        return mv;
    }
	
	@RequestMapping(value="/insertGuestBook.do")
	public ModelAndView insertGuestBook(ParamMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/guestBook.do");
		logger.info("insertGuestBook: {}", map);
		
		guestBookDAO.insertGuestBook(map.getMap());
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/updateGuestBook.do")
	public ModelAndView updateGuestBook(ParamMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/guestBook.do");
		logger.info("updateGuestBook: {}", map);
		int idx = Integer.parseInt(map.get("idx"));
		Map<String, String> res = (Map<String, String>) guestBookDAO.getGuestBookByIdx(idx);
		logger.info("getGuestBookByIdx-8: {}", res);
		
		if (map.get("passwd").equals(res.get("passwd"))) {
			guestBookDAO.updateGuestBook(map.getMap());
		}
		
		return mv;
	}
}
