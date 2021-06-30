
package Elearning.controler;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    
    @RequestMapping(value = "index.html")
    public ModelAndView home(HttpServletRequest request){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("index");
        String id = request.getParameter("id");
        return mo;   
    }
    
    
}
