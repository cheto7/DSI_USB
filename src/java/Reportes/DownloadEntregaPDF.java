/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import Clases.Entregas;
import Clases.Solicitud;
import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.io.*;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPCell;

import DBMS.DBMS;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

import java.util.ArrayList;

/**
 *
 * @author ivan
 */
public class DownloadEntregaPDF extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final com.itextpdf.text.Font fuente = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 12, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font fuente2 = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 11, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font fuenteFooter = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 8, com.itextpdf.text.Font.BOLD);

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
        Document document = new Document(PageSize.A4, 36, 36, 54, 36);
       
        try{
            Solicitud solicitud = new Solicitud();
            int idSolicitud = Integer.parseInt(request.getParameter("idSolicitud"));
            solicitud.setId(idSolicitud);
            
            Usuario u = DBMS.getInstance().obtenerUsuarioDeSolicitud(solicitud);
            
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment;filename=entrega"+u.getCi()+".pdf");
            
            OutputStream out1 = response.getOutputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, out);
            document.open();

            colocarHeader(document, u);
           
            Paragraph par2 =new Paragraph();
            PdfPCell c1 = new PdfPCell();
            
            
            // Datos Basicos
            com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(5);
            table.setWidthPercentage(100);
            table.setWidths(new int[]{15,140,60,30,35});
            
            colocarCabecera("Item", par2,c1,table);
            colocarCabecera("Equipo", par2,c1,table);
            colocarCabecera("Norma", par2,c1,table);
            colocarCabecera("Talla", par2,c1,table);
            colocarCabecera("Entregado", par2,c1,table);
            
            ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(idSolicitud);
            String material,talla,norma;
            int entregado;

            int conta = 1;
            for (int i = 0; i < solicitudes.size(); i++) {
                material = solicitudes.get(i).getEquipo();
                talla = solicitudes.get(i).getTalla();
                norma = solicitudes.get(i).getFecha_entrega();
                entregado = solicitudes.get(i).getCantidad_entregada();
                PdfPCell cell0 = new PdfPCell(new Paragraph(""+(i+1)));
                PdfPCell cell = new PdfPCell(new Paragraph(material));
                PdfPCell cell1 = new PdfPCell(new Paragraph(talla));
                PdfPCell cell2 = new PdfPCell(new Paragraph(""+norma));
                PdfPCell cell3 = new PdfPCell(new Paragraph(""+entregado));
                cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
                cell1.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
                cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                if (conta <=10){ //cantidad de equipos por pdf
                    table.addCell(cell0);
                    table.addCell(cell);
                    table.addCell(cell2);
                    table.addCell(cell1);
                    table.addCell(cell3);
                }
                else{
                    document.newPage();
                    colocarHeader(document, u);
                    conta = 1;
                    table.addCell(cell0);
                    table.addCell(cell);
                    table.addCell(cell2);
                    table.addCell(cell1);
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
                getDeclaracion(u).writeSelectedRows(0, -1, 30, 95, stamper.getOverContent(i));
                getFirmas().writeSelectedRows(0, -1, 30, 70, stamper.getOverContent(i));
            }
            // Close the stamper
            stamper.close();
            reader.close();
            out.writeTo(out1);
            
        } finally {
            return null;
        }
    }

    private void colocarCabecera (String parrafo,Paragraph par2, 
                                    PdfPCell c1,
                                    com.itextpdf.text.pdf.PdfPTable table){
            par2 = new Paragraph(parrafo, fuente2);
            c1 = new PdfPCell(par2);
            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            c1.setGrayFill(0.8f);
            c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(c1);
    }
    
    private void colocarTexto(String texto, Document document,float espacioAntes,
            float espacioDespues, float indentacionIzq) 
            throws DocumentException{
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

        String encabezado = "Comprobante de entrega de equipos de protección\n";

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
        colocarTexto("Lista de equipos entregados:", document, 20, 10, 50);
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
        
        Paragraph par2 = new Paragraph("Observación: Estos implementos se le han entregado para ser "
                    + "utilizados de forma obligatoria en el desarrollo de "
                    + "sus actividades laborales según lo establecido en la "
                    + "LOPCYMAT en sus Art. 40, 53, 54, 55 y 62, quedando bajo "
                    + "su responsabilidad el mantenimiento adecuado y uso "
                    + "correcto de los mismos.", fuenteFooter);
        PdfPCell c1 = new PdfPCell(par2);
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(c1);
        return table;
    }
    
    
    /**
     * Create a header table with page X of Y
     *
     * @param x the page number
     * @param y the total number of pages
     * @return a table that can be used as header
     */
    public static PdfPTable getDeclaracion(Usuario u) {
        PdfPTable table = new PdfPTable(1);
        table.setTotalWidth(527);
        table.setLockedWidth(true);
        table.getDefaultCell().setFixedHeight(15);
        table.getDefaultCell().setBorder(Rectangle.BOTTOM);
        
        Paragraph par2 = new Paragraph("Yo, "+u.getNombre()+" "+u.getApellido()+", "
                 + "portador de la cédula de identidad número "+u.getCi()+", "
                 + "he recibido conforme los implementos de "
                 + "seguridad descritos en el documento.", fuente2);
        PdfPCell c1 = new PdfPCell(par2);
        c1.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
        c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(c1);
        
        return table;
    }
    
    /**
     * Create a header table with page X of Y
     *
     * @param x the page number
     * @param y the total number of pages
     * @return a table that can be used as header
     */
    public static PdfPTable getFirmas() {
        PdfPTable table = new PdfPTable(2);
        table.setTotalWidth(527);
        table.setLockedWidth(true);
        table.getDefaultCell().setFixedHeight(15);
        table.getDefaultCell().setBorder(Rectangle.BOTTOM);
        
        java.util.Date date = new java.util.Date(); 
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
        String fecha = sdf.format(date);        
        
        Paragraph par2 = new Paragraph("Firma: ______________________________\n\n"
                 + "Fecha: "+fecha, fuente2);
        PdfPCell c1 = new PdfPCell(par2);
        c1.setHorizontalAlignment(Element.ALIGN_LEFT);
        c1.setVerticalAlignment(Element.ALIGN_TOP);
        table.addCell(c1);  
        
        par2 = new Paragraph("Entregado por:_________________________\n\nSello:", fuente2);
        c1 = new PdfPCell(par2);
        c1.setHorizontalAlignment(Element.ALIGN_LEFT);
        c1.setVerticalAlignment(Element.ALIGN_TOP);
        table.addCell(c1);
        
        return table;
    }
}