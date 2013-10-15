/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Equipo;
import Clases.Periodo;
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
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

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
        cell.setCellValue("Funcionalidad");
        
        cell = row.createCell(dos);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Norma");
        
        cell = row.createCell((short)3);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Talla");
        
        cell = row.createCell((short)4);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("Cantidad aprobada");
        
        cell = row.createCell((short)5);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue("En existencia");        

        //String usuario = (String) session.getAttribute("usuarioAutenticado");
        ArrayList <Equipo> pedidos = DBMS.getInstance().obtenerMaterialCantidad(p);

        HSSFCell celltemp;
        String areaAnterior = null;
        for (short i = 0; i < pedidos.size(); i++) {
            row = sheet.createRow(contador++);
            
            if (!pedidos.get(i).getSector().equals(areaAnterior)){
                row = sheet.createRow(contador++);                
                celltemp = row.createCell((short)0);
                celltemp.setCellValue(pedidos.get(i).getSector());
                celltemp.setCellStyle(headerCellStyle);
                areaAnterior = pedidos.get(i).getSector();
                row = sheet.createRow(contador++);
            }
 
            celltemp = row.createCell((short)0);
            celltemp.setCellValue(pedidos.get(i).getNombre_vista());
            
            celltemp = row.createCell((short)1);
            celltemp.setCellValue(pedidos.get(i).getFuncionalidad());
            
            celltemp = row.createCell((short)2);
            celltemp.setCellValue(pedidos.get(i).getNorma());
            
            celltemp = row.createCell((short)3);
            celltemp.setCellValue(pedidos.get(i).getTalla());
            
            celltemp = row.createCell((short)4);
            celltemp.setCellValue(pedidos.get(i).getCantidad());
            
            celltemp = row.createCell((short)5);
            celltemp.setCellValue(pedidos.get(i).getSerial());  //existencia del equipo          
        }

        ServletOutputStream out = response.getOutputStream();
        workbook.write(out);

        out.flush();

        out.close();

        return mapping.findForward(SUCCESS);
    }
}