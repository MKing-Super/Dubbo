package pers.mk.dubbo.information.dubboinformation.utils;

import org.apache.zookeeper.AsyncCallback;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.Watcher.Event;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NesttyMain implements Watcher, AsyncCallback.StatCallback {
    private static ZooKeeper zooKeeper;
    private static Stat stat = new Stat();
    private static NesttyMain nestty = new NesttyMain();
    private static List<String> strList = new ArrayList<>();
    public static void main(String[] args) throws InterruptedException, IOException, KeeperException {
        zooKeeper = new ZooKeeper("10.100.210.127:2181", 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/");
        zooKeeper.close();
        //写入文件
        System.out.println("=========================== 开始写入文件 ===========================");
        String nowdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String s = "dubbo-consumers&providers-" + nowdate + ".txt";
        String fileName = "./" + s;
        File file = new File(fileName);
        if (!file.exists() && file.isDirectory()){
            file.mkdir();
            file.createNewFile();
        }
        Writer out = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(out);
        for (String str : strList){
            bw.write(str);
            bw.newLine();
            bw.flush();
        }
        bw.close();
        System.out.println("=========================== 写入文件成功 ===========================");
    }

    /**
     * @Description: 下载原数据到txt
     * @Author: kun.ma
     * @Date: 2021/9/27 11:23
     * @Param: [connectString]
     * @Return: java.lang.String
     */
    public static String downloadZookeeperTxt(String connectString) throws InterruptedException, IOException {
        zooKeeper = new ZooKeeper(connectString, 99999999, nestty);
        Thread.sleep(1000);
        nestty.loopWatch("/");
        zooKeeper.close();
        //写入文件
        System.out.println("=========================== 开始写入文件 ===========================");
        String name = "dubbo-consumers-providers-原数据.txt";
        String fileName = "./"+name;
        File file = new File(fileName);
        try {
            if (!file.exists() && file.isDirectory()){
                file.mkdir();
                file.createNewFile();
            }
            Writer out = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(out);
            for (String str : strList){
                bw.write(str);
                bw.newLine();
                bw.flush();
            }
            bw.close();
            System.out.println("=========================== 写入文件成功 ===========================");
        }catch (Exception e){
            return "写入文件出错失败";
        }
        return "写入文件成功~文件名称：" + name;
    }

    public void loopWatch(String path){
        try {
            List<String> paths = zooKeeper.getChildren(path,nestty);
            if(paths.isEmpty() && false){
                strList.add(path+" have no children,data are "+new String(zooKeeper.getData(path,true,stat)));
                //System.out.println(path+" have no children,data are "+new String(zooKeeper.getData(path,true,stat)));
                zooKeeper.exists(path,nestty);
                return;
            }
            strList.add("father -> "+path+"\n, son -> "+paths);
            //System.out.println("parent path is: "+path+", children are: "+paths);
            for(String childPath: paths){
                if (path.equals("/")){
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

    public void process(WatchedEvent event) {
        if (Event.KeeperState.SyncConnected == event.getState()) {
            System.out.println("========event get started========"+new Date());
            if(Event.EventType.None == event.getType() && null == event.getPath()){
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
                    if(event.getType().equals(Event.EventType.NodeChildrenChanged)){
                        //监听子节点变化事件
                        loopWatch(event.getPath());
                    }
                    zooKeeper.getChildren(event.getPath(),nestty);
                    System.out.println("event path is: "+event.getPath()+", event type is: "+event.getType()+", get msg content data:"
                            + new String(zooKeeper.getData(event.getPath(),true,stat)));
                    System.out.println("get msg stat:czxid=" + stat.getCzxid()
                            + ";mzxid=" + stat.getMzxid() + ";version="  + stat.getVersion());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void processResult(int rc, String path, Object ctx, Stat stat) {
        System.out.println("xzxzc");
    }
}
