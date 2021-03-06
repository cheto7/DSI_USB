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
 * @author Azocar
 */
public class registrarUnidadAdscripcion extends org.apache.struts.action.Action {

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

        Usuario nombreUnidad = (Usuario) form;
        Boolean agregado = false;
        Boolean noExiste = false;

        if (nombreUnidad.getNombre().equals("")) { //HACER CHEQUEO DE ESPACIOS EN BLANCO            
            nombreUnidad.setMensaje("El Campo está Vacío. ");
            request.setAttribute("mensajeUsuarioNoEditado", nombreUnidad);
            ArrayList<unidadAdscripcion> unidadAdscripcion = DBMS.getInstance().obtenerUnidadesAdscripcion();
            request.setAttribute("unidadAdscripcion", unidadAdscripcion);
            return mapping.findForward(SUCCESS);
        }   else {
                agregado = DBMS.getInstance().agregarUnidad(nombreUnidad.getNombre());
            }

        Usuario u = new Usuario();
        if (agregado) {            
            u.setMensaje("La Unidad ha sido Registrada. ");
            request.setAttribute("mensajeUsuarioEditado", u);
        }   else {                
                noExiste = DBMS.getInstance().noExisteUnidad(nombreUnidad.getNombre());
                if (noExiste) {
                    u.setMensaje("Algo ha ocurrido y no se pudo Registrar la Unidad. ");                    
                }   else{
                        u.setMensaje("Unidad Ya Registrada. ");
                }
                request.setAttribute("mensajeUsuarioNoEditado", u);
            }
        ArrayList<unidadAdscripcion> unidadAdscripcion = DBMS.getInstance().obtenerUnidadesAdscripcion();
        request.setAttribute("unidadAdscripcion", unidadAdscripcion);
        return mapping.findForward(SUCCESS);
    }
}
