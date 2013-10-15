/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Periodo;
import Clases.Usuario;
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
public class DownloadXLSUP extends org.apache.struts.action.Action {

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
        
        response.setHeader("Content-Disposition", "attachment; filename=UsuarioPedido"+p.getFecha_fin()+".xls");


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
        sheet.setColumnWidth((short)0, (short)2500);
        sheet.setColumnWidth((short)1, (short)6000);
        sheet.setColumnWidth((short)2, (short)6000);
        sheet.setColumnWidth((short)3, (short)10000);
        sheet.setColumnWidth((short)4, (short)10000);
        sheet.setColumnWidth((short)5, (short)2500);
        sheet.setColumnWidth((short)6, (short)13000);
        sheet.setColumnWidth((short)7, (short)3000);
        sheet.setColumnWidth((short)8, (short)5000);
        //==========================================
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell(cero);
        
        setEncabezado(row, cell,(short)0, tituloStyle,"Listados Generales EPP");
        
        row = sheet.createRow(contador++);
        setEncabezado(row, cell,(short)0, headerCellStyle,"Fecha: "+fecha);
        
        row = sheet.createRow(contador++);
        setEncabezado(row, cell,(short)0, headerCellStyle,"Listados clasificados por Usuario durante el período");

        contador++;
        row = sheet.createRow(contador++);

        setEncabezado(row, cell,(short)0, headerCellStyle,"Cédula");
        setEncabezado(row, cell,(short)1, headerCellStyle,"Nombres");
        setEncabezado(row, cell,(short)2, headerCellStyle,"Apellidos");
        setEncabezado(row, cell,(short)3, headerCellStyle,"Cargo");
        setEncabezado(row, cell,(short)4, headerCellStyle,"Unidad de adscripción");
        setEncabezado(row, cell,(short)5, headerCellStyle,"Sexo");
        setEncabezado(row, cell,(short)6, headerCellStyle,"Equipo");
        setEncabezado(row, cell,(short)7, headerCellStyle,"Talla");
        setEncabezado(row, cell,(short)8, headerCellStyle,"Cantidad aprobada");

        ArrayList <Usuario> usuarios = DBMS.getInstance().obtenerUsuarioCantidad(p);

        HSSFCell celltemp;
        String areaAnterior = null;
        
        for (short i = 0; i < usuarios.size(); i++) {
            row = sheet.createRow(contador++);
            if(!usuarios.get(i).getArea_laboral().equals(areaAnterior)){
                row = sheet.createRow(contador++);
                celltemp = row.createCell((short)0);
                celltemp.setCellValue(usuarios.get(i).getArea_laboral());
                celltemp.setCellStyle(headerCellStyle);
                areaAnterior = usuarios.get(i).getArea_laboral();
                row = sheet.createRow(contador++);
            }
            celltemp = row.createCell((short)0);
            celltemp.setCellValue(usuarios.get(i).getCi());
            
            celltemp = row.createCell((short)1);
            celltemp.setCellValue(usuarios.get(i).getNombre());
            
            celltemp = row.createCell((short)2);
            celltemp.setCellValue(usuarios.get(i).getApellido());
            
            celltemp = row.createCell((short)3);
            celltemp.setCellValue(usuarios.get(i).getCargo());            
            
            celltemp = row.createCell((short)4);
            celltemp.setCellValue(usuarios.get(i).getUnidad_adscripcion());
            
            celltemp = row.createCell((short)5);
            celltemp.setCellValue(usuarios.get(i).getSexo());
            
            celltemp = row.createCell((short)6);
            celltemp.setCellValue(usuarios.get(i).getTalla_camisa()); // nombre del equipos
            
            celltemp = row.createCell((short)7);
            celltemp.setCellValue(usuarios.get(i).getTalla_guantes()); // talla del equipo
            
            celltemp = row.createCell((short)8);
            celltemp.setCellValue(usuarios.get(i).getTalla_mascara()); // cantidad del equipo
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