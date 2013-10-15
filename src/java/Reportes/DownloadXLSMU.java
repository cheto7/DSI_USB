/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Equipo;
import Clases.Periodo;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ivan
 */
public class DownloadXLSMU extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
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
        
        response.setHeader("Content-Disposition", "attachment; filename=EquipoUnidad"+p.getFecha_fin()+".xls");


        // Se fijan los estilos del titulo y encabezado ===========
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
        // =======================================================

        HSSFSheet sheet = workbook.createSheet("Listados");
        short cero = 0;
        short contador = 1;

        String fecha = DBMS.getInstance().obtenerFecha();

        //===== Tamano de las columnas ============
        sheet.setColumnWidth((short)0, (short)10000);
        sheet.setColumnWidth((short)1, (short)8000);
        sheet.setColumnWidth((short)2, (short)5000);
        sheet.setColumnWidth((short)3, (short)5000);
        //==========================================
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell(cero);
        
        setEncabezado(row, cell,(short)0, tituloStyle,"Listados Generales EPP");
        
        row = sheet.createRow(contador++);
        setEncabezado(row, cell,(short)0, headerCellStyle,"Fecha: "+fecha);
        
        row = sheet.createRow(contador++);
        setEncabezado(row, cell,(short)0, headerCellStyle,"Listados clasificados por equipo e unidad durante el período");

        contador++;
        row = sheet.createRow(contador++);

        setEncabezado(row, cell,(short)0, headerCellStyle,"Equipo");
        setEncabezado(row, cell,(short)1, headerCellStyle,"Unidad de adscripción");
        setEncabezado(row, cell,(short)2, headerCellStyle,"Talla");
        setEncabezado(row, cell,(short)3, headerCellStyle,"Cantidad aprobada");

        ArrayList <Equipo> equipos = DBMS.getInstance().obtenerEquipoUnidad(p);

        HSSFCell celltemp;
        String areaAnterior = null;
        
        for (short i = 0; i < equipos.size(); i++) {
            row = sheet.createRow(contador++);
            if (!equipos.get(i).getSector().equals(areaAnterior)){
                row = sheet.createRow(contador++);                
                celltemp = row.createCell((short)0);
                celltemp.setCellValue(equipos.get(i).getSector());
                celltemp.setCellStyle(headerCellStyle);
                areaAnterior = equipos.get(i).getSector();
                row = sheet.createRow(contador++);
            }
            celltemp = row.createCell((short)0);
            celltemp.setCellValue(equipos.get(i).getNombre_vista());
            
            celltemp = row.createCell((short)1);
            celltemp.setCellValue(equipos.get(i).getFuncionalidad()); // unidad de adscripcion
            
            celltemp = row.createCell((short)2);
            celltemp.setCellValue(equipos.get(i).getTalla());
            
            celltemp = row.createCell((short)3);
            celltemp.setCellValue(equipos.get(i).getCantidad());
        }

        ServletOutputStream out = response.getOutputStream();
        workbook.write(out);

        out.flush();

        out.close();

        return mapping.findForward(SUCCESS);
    }
    
    private void setEncabezado (HSSFRow row, HSSFCell cell, Short columna,
                                 HSSFCellStyle headerCellStyle, String titulo){
        cell = row.createCell(columna);
        cell.setCellStyle(headerCellStyle);
        cell.setCellValue(titulo);  
    }    
}
