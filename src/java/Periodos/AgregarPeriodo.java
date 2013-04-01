/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Periodos;

import Clases.Noticia;
import Clases.Periodo;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.Date;

/**
 *
 * @author ivan
 */
public class AgregarPeriodo extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

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

        Noticia n = new Noticia();
        String titulo,contenido,fechaNoticia;
        java.util.Date date = new java.util.Date(); 
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        String fecha = sdf.format(date);
        
        Date today = new Date();
        Periodo p = (Periodo) form;
        if (p.getFecha_fin().equalsIgnoreCase("")){
            request.setAttribute("fechaNula", "error");
            return mapping.findForward(FAILURE);    
        }

        if(fecha.compareTo(p.getFecha_fin())>0 ||fecha.compareTo(p.getFecha_fin())==0){
            request.setAttribute("fechaErronea", "error");
            return mapping.findForward(FAILURE);
        }
        
        if(DBMS.getInstance().agregarPeriodo(p)==true){

            n.setTitulo("Abierto proceso de solicitudes");
            n.setContenido("Del "+fecha+" al "+p.getFecha_fin()+" el sistema "
                    + "estará disponible para realizar solicitudes de equipos "
                    + "de protección personal.");
            n.setFechaNoticia(fecha);
            n.setUsuario("DSI");
            DBMS.getInstance().agregarNoticia(n);
            request.setAttribute("periodoAbierto", "mensaje");
            return mapping.findForward(SUCCESS);
        }
        else{
            request.setAttribute("fechaInvalida", "error");
            return mapping.findForward(FAILURE);
        }
    }
}
