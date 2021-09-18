package pers.mk.dubbo.information.dubboinformation.utils;


import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExcelUtil {
    public static void main(String[] args) throws IOException {
        FileOutputStream fos=new FileOutputStream("D:\\exceldatas\\hebing.xls");
        HSSFWorkbook wb=new HSSFWorkbook();
        HSSFSheet sheet=wb.createSheet();
        /*
         * 设定合并单元格区域范围
         * 	firstRow  0-based
         * 	lastRow   0-based
         * 	firstCol  0-based
         * 	lastCol   0-based
         */
        CellRangeAddress cra=new CellRangeAddress(0, 1, 0, 2);
        //在sheet里增加合并单元格
        sheet.addMergedRegion(cra);

        HSSFRow row = sheet.createRow(0);
        HSSFCell cell_1 = row.createCell(0);
        cell_1.setCellValue("this is merge unit ");
        //cell 位置3-6被合并成一个单元格，不管你怎样创建第4个cell还是第5个cell…然后在写数据。都是无法写入的。
        HSSFCell cell_2 = row.createCell(7);
        cell_2.setCellValue("what's up ! ");
        wb.write(fos);
        fos.close();
    }
}