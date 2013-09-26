/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Equipo;
import Clases.Solicitud;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ivan
 */
public class AgregarEquipoASolicitud extends org.apache.struts.action.Action {

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
        
        Equipo equipo = new Equipo();
        Solicitud solicitud = new Solicitud();
        
        String serial = request.getParameter("serial");
        String id = request.getParameter("id");
        String idPeriodo = request.getParameter("periodo");
        String ttalla = request.getParameter("tipo_talla");
        String frecuencia = request.getParameter("frecuencia");
        String cantidad = request.getParameter("cantidad");
        String usuario = request.getParameter("nombre_usuario"); //En caso de solicitar por Otro
        
        if(usuario == null)
            usuario = request.getParameter("usuario");
        
        System.out.println("usuariooooooooooooooo: "+usuario);
        
        if (!cantidad.matches("[1-9][0-9]*")){ // Intenta pedir Cero unidades de algun EPP u otra cosa
            request.setAttribute("errorCantidad", "error");
            return mapping.findForward(SUCCESS);
        }
        
        solicitud.setId(Integer.parseInt(id));
        solicitud.setPeriodo(Integer.parseInt(idPeriodo));
        solicitud.setNombre_usuario(usuario);
        equipo.setSerial(Integer.parseInt(serial));
        equipo.setTipo_talla(ttalla);
        DBMS.getInstance().agregarAContiene(equipo,solicitud,frecuencia,cantidad);
        request.setAttribute("usuarioOtro", solicitud);
        return mapping.findForward(SUCCESS);
    }
}
