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
public class Confirmar_solicitud extends org.apache.struts.action.Action {

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
        
        Usuario u = new Usuario();
        Solicitud s = new Solicitud();
        String idSolicitud = request.getParameter("id");
        String idPeriodo = request.getParameter("periodo");
        String usuario = request.getParameter("usuario");
        u.setUsuario(usuario);
        s.setId(Integer.parseInt(idSolicitud));
        s.setPeriodo(Integer.parseInt(idPeriodo));
     
        ArrayList<Solicitud> solicitudes = DBMS.getInstance().obtenerSolicitudUsuario(u, s);
        request.setAttribute("solicitud", solicitudes);
        request.setAttribute("usuario", u);
        return mapping.findForward(SUCCESS);
    }
}
