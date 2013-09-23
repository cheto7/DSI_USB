/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Periodo;
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
public class VerSolicitudRecibida extends org.apache.struts.action.Action {

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
        
        Solicitud s = (Solicitud)form;
        Usuario u = new Usuario();
        Periodo p = DBMS.getInstance().obtenerPeriodo(s);
        
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        ResultSet rs = DBMS.getInstance().verSolicitud(s);
        while (rs.next()) {
            u.setUsuario(rs.getString("usuario"));
            u.setNombre(rs.getString("nombre"));
            u.setApellido(rs.getString("apellido"));
            u.setSexo(rs.getString("sexo"));
            u.setArea_laboral(rs.getString("area_laboral"));
            u.setEmail(rs.getString("email"));
            u.setCi(rs.getString("ci"));
            Solicitud nueva = new Solicitud();
            nueva.setId(rs.getInt("id"));
            nueva.setPeriodo(rs.getInt("id_periodo"));
            nueva.setCantidad(rs.getString("cantidad"));
            nueva.setFecha_solicitud(rs.getString("fecha_solicitud"));
            nueva.setFrecuencia(rs.getString("frecuencia"));
            nueva.setModificada(rs.getString("modificada"));
            nueva.setNombre_vista(rs.getString("nombre_vista"));
            nueva.setTalla(rs.getString("talla"));
            nueva.setSerialEquipo(rs.getInt("serial"));
            solicitudes.add(nueva);
        }
        request.setAttribute("periodo", p);
        request.setAttribute("solicitud", solicitudes);
        request.setAttribute("usuario", u);
        
        return mapping.findForward(SUCCESS);
    }
}
