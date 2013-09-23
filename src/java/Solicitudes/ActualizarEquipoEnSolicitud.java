/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Solicitud;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ivan
 */
public class ActualizarEquipoEnSolicitud extends org.apache.struts.action.Action {

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
        
        Solicitud s = new Solicitud();
        Usuario u = new Usuario();
        u.setUsuario(request.getParameter("usuario"));
        s.setId(Integer.parseInt(request.getParameter("id")));
        s.setCantidad(request.getParameter("cantidad"));
        s.setFrecuencia(request.getParameter("frecuencia"));
        s.setNombre_vista(request.getParameter("nombre_vista"));
        s.setTalla(request.getParameter("talla"));
        s.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
        s.setSerialEquipo(Integer.parseInt(request.getParameter("serialEquipo")));
        System.out.println("tallaaa: "+s.getTalla());
        if (!s.getCantidad().matches("[1-9][0-9]*")){
            request.setAttribute("cantidadNula", "error");
            request.setAttribute("solicitud", s);
            request.setAttribute("usuario", u);
            return mapping.findForward(FAILURE);
        }
        request.setAttribute("solicitud", s);
        request.setAttribute("usuario", u);
        DBMS.getInstance().modificarEnContiene(s);
        ArrayList<Solicitud> solicitudes = DBMS.getInstance().obtenerSolicitudUsuario(u, s);
        request.setAttribute("solicitud", solicitudes);        
        
        return mapping.findForward(SUCCESS);
    }
}
