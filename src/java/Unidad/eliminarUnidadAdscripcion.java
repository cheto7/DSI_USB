/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Unidad;

import Clases.unidadAdscripcion;
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
 * @author Azocar
 */
public class eliminarUnidadAdscripcion extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
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
                
        String idUnidad = request.getParameter("id");
        Boolean eliminado = DBMS.getInstance().eliminarUnidad(idUnidad);

        ArrayList<unidadAdscripcion> unidadAdscripcion = DBMS.getInstance().obtenerUnidadesAdscripcion();
        request.setAttribute("unidadAdscripcion", unidadAdscripcion);
        
        if (eliminado) {
            Usuario u = new Usuario();
            u.setMensaje("La Unidad ha sido Eliminada. ");
            request.setAttribute("mensajeUsuarioEditado", u);
        } else {
            Usuario u = new Usuario();
            u.setMensaje("Algo ha ocurrido y no se pudo Eliminar la Unidad. ");
            request.setAttribute("mensajeUsuarioNoEditado", u);
        }
        
        return mapping.findForward(SUCCESS);
    }
}
