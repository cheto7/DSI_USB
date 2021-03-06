/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Unidad;

import Clases.Usuario;
import Clases.unidadAdscripcion;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author daniel
 */
public class editarUnidad extends org.apache.struts.action.Action {

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
        unidadAdscripcion editar = new unidadAdscripcion();
        Usuario u = new Usuario();

        editar.setId(request.getParameter("id"));
        editar.setNombre(request.getParameter("nombre"));
        
        if (editar.getNombre().equals("")){
            u.setMensaje("Debe llenar el nombre de la unidad. ");
            request.setAttribute("mensajeUsuarioNoEditado", u);
            ArrayList<unidadAdscripcion> listaUnidades = DBMS.getInstance().obtenerUnidadesAdscripcion();
            request.setAttribute("unidadAdscripcion", listaUnidades);
            return mapping.findForward(SUCCESS);
        }
        
        Boolean modificado = DBMS.getInstance().editarUnidad(editar);

        if (modificado) {
            u.setMensaje("La Unidad ha sido Modificada. ");
            request.setAttribute("mensajeUsuarioEditado", u);
        } else {
            u.setMensaje("La unidad ya ha sido registrada previamente. ");
            request.setAttribute("mensajeUsuarioNoEditado", u);
        }
        ArrayList<unidadAdscripcion> listaUnidades = DBMS.getInstance().obtenerUnidadesAdscripcion();
        request.setAttribute("unidadAdscripcion", listaUnidades);
        return mapping.findForward(SUCCESS);
    }
}
