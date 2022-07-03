package com.fursa.xmlToHtml.jenkinsclosingtask;


import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;


public class Entry {
    private String url;

    private List news;

    private List setAllNews() throws IOException, FeedException {
        URL xml_url = new URL(this.url);
        SyndFeedInput input = new SyndFeedInput();
        XmlReader xml_reader = new XmlReader(xml_url);
        SyndFeed feed = input.build(xml_reader);
        return feed.getEntries();



    }
    public Entry(String url) throws FeedException, IOException {
        this.url = url;
        this.news = setAllNews();
    }

    public List getNews(){
        return this.news;
    }
}
