/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entregas;

import Clases.Usuario;
import Clases.Entregas;
import Clases.Periodo;
import Clases.Solicitud;
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
 * @author Azpcar
 */
public class listarSolicitantes extends org.apache.struts.action.Action {

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

        String fecha_inicio, fecha_fin;
        Periodo p = new Periodo();
        HttpSession session = request.getSession();
        String loggueado = (String) session.getAttribute("usuarioAutenticado");
        Usuario autenticado = new Usuario();
        autenticado.setUsuario(loggueado);

        if (request.getParameter("fecha_fin")==null) {
            fecha_inicio = request.getParameter("fecha_inicio").split(" al ")[0];
            fecha_fin = request.getParameter("fecha_inicio").split(" al ")[1];
            p.setFecha_inicio(fecha_inicio.substring(4));
            p.setFecha_fin(fecha_fin);
            System.out.print("Fecha iniciooo: +++ "+p.getFecha_inicio());
            System.out.print("Fecha fiiiin: +++ "+p.getFecha_fin());
        } else {
            fecha_inicio = request.getParameter("fecha_inicio");
            fecha_fin = request.getParameter("fecha_fin");
            p.setFecha_inicio(fecha_inicio);
            p.setFecha_fin(fecha_fin);
        }

        ArrayList<Solicitud> solicitudes = DBMS.getInstance().solicitudesDePeriodo(p);
        request.setAttribute("listaSolicitudes", solicitudes);
        request.setAttribute("periodos", p);

        return mapping.findForward(SUCCESS);
    }
}
