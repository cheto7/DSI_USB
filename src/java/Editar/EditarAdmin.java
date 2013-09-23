/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Editar;

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
public class EditarAdmin extends org.apache.struts.action.Action {

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
        
        Usuario u = new Usuario();
        u.setUsuario(request.getParameter("usuario"));
        u.setCi(request.getParameter("ci"));
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
  
        ArrayList<unidadAdscripcion> select = DBMS.getInstance().obtenerUnidadesAdscripcion();
        request.setAttribute("select", select);     
        request.setAttribute("Usuario", u);
        /*
         * Verificacion de campos obligatorios vacios
         */
        if (!u.getNombre().matches("[a-zA-Z]+\\s?[a-zA-Z]*")) {
            u.setMensaje("Debe introducir sus nombres correctamente.");
            return mapping.findForward(FAILURE);
        }
        if (!u.getApellido().matches("[a-zA-Z]+\\s?[a-zA-Z]*")) {
            u.setMensaje("Debe introducir sus apellidos correctamente.");
            return mapping.findForward(FAILURE);
        }    
        if (u.getFecha().equals("")) {
            u.setMensaje("Debe introducir su fecha de ingreso a la USB.");
            return mapping.findForward(FAILURE);
        }
        if (u.getUnidad_adscripcion().equals("")) {
            u.setMensaje("Debe introducir su unidad de adscrición.");
            return mapping.findForward(FAILURE);
        }
        if (u.getArea_laboral().equals("")) {
            u.setMensaje("Debe seleccionar su área laboral.");
            return mapping.findForward(FAILURE);
        }
        
        /*
         * Verifica que la fecha de ingreso no sea posterior a la fecha actual
         */
        java.util.Date date = new java.util.Date(); 
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yy");
        String fecha = sdf.format(date);
        String [] actual = fecha.split("-");
                System.out.println("fechaa de ingreso: "+u.getFecha());
        System.out.println("fechaa de actual: "+fecha);
        
        String [] ingreso = u.getFecha().split("/");
        
        if (Integer.parseInt(ingreso[2])>Integer.parseInt(actual[2])){
            u.setMensaje("La fecha de ingreso debe ser anterior a la fecha actual.");
            return mapping.findForward(FAILURE);
        }
        if ((Integer.parseInt(ingreso[1])>Integer.parseInt(actual[1])) && 
            Integer.parseInt(ingreso[2])>=Integer.parseInt(actual[2])){
            u.setMensaje("La fecha de ingreso debe ser anterior a la fecha actual.");
            return mapping.findForward(FAILURE);
        }
        if ((Integer.parseInt(ingreso[0])>Integer.parseInt(actual[0])) && 
            Integer.parseInt(ingreso[2])>=Integer.parseInt(actual[2]) &&
            Integer.parseInt(ingreso[1])>=Integer.parseInt(actual[1])){
            u.setMensaje("La fecha de ingreso debe ser anterior a la fecha actual.");
            return mapping.findForward(FAILURE);
        }        
      

        DBMS.getInstance().modificarUsuarioAdmin(u);
        request.setAttribute("Usuario", u);
        request.setAttribute("autenticado", request.getParameter("autenticado"));
        
        return mapping.findForward(SUCCESS);
    }
}
