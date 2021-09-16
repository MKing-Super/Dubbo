package pers.mk.dubbo.learn.web.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.ConfigService;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.ZooKeeper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.mk.dubbo.learn.model.DubboUser;
import pers.mk.dubbo.learn.model.TestModel;
import pers.mk.dubbo.learn.service.TestService;
import pers.mk.dubbo.learn.web.configs.NesttyMain;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:38
 */
@Controller
public class TestController {
    @Autowired
    private TestService testService;

    @ResponseBody
    @RequestMapping("/test")
    public List<TestModel> initOrder() {
        List<TestModel> testInformation = testService.getTestInformation();
        return testInformation;
    }

    @ResponseBody
    @RequestMapping("/dubboUser")
    public DubboUser get() {
        DubboUser dubboUser = testService.getDubboUser(1);
        System.out.println(dubboUser);
        return dubboUser;
    }

    @ResponseBody
    @RequestMapping("/propertyTime")
    public String propertyTime(){
        Config config = ConfigService.getAppConfig();
        return "获取超过时间：" + config.getIntProperty("server.port",200);
    }

    @ResponseBody
    @RequestMapping("/json")
    public String json() {
        return "{ \"employees\": [  { \"firstName\": \"George\", \"lastName\": \"Bush\" }, { \"firstName\": \"Thomas\", \"lastName\": \"Carter\" } ] } ";
    }

    @ResponseBody
    @RequestMapping("/zkjson")
    public StringBuilder zkjson() throws IOException, InterruptedException, KeeperException {
        StringBuilder stringBuilder = NesttyMain.zookeeperJSON();
        //url解析
        stringBuilder = new StringBuilder(URLDecoderString(stringBuilder.toString()));
        stringBuilder = new StringBuilder(stringBuilder.substring(0, stringBuilder.length() - 1));
        stringBuilder = new StringBuilder("[" + stringBuilder + "]");
        //写入文件
        File file = new File("D:\\mk.txt");
        if (!file.exists() && file.isDirectory()){
            file.mkdir();
            file.createNewFile();
        }
        Writer out = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(out);

        bw.write(stringBuilder.toString());
        bw.newLine();
        bw.flush();
        bw.close();

        return stringBuilder;
    }

    @GetMapping("/index")
    public String index(Model model) throws IOException, InterruptedException, KeeperException{
        //获取zookeeper中所有关于dubbo的信息
        List<String> zookeeper = NesttyMain.test();
        //url解析
        for (int i = 0 ; i < zookeeper.size() ; i++){
            String str = URLDecoderString(zookeeper.get(i));
            zookeeper.set(i,str);
        }
        //写入文件
        File file = new File("D:\\mk.txt");
        if (!file.exists() && file.isDirectory()){
            file.mkdir();
            file.createNewFile();
        }
        Writer out = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(out);
        for (String s : zookeeper){
            bw.write(s);
            bw.newLine();
            bw.flush();
        }
        bw.close();


        //返回页面
        model.addAttribute("date", DateFormat.getDateTimeInstance().format(new Date()));
        model.addAttribute("total",zookeeper.size());
        model.addAttribute("zooKeeper","["+zookeeper+"]");
        return "index";
    }


    /**
     * @Description: URLEncoder编码
     * @Author: kun.ma
     * @Date: 2021/9/16 13:58
     * @Param: [str]
     * @Return: java.lang.String
     */
    public static String URLEncoderString(String str) {
        String result = "";
        if (null == str) {
            return "";
        }
        try {
            result = java.net.URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * @Description: URLDecoder解码
     * @Author: kun.ma
     * @Date: 2021/9/16 13:59
     * @Param: [str]
     * @Return: java.lang.String
     */
    public static String URLDecoderString(String str) {
        String result = "";
        if (null == str) {
            return "";
        }
        try {
            result = java.net.URLDecoder.decode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }
}