package pers.mk.dubbo.learn.web.configs;


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

public class NesttyMain implements Watcher, AsyncCallback.StatCallback {
    private static ZooKeeper zooKeeper;
    private static Stat stat = new Stat();
    private static NesttyMain nestty = new NesttyMain();
    public static void main(String[] args) throws InterruptedException, IOException, KeeperException {
        zooKeeper = new ZooKeeper("10.100.210.127:2181", 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/");
        while (true){

        }
    }
    private List<String> strList = new ArrayList<>();
    private StringBuilder stringBuilder = new StringBuilder();
    public static List<String> test() throws InterruptedException, IOException, KeeperException {
        zooKeeper = new ZooKeeper("10.100.210.127:2181", 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/dubbo");
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> END >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..");
        List<String> strList = nestty.strList;
        nestty.strList = new ArrayList<>();
        return strList;
    }

    public static StringBuilder zookeeperJSON() throws InterruptedException, IOException, KeeperException {
        zooKeeper = new ZooKeeper("10.100.210.127:2181", 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/dubbo");
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> END >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

        return nestty.stringBuilder;
    }



    public void loopWatch(String path){
        try {
            List<String> paths = zooKeeper.getChildren(path,nestty);
            if(paths.isEmpty()){
                byte[] data = zooKeeper.getData(path, true, stat);
                if (data != null){
                    strList.add(path+" 没有子路径,data are "+new String(zooKeeper.getData(path,true, stat))+ "\n");
                    stringBuilder.append(path+" 没有子路径,data are "+new String(zooKeeper.getData(path,true, stat)));
//                    System.out.println(path+" have no children,data are "+new String(zooKeeper.getData(path,true, stat)));
                    zooKeeper.exists(path,nestty);
                }
                return;
            }
            strList.add("父-> :"+path+", 子-> :"+paths + "\n");
            stringBuilder.append("{\"father\"" + ":" + "\"" + path + "\"" + ",\"son\"" + ":" + "\"" + paths + "\"" + "},");
//            System.out.println("parent path is: "+path+", children are: "+paths);
            for(String childPath: paths){
                if ("/".equals(path)){
                    loopWatch("/"+childPath);
                }else{
                    loopWatch(path+"/"+childPath);
                }
            }
        } catch (KeeperException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
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
        System.out.println("xzxzc");
    }




    public static String getURLEncoderString(String str) {
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