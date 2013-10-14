/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entregas;

import Clases.Entregas;
import Clases.Periodo;
import Clases.Usuario;
import DBMS.DBMS;
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

//        Solicitud s = new Solicitud();
//        s.setNombre_vista(request.getParameter("nombre_vista"));//cedula
//        s.setTalla("talla"); // unidad de adscripcion
//        s.setNombre_usuario("nombre_usuario"); //nombre dle usuario
        
        String idSolicitud = request.getParameter("id");
        Periodo p = new Periodo();
        p.setFecha_inicio(request.getParameter("fecha_inicio"));
        p.setFecha_fin(request.getParameter("fecha_fin"));
        System.out.println("FechaINI: "+p.getFecha_inicio());
        System.out.println("FechaFIN: "+p.getFecha_fin());
        int id = Integer.parseInt(idSolicitud);
//        String fecha = request.getParameter("fecha_solicitud"); 

        ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(id);
        request.setAttribute("solicitud", solicitudes);
        request.setAttribute("periodos", p);
        //request.setAttribute("usuario", s);

        return mapping.findForward(SUCCESS);
    }
}
