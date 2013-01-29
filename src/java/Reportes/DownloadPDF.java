/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Solicitud;
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
import com.itextpdf.text.Image;
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
import javax.servlet.http.HttpSession;

public class DownloadPDF extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        Document document = new Document();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=solicitud.pdf");
        try {
            String loggueado = (String) session.getAttribute("usuarioAutenticado");
            Usuario u = new Usuario();
            u.setUsuario(loggueado);
            u = DBMS.getInstance().atributosUsuario(u);
            OutputStream out = response.getOutputStream();
            PdfWriter.getInstance(document, out);
            document.open();
            Image image1 = Image.getInstance("C:\\Users\\Alfred\\Documents\\NetBeansProjects\\Prueba\\web\\assets\\tope.png");
            document.add(image1);
            com.itextpdf.text.Font fuente = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 12, com.itextpdf.text.Font.BOLD);
            DateFormat dates = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();
            String encabezado = "\nCaracas " + dates.format(date) + "\n"
                    + "Direccion de Seguridad Integral \n"
                    + "Reporte de EPS\n"
                    + "Usuario: " + u.getNombre() + " " + u.getApellido();
            Paragraph pa = new Paragraph(encabezado, fuente);
            pa.setSpacingBefore(20);
            pa.setSpacingAfter(10);
            pa.setIndentationLeft(50);
            document.add(pa);
            // Datos Basico
            String s = "Lista de materiales solicitados:";
            com.itextpdf.text.Paragraph p = new com.itextpdf.text.Paragraph(s);
            p.setSpacingBefore(20);
            p.setSpacingAfter(10);
            p.setIndentationLeft(50);
            document.add(p);
            com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(2); 
            com.itextpdf.text.Font fuente2 = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 11, com.itextpdf.text.Font.BOLD);
            String parrafo = "Lista de materiales";
            Paragraph par2 = new Paragraph(parrafo, fuente2);
            PdfPCell c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c1);
            
            
            parrafo = "Cantidad";
            Paragraph par3 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par3);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c1);
            table.setHeaderRows(1);
            /*s = "Aspirantes Seleccionados: " + numPreselectos;
             PdfPCell cell1 = new PdfPCell(new Paragraph(s));
             s = "Aspirantes No Seleccionados: " + numNoPreselectos;
             PdfPCell cell2 = new PdfPCell(new Paragraph(s));
             table.addCell(cell1);
             table.addCell(cell2);*/

            ArrayList<Solicitud> EPS = DBMS.getInstance().obtenerPedido(loggueado);
            String material = new String();
            String cantidad = new String();

            for (int i = 0; i < EPS.size(); i++) {
                material = EPS.get(i).getNombre_vista();
                cantidad = EPS.get(i).getCantidad();
                System.out.println(s);
                PdfPCell cell = new PdfPCell(new Paragraph(material));
                PdfPCell cell1 = new PdfPCell(new Paragraph(cantidad));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
                table.addCell(cell1);
            }
            document.add(table);
            document.close();

        } finally {
            return null;
        }
    }
}