package com.fursa.xmlToHtml.jenkinsclosingtask;

import com.sun.syndication.io.FeedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;


@RestController
public class XmlParserController {

    @RequestMapping("/")
    public ModelAndView parser(Model model) throws IOException, FeedException {
        Entry item = new Entry("http://www.ynet.co.il/Integration/StoryRss2.xml");

        model.addAttribute("news_content",item.getNews());

        ModelAndView model_and_view = new ModelAndView();
        model_and_view.setViewName("intry");
        return model_and_view;
    }

}