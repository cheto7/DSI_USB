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

import java.io.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.PageSize;
import DBMS.DBMS;

//import com.lowagie.text.pdf.PdfCell;
//import com.itextpdf.text.Font;
//import java.io.File;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import com.itextpdf.text.pdf.PdfPTable;
//import com.itextpdf.text.pdf.PdfContentByte;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import com.lowagie.text.pdf.*;
//import com.lowagie.text.*;
//import java.util.List;
//import java.io.FileOutputStream;
//import java.io.FileNotFoundException;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.Iterator;
//import java.util.TimeZone;
//import javax.swing.GroupLayout;
public class DownloadPDF extends org.apache.struts.action.Action {

    private static final com.itextpdf.text.Font fuente = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 12, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font fuente2 = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 11, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font fuenteFooter = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 8, com.itextpdf.text.Font.BOLD);

    /* forward name="success" path="" */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        Document document = new Document(PageSize.A4, 36, 36, 54, 36);
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

            OutputStream out1 = response.getOutputStream();
//            OutputStream out1 = new ByteArrayOutputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, out);

            document.open();

            colocarHeader(document, u);

            Paragraph par2 = new Paragraph();
            PdfPCell c1 = new PdfPCell();

            //**************************************************************

            // Datos Basicos
            com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(4);
            table.setWidthPercentage(100);
            table.setWidths(new int[]{160, 40, 90, 40});

            colocarCabecera("Equipo", par2, c1, table);
            colocarCabecera("Cantidad", par2, c1, table);
            colocarCabecera("Frecuencia de uso", par2, c1, table);
            colocarCabecera("Talla", par2, c1, table);

            ArrayList<Solicitud> EPS = DBMS.getInstance().obtenerSolicitudUsuario(u, solicitud);
            String material, cantidad, frecuencia, talla;

            int conta = 1;
            for (int i = 0; i < EPS.size(); i++) {
                material = EPS.get(i).getNombre_vista();
                cantidad = EPS.get(i).getCantidad();
                frecuencia = EPS.get(i).getFrecuencia();
                talla = EPS.get(i).getTalla();
                PdfPCell cell = new PdfPCell(new Paragraph(material));
                PdfPCell cell1 = new PdfPCell(new Paragraph(cantidad));
                PdfPCell cell2 = new PdfPCell(new Paragraph(frecuencia));
                PdfPCell cell3 = new PdfPCell(new Paragraph(talla));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                if (conta <=10){ //cantidad de equipos por pdf
                    table.addCell(cell);
                    table.addCell(cell1);
                    table.addCell(cell2);
                    table.addCell(cell3);
                }
                else{
                    document.newPage();
                    colocarHeader(document, u);
                    conta = 1;
                    table.addCell(cell);
                    table.addCell(cell1);
                    table.addCell(cell2);
                    table.addCell(cell3);
                }
                conta++;
            }
            document.add(table);
            document.close();

            // Create a reader
            PdfReader reader = new PdfReader(out.toByteArray());
            // Create a stamper
            PdfStamper stamper = new PdfStamper(reader, out);
            // Loop over the pages and add a header to each page
            int n = reader.getNumberOfPages();
            for (int i = 1; i <= n; i++) {
                getHeaderTable(i, n).writeSelectedRows(0, -1, 15, 833, stamper.getOverContent(i));
                getFooterTable().writeSelectedRows(0, -1, 30, 33, stamper.getOverContent(i));
            }
            // Close the stamper
            stamper.close();
            reader.close();
            out.writeTo(out1);
        } finally {
            return null;
        }
    }

    private void colocarCabecera(String parrafo, Paragraph par2,
            PdfPCell c1,
            com.itextpdf.text.pdf.PdfPTable table) {
        par2 = new Paragraph(parrafo, fuente2);
        c1 = new PdfPCell(par2);
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        c1.setGrayFill(0.8f);
        c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(c1);
    }

    private void colocarTexto(String texto, Document document, float espacioAntes,
            float espacioDespues, float indentacionIzq)
            throws DocumentException {
        com.itextpdf.text.Paragraph p = new com.itextpdf.text.Paragraph(texto);
        p.setSpacingBefore(espacioAntes);
        p.setSpacingAfter(espacioDespues);
        p.setIndentationLeft(indentacionIzq);
        document.add(p);
    }

    private void colocarHeader(Document document, Usuario u) throws Exception {
        String rutaApp = this.getServlet().getServletContext().getRealPath("/");
        String path = rutaApp + "assets/tope.png";
        Image image1 = Image.getInstance(path);
        document.add(image1);

        String encabezado = "Comprobante de solicitud de equipos de protección\n";

        Paragraph pa = new Paragraph(encabezado, fuente);
        pa.setAlignment(Element.ALIGN_CENTER);
        pa.setSpacingBefore(20);
        pa.setSpacingAfter(10);
        pa.setIndentationLeft(50);
        com.itextpdf.text.pdf.PdfPTable tableUsuario = new com.itextpdf.text.pdf.PdfPTable(3);
        com.itextpdf.text.pdf.PdfPTable tableUsuario1 = new com.itextpdf.text.pdf.PdfPTable(4);
        tableUsuario.setWidthPercentage(100);
        tableUsuario1.setWidthPercentage(100);
        tableUsuario.setWidths(new int[]{150, 100, 40});
        tableUsuario1.setWidths(new int[]{140, 140, 50, 60});

        Paragraph par2 = new Paragraph();
        PdfPCell c1 = new PdfPCell();

        colocarCabecera("Nombres y Apellidos", par2, c1, tableUsuario);
        colocarCabecera("Usuario", par2, c1, tableUsuario);
        colocarCabecera("C.I", par2, c1, tableUsuario);
        colocarCabecera("Unidad de adscripción", par2, c1, tableUsuario1);
        colocarCabecera("Cargo", par2, c1, tableUsuario1);
        colocarCabecera("Sexo", par2, c1, tableUsuario1);
        colocarCabecera("Sector universitario", par2, c1, tableUsuario1);

        PdfPCell nombre = new PdfPCell(new Paragraph(u.getNombre() + " " + u.getApellido()));
        PdfPCell usuario = new PdfPCell(new Paragraph(u.getUsuario()));
        PdfPCell cedula = new PdfPCell(new Paragraph(u.getCi()));
        PdfPCell unidad = new PdfPCell(new Paragraph(u.getUnidad_adscripcion()));
        PdfPCell cargo = new PdfPCell(new Paragraph(u.getCargo()));
        PdfPCell sexo = new PdfPCell(new Paragraph(u.getSexo()));
        PdfPCell area = new PdfPCell(new Paragraph(u.getArea_laboral()));

        tableUsuario.addCell(nombre);
        tableUsuario.addCell(usuario);
        tableUsuario.addCell(cedula);
        tableUsuario1.addCell(unidad);
        tableUsuario1.addCell(cargo);
        tableUsuario1.addCell(sexo);
        tableUsuario1.addCell(area);

        document.add(pa);
        document.add(tableUsuario);
        document.add(tableUsuario1);
        colocarTexto("Lista de equipos solicitados:", document, 20, 10, 50);
    }

    /**
     * Create a header table with page X of Y
     *
     * @param x the page number
     * @param y the total number of pages
     * @return a table that can be used as header
     */
    public static PdfPTable getHeaderTable(int x, int y) {
        PdfPTable table = new PdfPTable(2);
        table.setTotalWidth(527);
        table.setLockedWidth(true);
        table.getDefaultCell().setFixedHeight(20);
        table.getDefaultCell().setBorder(Rectangle.BOTTOM);
        table.addCell("Dirección de Seguridad Integral - USB");
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(String.format("Página %d de %d", x, y));
        return table;
    }
    
    /**
     * Create a header table with page X of Y
     *
     * @param x the page number
     * @param y the total number of pages
     * @return a table that can be used as header
     */
    public static PdfPTable getFooterTable() {
        PdfPTable table = new PdfPTable(1);
        table.setTotalWidth(527);
        table.setLockedWidth(true);
        table.getDefaultCell().setFixedHeight(15);
        table.getDefaultCell().setBorder(Rectangle.BOTTOM);
        
        Paragraph par2 = new Paragraph("Los equipos solicitados serán sometidos a evaluación por la Dirección de Seguridad Integral", fuenteFooter);
        PdfPCell c1 = new PdfPCell(par2);
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(c1);
        return table;
    }
}