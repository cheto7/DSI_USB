/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuarios;

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
 * @author ivan
 */
public class VerDatosDeUsuario extends org.apache.struts.action.Action {

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
        u.setUsuario(request.getParameter("usuario"));
        u.setPassword(request.getParameter("password"));
        u.setTelefono(request.getParameter("telefono"));
        u.setNombre(request.getParameter("nombre"));
        u.setApellido(request.getParameter("apellido"));
        u.setEmail(request.getParameter("email"));
        u.setFecha(request.getParameter("fecha"));
        u.setSexo(request.getParameter("sexo"));
        u.setTalla_mascara(request.getParameter("talla_mascara"));
        u.setTalla_camisa(request.getParameter("talla_camisa"));
        u.setTalla_pantalon(request.getParameter("talla_pantalon"));
        u.setTalla_guantes(request.getParameter("talla_guantes"));
        u.setTalla_zapato(request.getParameter("talla_zapato"));
        u.setHabilitado(request.getParameter("habilitado"));
        u.setAdministrador(request.getParameter("administrador"));
        u.setArea_laboral(request.getParameter("area_laboral"));
        u.setUnidad_adscripcion(request.getParameter("unidad_adscripcion"));
        

        if (u.getHabilitado().equals("true")) {
            request.setAttribute("usuarioHabilitado", "mensaje");
        } else {
            request.setAttribute("usuarioDeshabilitado", "mensaje");
        }
        
        if (u.getAdministrador().equals("usuario")){
            request.setAttribute("usuarioUsuario", "mensaje");
        }
        else if (u.getAdministrador().equals("supervisor")){
            request.setAttribute("usuarioSupervisor", "mensaje");
        }
        else if (u.getAdministrador().equals("inspector")){
            request.setAttribute("usuarioInspector", "mensaje");
        }
        else{
            request.setAttribute("usuarioAdministrador", "mensaje");
        }
       
        request.setAttribute("Usuario", u);
        request.setAttribute("autenticado", request.getParameter("autenticado"));
        
        return mapping.findForward(SUCCESS);
    }
}
