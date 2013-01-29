/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import java.util.ArrayList;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelCreator {

    public HSSFWorkbook createWorkbook(ArrayList userList) throws Exception {

        HSSFWorkbook wb = new HSSFWorkbook();

        HSSFCellStyle headerCellStyle = wb.createCellStyle();
        HSSFFont boldFont = wb.createFont();
        boldFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerCellStyle.setFont(boldFont);

        return wb;
    }
    
}