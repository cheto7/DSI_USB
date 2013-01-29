/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.lowagie.text.pdf.*;
import com.lowagie.text.*;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;

import java.io.FileOutputStream;
import java.io.FileNotFoundException;

import DBMS.DBMS;
import com.itextpdf.text.Font;
import com.itextpdf.text.Rectangle;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.List;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.TimeZone;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

public class DownloadXLS extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        response.setContentType("application/octet-stream");

        ExcelCreator excelCreator = new ExcelCreator();

        HSSFWorkbook workbook = excelCreator.createWorkbook(new ArrayList());
        response.setHeader("Content-Disposition", "attachment; filename=Listados Generales.xls");


        HSSFCellStyle headerCellStyle = workbook.createCellStyle();
        HSSFFont boldFont = workbook.createFont();
        boldFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerCellStyle.setFont(boldFont);

        HSSFCellStyle tituloStyle = workbook.createCellStyle();
        HSSFFont tituloFont = workbook.createFont();
        tituloFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        tituloFont.setFontHeightInPoints((short) 12);
        tituloFont.setUnderline(HSSFFont.U_SINGLE);
        tituloStyle.setFont(tituloFont);


        HSSFSheet sheet = workbook.createSheet("Listados");
        short cero = 0;
        short uno = 1;
        short dos = 2;
        short width = 15000;
        short contador = 1;

        String fecha = DBMS.getInstance().obtenerFecha();


        sheet.setColumnWidth(cero, width);
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell(cero);
        cell.setCellStyle(tituloStyle);
        cell.setCellValue("Listados Generales EPP");
        row = sheet.createRow(contador++);
        cell = row.createCell(cero);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Fecha: " + fecha);

        contador++;
        row = sheet.createRow(contador++);
        cell = row.createCell(cero);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Equipo");
        cell = row.createCell(uno);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Talla");
        cell = row.createCell(dos);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Cantidad");

        String usuario = (String) session.getAttribute("usuarioAutenticado");
        ArrayList pedidos = DBMS.getInstance().obtenerPedidoCompleto(usuario);

        HSSFCell celltemp;
        for (short i = 0; i < pedidos.size(); i = (short) (i + 3)) {
            row = sheet.createRow(contador++);
            for (short j = 0; j < 3; j++) {
                celltemp = row.createCell(j);
                celltemp.setCellValue((String) pedidos.get(i + j));
            }
        }

        ServletOutputStream out = response.getOutputStream();
        workbook.write(out);

        out.flush();

        out.close();

        return mapping.findForward(SUCCESS);
    }
}