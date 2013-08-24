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
import com.itextpdf.text.pdf.PdfContentByte;
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
import javax.swing.GroupLayout;


public class DownloadPDF extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        Document document = new Document();
        document.setMargins(10,10,10,10);
       
        
        //response.setContentType("application/octet-stream");
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment;filename=miSolicitudEPP.pdf");
        try {
            String loggueado = (String) session.getAttribute("usuarioAutenticado");
            Usuario u = new Usuario();
            Solicitud solicitud = new Solicitud();
            int id = Integer.parseInt(request.getParameter("id"));
            solicitud.setId(id);
            u.setUsuario(loggueado);
            u = DBMS.getInstance().atributosUsuario(u);


            OutputStream out = response.getOutputStream();
            
            
            PdfWriter.getInstance(document, out);
            
            

            document.open();

            String rutaApp = this.getServlet().getServletContext().getRealPath("/");
            String path = rutaApp + "assets/tope.png";

            //Image image1 = Image.getInstance(System.getProperty("user.home")+"/NetBeansProjects/DSI_USB/web/assets/tope.png");
            Image image1 = Image.getInstance(path);
            document.add(image1);
            com.itextpdf.text.Font fuente = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 12, com.itextpdf.text.Font.BOLD);
            String encabezado = "Comprobante de solicitud de equipos de protección\n";
            
            Paragraph pa = new Paragraph(encabezado, fuente);
            pa.setAlignment(Element.ALIGN_CENTER);
            pa.setSpacingBefore(20);
            pa.setSpacingAfter(10);
            pa.setIndentationLeft(50);
            com.itextpdf.text.Font fuente2 = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 11, com.itextpdf.text.Font.BOLD);
            com.itextpdf.text.pdf.PdfPTable tableUsuario = new com.itextpdf.text.pdf.PdfPTable(3);
            com.itextpdf.text.pdf.PdfPTable tableUsuario1 = new com.itextpdf.text.pdf.PdfPTable(3);
           
            
            String parrafo = "Nombres y Apellidos";
            Paragraph par2 = new Paragraph(parrafo, fuente2);
            PdfPCell c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableUsuario.addCell(c1);

            parrafo = "Usuario";
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableUsuario.addCell(c1);
            
            parrafo = "C.I";
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableUsuario.addCell(c1);            

            parrafo = "Ingreso";
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableUsuario1.addCell(c1);

            parrafo = "Sexo";
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableUsuario1.addCell(c1);

            parrafo = "Area Laboral";
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableUsuario1.addCell(c1);
            
            tableUsuario.setSpacingBefore(20);
            tableUsuario.setSpacingAfter(10);
            

            PdfPCell nombre = new PdfPCell(new Paragraph(u.getNombre() + " " + u.getApellido()));
            PdfPCell usuario = new PdfPCell(new Paragraph(u.getUsuario()));
            PdfPCell cedula = new PdfPCell(new Paragraph(u.getCi()));
            PdfPCell ingreso = new PdfPCell(new Paragraph(u.getFecha()));
            PdfPCell sexo = new PdfPCell(new Paragraph(u.getSexo()));
            PdfPCell area = new PdfPCell(new Paragraph(u.getArea_laboral()));

            tableUsuario.addCell(nombre);
            tableUsuario.addCell(usuario);
            tableUsuario.addCell(cedula);
            tableUsuario1.addCell(ingreso);
            tableUsuario1.addCell(sexo);
            tableUsuario1.addCell(area);


            document.add(pa);
            document.add(tableUsuario);
            document.add(tableUsuario1);
            //**************************************************************

            // Datos Basicos
            String s = "Lista de materiales solicitados:";
            com.itextpdf.text.Paragraph p = new com.itextpdf.text.Paragraph(s);
            p.setSpacingBefore(20);
            p.setSpacingAfter(10);
            p.setIndentationLeft(50);
            document.add(p);
            com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(4);


            parrafo = "Lista de materiales";
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c1);


            parrafo = "Cantidad";
            Paragraph par3 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par3);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c1);
            table.setHeaderRows(1);

            parrafo = "Frecuencia de uso";
            Paragraph par4 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par4);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c1);
            table.setHeaderRows(1);

            parrafo = "Talla";
            Paragraph par5 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par5);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c1);
            table.setHeaderRows(1);

            ArrayList<Solicitud> EPS = DBMS.getInstance().obtenerSolicitudUsuario(u, solicitud);
            String material = new String();
            String cantidad = new String();
            String frecuencia = new String();
            String talla = new String();


            for (int i = 0; i < EPS.size(); i++) {
                material = EPS.get(i).getNombre_vista();
                cantidad = EPS.get(i).getCantidad();
                frecuencia = EPS.get(i).getFrecuencia();
                talla = EPS.get(i).getTalla();
                System.out.println(s);
                PdfPCell cell = new PdfPCell(new Paragraph(material));
                PdfPCell cell1 = new PdfPCell(new Paragraph(cantidad));
                PdfPCell cell2 = new PdfPCell(new Paragraph(frecuencia));
                PdfPCell cell3 = new PdfPCell(new Paragraph(talla));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
                table.addCell(cell1);
                table.addCell(cell2);
                table.addCell(cell3);
            }
            document.add(table);
            document.close();

        } finally {
            return null;
        }
    }
}