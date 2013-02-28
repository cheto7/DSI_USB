/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Solicitud;
import Clases.Usuario;
import DBMS.DBMS;
import java.sql.ResultSet;
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
public class EliminarEquipoEnSolicitudAdmin extends org.apache.struts.action.Action {

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
        String usuario = request.getParameter("usuario");
        String fecha_solicitud = request.getParameter("fecha_solicitud");
        String serialEquipo = request.getParameter("serialEquipo");
        
        u.setUsuario(usuario);
        s.setId(Integer.parseInt(idSolicitud));
        s.setFecha_solicitud(fecha_solicitud);
        s.setSerialEquipo(Integer.parseInt(serialEquipo));
        DBMS.getInstance().EliminarEquipoEnSolicitud(s);
        
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        ResultSet rs = DBMS.getInstance().verSolicitud(s);
        while (rs.next()) {
            u.setUsuario(rs.getString("usuario"));
            u.setNombre(rs.getString("nombre"));
            u.setApellido(rs.getString("apellido"));
            u.setSexo(rs.getString("sexo"));
            u.setArea_laboral(rs.getString("area_laboral"));
            u.setEmail(rs.getString("email"));
            Solicitud nueva = new Solicitud();
            nueva.setId(rs.getInt("id"));
            nueva.setCantidad(rs.getString("cantidad"));
            nueva.setFecha_solicitud(rs.getString("fecha_solicitud"));
            nueva.setFrecuencia(rs.getString("frecuencia"));
            nueva.setModificada(rs.getString("modificada"));
            nueva.setNombre_vista(rs.getString("nombre_vista"));
            nueva.setTalla(rs.getString("talla"));
            nueva.setSerialEquipo(rs.getInt("serial"));
            solicitudes.add(nueva);
        }
       
        request.setAttribute("solicitud", solicitudes);
        request.setAttribute("usuario", u);
        return mapping.findForward(SUCCESS);
    }
}
