package pers.mk.dubbo.information.dubboinformation.controller;

import net.sf.json.JSONArray;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.zookeeper.KeeperException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.mk.dubbo.information.dubboinformation.api.ZKModel;
import pers.mk.dubbo.information.dubboinformation.utils.ZKUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zk")
public class ZKController {
    private static ArrayList<ZKModel> resultList = new ArrayList<>();

    @RequestMapping("/zkjson")
    public String zkjson(String IP, String port, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, InterruptedException {
        String connectString = IP + ":" + port;
        StringBuilder stringBuilder = ZKUtils.getZookeeperJSON(connectString);
        if ("".equals(stringBuilder.toString())){
            model.addAttribute("result",0);
            return "/index";
        }
        //url解析
        stringBuilder = new StringBuilder(ZKUtils.urlDecoderString(stringBuilder.toString()));
        //去除最后的逗号
        stringBuilder = new StringBuilder(stringBuilder.substring(0, stringBuilder.length() - 1));
        //转成json格式
        stringBuilder = new StringBuilder("[" + stringBuilder + "]");
        //转成map
        JSONArray jsonArray = JSONArray.fromObject(stringBuilder.toString());
        List<Map<String,String>> mapListJson = (List)jsonArray;

        ArrayList<ZKModel> zkModelList = new ArrayList<>();
        for (Map<String,String> map : mapListJson){
            String son = map.get("son");
            String subson = son.substring(1, son.length() - 1);
            String[] splitson = subson.split(",");
            List<String> tempList = new ArrayList<>();
            //遍历每个son下面的数据
            for (int i = 0 ; i < splitson.length ; i++){
                //将son中的带有IP地址的有用信息提取出来
                boolean contains = splitson[i].contains("://");
                if (contains){
                    String s = splitson[i].split("\\?")[0];
                    tempList.add(s);
                }
            }

//            List<String> listson = Arrays.asList(splitson);

            ZKModel zkModel = new ZKModel();
            zkModel.setFather(map.get("father"));
            zkModel.setSon(tempList);
            zkModelList.add(zkModel);
        }
//        System.out.println(zkModelList);
        resultList = zkModelList;
//        setUpExcel(request,response);

        //写入文件
//        File file = new File("./mk.txt");
//        if (!file.exists() && file.isDirectory()){
//            file.mkdir();
//            file.createNewFile();
//        }
//        Writer out = new FileWriter(file);
//        BufferedWriter bw = new BufferedWriter(out);
//        bw.write(stringBuilder.toString());
//        bw.newLine();
//        bw.flush();
//        bw.close();
//        setUpExcel(request,response);
        model.addAttribute("result",1);
//        return stringBuilder;
        return "/index";
    }

    /**
     * @Description: 导出zookeeper数据到excel
     * @Author: kun.ma
     * @Date: 2021/9/17 18:33
     * @Param: [request, response]
     * @Return: void
     */
    @RequestMapping("/downloadExcel")
    public static void setUpExcel(HttpServletRequest request, HttpServletResponse response) throws IOException{
        List<ZKModel> zkModelList = resultList;
        //列名
        String[] headers = { "father", "son"};
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet();
        //设置列宽
        sheet.setDefaultColumnWidth((short) 80);
        //创建第一行的对象，第一行一般用于填充标题内容。从第二行开始一般是数据
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            //创建单元格，每行多少数据就创建多少个单元格
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            //给单元格设置内容
            cell.setCellValue(text);
        }

        //遍历集合，将每个集合元素对象的每个值填充到单元格中
        for(int i=0;i<zkModelList.size();i++){
            ZKModel statisticsModel=zkModelList.get(i);
            //从第二行开始填充数据
            row = sheet.createRow(i+1);
            //该集合只记录数量和时间，这两个值来自statisticsModel。如果对象比较复杂，需要额外转换，比如Date类型的日期，int，float类型的数值
            List<String> datas=new ArrayList<>();

            String father=statisticsModel.getFather().toString();
            String son=statisticsModel.getSon().toString();
            datas.add(father);
            datas.add(son);
            for (int j=0;j<datas.size();j++) {
                String string=datas.get(j);
                HSSFCell cell = row.createCell(j);
                HSSFRichTextString richString = new HSSFRichTextString(string);
//                HSSFFont font3 = workbook.createFont();
////                定义Excel数据颜色，这里设置为蓝色
//                font3.setColor(HSSFColor.BLUE.index);
//                richString.applyFont(font3);
                cell.setCellValue(richString);
            }

        }

        response.setContentType("application/octet-stream");
        String nowdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        response.setHeader("Content-disposition", "attachment;filename="+"dubbo-consumers&providers-" + nowdate + ".xls");//Excel文件名
        try {
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //将workbook中的内容写入输出流中
        workbook.write(response.getOutputStream());

    }
}
