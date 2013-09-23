/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Solicitud;
import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ivan
 */
public class EditarEquipoEnSolicitud extends org.apache.struts.action.Action {

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
        
        Solicitud s = new Solicitud();
        Usuario u = new Usuario();
        u.setUsuario(request.getParameter("usuario"));
        s.setId(Integer.parseInt(request.getParameter("id")));
        s.setCantidad(request.getParameter("cantidad"));
        s.setTalla(request.getParameter("talla"));
        s.setFrecuencia(request.getParameter("frecuencia"));
        s.setSerialEquipo(Integer.parseInt(request.getParameter("serialEquipo")));
        s.setNombre_vista(request.getParameter("nombre_vista"));
        s.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
        request.setAttribute("solicitud", s);
        request.setAttribute("usuario", u);
        
        return mapping.findForward(SUCCESS);
    }
}
