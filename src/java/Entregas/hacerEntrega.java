/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entregas;

import Clases.Entregas;
import Clases.Usuario;
import DBMS.DBMS;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author daniel
 */
public class hacerEntrega extends org.apache.struts.action.Action {

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

        HttpSession session = request.getSession();
        String loggueado = (String) session.getAttribute("usuarioAutenticado");
        Usuario autenticado = new Usuario();
        autenticado.setUsuario(loggueado);

        String idSolicitud = request.getParameter("idSolicitud");
        int id = Integer.parseInt(idSolicitud);
        String usuario = request.getParameter("usuario");
        String fecha = request.getParameter("fecha_solicitud");

        Entregas entregar = new Entregas();
        entregar.setUsuario(usuario);
        entregar.setFecha_solicitud(fecha);
        entregar.setIdSolicitud(idSolicitud);

        ArrayList<Entregas> listaSolicitudes = new ArrayList<Entregas>(0);
        listaSolicitudes.add(entregar);
        ArrayList<Entregas> resto = DBMS.getInstance().consultarRestoSolicitudes(usuario, fecha);
        listaSolicitudes.addAll(resto);
        request.setAttribute("listaSolicitudes", listaSolicitudes);
        request.setAttribute("entregar", "Activado");
  

        ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(id,fecha);        
        request.setAttribute("solicitud", solicitudes);


        return mapping.findForward(SUCCESS);
    }
}
