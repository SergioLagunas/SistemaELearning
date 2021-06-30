
package Elearning.controler;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HomeController {
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("index");
        return mo;   
    }
    
    
}
