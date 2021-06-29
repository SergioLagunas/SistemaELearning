
package Elearning.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    
    @RequestMapping(value = "index.htm")
    public ModelAndView home(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("index");
        return mo;   
    }
}
