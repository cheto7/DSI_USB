/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Equipo;
import Clases.Periodo;
import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import DBMS.DBMS;

import java.util.ArrayList;
import javax.servlet.ServletOutputStream;
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

        response.setContentType("application/octet-stream");

        ExcelCreator excelCreator = new ExcelCreator();

        HSSFWorkbook workbook = excelCreator.createWorkbook(new ArrayList());
        
        Periodo p = new Periodo();
        p.setFecha_inicio(request.getParameter("fecha_inicio"));
        p.setFecha_fin(request.getParameter("fecha_fin"));
        
        response.setHeader("Content-Disposition", "attachment; filename=MaterialCantidad"+p.getFecha_fin()+".xls");


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
        
        row = sheet.createRow(contador++);
        cell = row.createCell(cero);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Listados clasificados por Material durante el período");        

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

        //String usuario = (String) session.getAttribute("usuarioAutenticado");
        ArrayList <Equipo> pedidos = DBMS.getInstance().obtenerMaterialCantidad(p);

        HSSFCell celltemp,celltemp1, celltemp2;
        
        for (short i = 0; i < pedidos.size(); i++) {
            row = sheet.createRow(contador++);
            celltemp = row.createCell((short)0);
            celltemp.setCellValue(pedidos.get(i).getNombre_vista());
            
            celltemp1 = row.createCell((short)1);
            celltemp1.setCellValue(pedidos.get(i).getTalla());
            
            celltemp2 = row.createCell((short)2);
            celltemp2.setCellValue(pedidos.get(i).getCantidad());
        }

        ServletOutputStream out = response.getOutputStream();
        workbook.write(out);

        out.flush();

        out.close();

        return mapping.findForward(SUCCESS);
    }
}