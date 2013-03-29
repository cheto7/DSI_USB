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
public class editarUnidadAdscripcion extends org.apache.struts.action.Action {

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
        String nombreUnidad = request.getParameter("nombre");
        unidadAdscripcion editar = new unidadAdscripcion();
        
        editar.setId(idUnidad);
        editar.setNombre(nombreUnidad);        

        ArrayList<unidadAdscripcion> listaUnidades = new ArrayList<unidadAdscripcion>(0);
        listaUnidades.add(editar);
        
        ArrayList<unidadAdscripcion> resto = DBMS.getInstance().obtenerRestoUnidades(idUnidad);
        listaUnidades.addAll(resto);
        
        request.setAttribute("unidadAdscripcion", listaUnidades);
        request.setAttribute("editar", "Activado");
        
        
        return mapping.findForward(SUCCESS);
    }
}
