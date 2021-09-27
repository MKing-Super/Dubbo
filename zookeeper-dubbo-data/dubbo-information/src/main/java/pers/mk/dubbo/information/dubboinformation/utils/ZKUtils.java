package pers.mk.dubbo.information.dubboinformation.utils;

import org.apache.zookeeper.AsyncCallback;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.Watcher.Event.EventType;
import org.apache.zookeeper.Watcher.Event.KeeperState;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ZKUtils implements Watcher, AsyncCallback.StatCallback {
    private static ZooKeeper zooKeeper;
    private static Stat stat = new Stat();
    private static ZKUtils nestty = new ZKUtils();
    private List<String> strList = new ArrayList<>();
    private static StringBuilder stringBuilder;

    public static void main(String[] args) throws InterruptedException, IOException, KeeperException {
        zooKeeper = new ZooKeeper("10.100.210.127:2181", 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/");
        while (true){

        }
    }

    public static List<String> getZookeeperList() throws InterruptedException, IOException, KeeperException {
        zooKeeper = new ZooKeeper("10.100.210.127:2181", 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/dubbo");
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> END >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..");
        List<String> strList = nestty.strList;
        nestty.strList = new ArrayList<>();
        return strList;
    }

    /**
     * @Description: 放回zookeeper信息的一个字符串List
     * @Author: kun.ma
     * @Date: 2021/9/17 14:19
     * @Param: []
     * @Return: java.lang.StringBuilder
     */
    public static StringBuilder getZookeeperJSON(String connectString) throws InterruptedException, IOException {
        stringBuilder = new StringBuilder();
        zooKeeper = new ZooKeeper(connectString, 99999999, nestty);
        Thread.sleep(1000);
        //填写节点
        nestty.loopWatch("/dubbo");
        zooKeeper.close();
        String temp = "".equals(stringBuilder.toString()) ? "连接失败！" : "连接成功~";
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> "+temp+" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        return stringBuilder;
    }


    /**
     * @Description: 递归取数据
     * @Author: kun.ma
     * @Date: 2021/9/17 18:36
     * @Param: [path]
     * @Return: void
     */
    public void loopWatch(String path) throws InterruptedException {
        try {
            List<String> paths = zooKeeper.getChildren(path,nestty);
            if(paths.isEmpty()){
                byte[] data = zooKeeper.getData(path, true, stat);
                //目前不需要获取数据，false
                if (data != null && false){
                    strList.add(path+" 没有子路径,data are "+new String(zooKeeper.getData(path,true, stat))+ "\n");
                    String temp = "没有子路径,data are " + new String(data);
                    stringBuilder.append("{\"father\"" + ":" + "\"" + path + "\"" + ",\"son\"" + ":" + "\"" + 9999 + "\"" + "},");
//                    System.out.println(path+" have no children,data are "+new String(zooKeeper.getData(path,true, stat)));
                    zooKeeper.exists(path,nestty);
                }
                return;
            }
            //将dubbo展示所有service过滤掉
            if (!"/dubbo".equals(path) && getTotalNeedStringOfString(path,"/")!=2){
                strList.add("父-> :"+path+", 子-> :"+paths + "\n");
                stringBuilder.append("{\"father\"" + ":" + "\"" + path + "\"" + ",\"son\"" + ":" + "\"" + paths + "\"" + "},");
            }
//            System.out.println("parent path is: "+path+", children are: "+paths);

            //把子节点中的“consumers”和“providers”取出来
            if (paths.contains("consumers") || paths.contains("providers")){
                for(String childPath: paths){
                    //“consumers”和“providers”过滤
                    if ("consumers".equals(childPath) || "providers".equals(childPath)){
                        if ("/".equals(path)){
                            loopWatch("/"+childPath);
                        }else{
                            loopWatch(path+"/"+childPath);
                        }
                    }
                }
            }else {
                //其他节点照样走
                for(String childPath: paths){
                    if ("/".equals(path)){
                        loopWatch("/"+childPath);
                    }else{
                        loopWatch(path+"/"+childPath);
                    }
                }
            }
        } catch (KeeperException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void process(WatchedEvent event) {
        if (KeeperState.SyncConnected == event.getState()) {
            System.out.println("========event get started========"+new Date());
            if(EventType.None == event.getType() && null == event.getPath()){
                // 连接时的监听事件
                System.out.println("get connection msg!");
//                try {
//                    zooKeeper.exists("/nestty",nestty);
//                } catch (KeeperException e) {
//                    e.printStackTrace();
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
            } else { // 内容变更时的监听
                try {
                    //监听当前路径节点事件,exists只能监听到当前路径，子节点的还是需要getchildren
                    //一次watch处理，只针对一次事件，后续再触发事件需要再次设置监视
                    zooKeeper.exists(event.getPath(),nestty);
                    if(event.getType().equals(EventType.NodeChildrenChanged)){
                        //监听子节点变化事件
                        loopWatch(event.getPath());
                    }
                    zooKeeper.getChildren(event.getPath(),nestty);
                    System.out.println("event path is: "+event.getPath()+", event type is: "+event.getType()+", get msg content data:"
                            + new String(zooKeeper.getData(event.getPath(),true,  stat)));
                    System.out.println("get msg stat:czxid=" + (stat).getCzxid()
                            + ";mzxid=" + (stat).getMzxid() + ";version="  + (stat).getVersion());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void processResult(int rc, String path, Object ctx, Stat stat) {

    }

    /**
     * @Description: url字符串转ASCII码
     * @Author: kun.ma
     * @Date: 2021/9/17 14:49
     * @Param: [str]
     * @Return: java.lang.String
     */
    public static String urlEncoderString(String str) {
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
     * @Description: url字符串ASCII解析
     * @Author: kun.ma
     * @Date: 2021/9/17 14:49
     * @Param: [str]
     * @Return: java.lang.String
     */
    public static String urlDecoderString(String str) {
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

    /**
     * @Description: 获取字符串中子串的数量
     * @Author: kun.ma
     * @Date: 2021/9/17 18:16
     * @Param: [str, needSonStr]
     * @Return: int
     */
    public static int getTotalNeedStringOfString(String str,String needSonStr){
        int count = 0,len = str.length();
        while(str.contains(needSonStr)) {
            str = str.substring(str.indexOf(needSonStr) + 1,str.length());
            count++;
        }
        return count;
    }

}