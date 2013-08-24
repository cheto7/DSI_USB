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

import java.util.ArrayList;

/**
 *
 * @author ivan
 */
public class DownloadEntregaPDF extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final com.itextpdf.text.Font fuente = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 12, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font fuente2 = new com.itextpdf.text.Font(com.itextpdf.text.Font.getFamily("ARIAL"), 11, com.itextpdf.text.Font.BOLD);

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
        Document document = new Document();
        document.setMargins(10,10,10,10);
        
        try{
            Solicitud solicitud = new Solicitud();
            int idSolicitud = Integer.parseInt(request.getParameter("idSolicitud"));
            solicitud.setId(idSolicitud);
            
            Usuario u = DBMS.getInstance().obtenerUsuarioDeSolicitud(solicitud);
            
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment;filename=entrega"+u.getCi()+".pdf");
            
            OutputStream out = response.getOutputStream();
            PdfWriter.getInstance(document, out);
            document.open();

            String rutaApp = this.getServlet().getServletContext().getRealPath("/");
            String path = rutaApp + "assets/tope.png";
            Image image1 = Image.getInstance(path);
            document.add(image1);
            String encabezado = "Comprobante de entrega de equipos de protección\n";
            
            Paragraph pa = new Paragraph(encabezado, fuente);
            pa.setAlignment(Element.ALIGN_CENTER);
            pa.setSpacingBefore(20);
            pa.setSpacingAfter(5);
            pa.setIndentationLeft(1);
            com.itextpdf.text.pdf.PdfPTable tableUsuario = new com.itextpdf.text.pdf.PdfPTable(3);
            com.itextpdf.text.pdf.PdfPTable tableUsuario1 = new com.itextpdf.text.pdf.PdfPTable(3);
            tableUsuario.setWidths(new int[]{170,80,40});
            tableUsuario1.setWidths(new int[]{70,60,140});
            
            Paragraph par2 =new Paragraph();
            PdfPCell c1 = new PdfPCell();
                      
            colocarCabecera("Nombres y Apellidos", par2,c1,tableUsuario);
            colocarCabecera("Usuario", par2,c1,tableUsuario);
            colocarCabecera("C.I", par2,c1,tableUsuario);
            colocarCabecera("Ingreso", par2,c1,tableUsuario1);
            colocarCabecera("Sexo", par2,c1,tableUsuario1);
            colocarCabecera("Area Laboral", par2,c1,tableUsuario1);
            

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
            
            // Datos Basicos           
         colocarTexto("Lista de equipos entregados:",document,20,10,50);
            
            
            com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(5);
            table.setWidths(new int[]{20,160,30,40,40});
            
            colocarCabecera("Item", par2,c1,table);
            colocarCabecera("Equipo", par2,c1,table);
            colocarCabecera("Talla", par2,c1,table);
            colocarCabecera("Solicitado", par2,c1,table);
            colocarCabecera("Entregado", par2,c1,table);

            
            ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(idSolicitud);
            String material,talla;
            int solicitado,entregado;


            for (int i = 0; i < solicitudes.size(); i++) {
                material = solicitudes.get(i).getEquipo();
                talla = solicitudes.get(i).getTalla();
                solicitado = solicitudes.get(i).getCantidad_solicitada();
                entregado = solicitudes.get(i).getCantidad_entregada();
                PdfPCell cell0 = new PdfPCell(new Paragraph(""+(i+1)));
                PdfPCell cell = new PdfPCell(new Paragraph(material));
                PdfPCell cell1 = new PdfPCell(new Paragraph(talla));
                PdfPCell cell2 = new PdfPCell(new Paragraph(""+solicitado));
                PdfPCell cell3 = new PdfPCell(new Paragraph(""+entregado));
                cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell0);
                table.addCell(cell);
                table.addCell(cell1);
                table.addCell(cell2);
                table.addCell(cell3);
            }
            
            com.itextpdf.text.pdf.PdfPTable tableUsuario3 = new com.itextpdf.text.pdf.PdfPTable(2);
            tableUsuario3.setWidths(new int[]{30,70});
            colocarCabecera("Observaciones", par2,c1,tableUsuario3);
            
            PdfPCell cell;
            cell = new PdfPCell(new Paragraph("Estos implementos se le han entregado para ser "
                    + "utilizados de forma obligatoria en el desarrollo de "
                    + "sus actividades laborales según lo establecido en la "
                    + "LOPCYMAT en sus Art. 40, 53, 54, 55 y 62, quedando bajo "
                    + "su responsabilidad el mantenimiento adecuado y uso "
                    + "correcto de los mismos."));
            tableUsuario3.addCell(cell);
            
           tableUsuario3.setSpacingBefore(20);
           tableUsuario3.setSpacingAfter(10);         
            
            document.add(table);
            document.add(tableUsuario3);
            
         colocarTexto("Yo,"+u.getNombre()+" "+u.getApellido()+", "
                 + "portador de la cédula de identidad número "+u.getCi()+", "
                 + "he recibido conforme los implementos de "
                 + "seguridad descritos en el cuadro.",
                 document,
                 0,10,10);
         
         colocarTexto("Firma: _____________________________________\n"
                 + "Fecha: ",
                 document,
                 0,40,10);
         
         colocarTexto("Entregado por:___________________________________\n"
                 + "Sello: ",
                 document,
                 0,40,10);

            document.close(); 
            
        }finally {
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
}