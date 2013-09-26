/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Equipo;
import Clases.Solicitud;
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
 * @author ivan
 */
public class ListarEquiposSolicitud extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
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

        String usuario = request.getParameter("nombre_usuario"); //En caso de solicitar por Otro

        if (usuario == null) {
            HttpSession session = request.getSession();
            usuario = (String) session.getAttribute("usuarioAutenticado");
        }
        
        Usuario u = new Usuario();
        u.setUsuario(usuario);
        u = DBMS.getInstance().atributosUsuario(u);

        /*
         * Aqui se debe preguntar por el TIPO DE USUARIO para saber que equipos
         * se van a listar
         */
        Solicitud solicitud = DBMS.getInstance().agregarASolicitud(u);
        if (solicitud == null) {
            request.setAttribute("periodoCerrado", "error");
            return mapping.findForward(FAILURE);
        }
        ArrayList<Equipo> equiposAcad = DBMS.getInstance().obtenerEquiposSolicitudAcademico(u);
        ArrayList<Equipo> equiposAdmin = DBMS.getInstance().obtenerEquiposSolicitudAdmin(u);
        ArrayList<Equipo> equiposBomb = DBMS.getInstance().obtenerEquiposSolicitudBombero(u);
        ArrayList<Equipo> equiposObrero = DBMS.getInstance().obtenerEquiposSolicitudObrero(u);
        ArrayList<Equipo> equiposGen = DBMS.getInstance().obtenerEquiposSolicitudGenerico(u);
        request.setAttribute("equiposAcad", equiposAcad);
        request.setAttribute("equiposAdmin", equiposAdmin);
        request.setAttribute("equiposBomb", equiposBomb);
        request.setAttribute("equiposObrero", equiposObrero);
        request.setAttribute("equiposGen", equiposGen);
        request.setAttribute("solicitud", solicitud);
        request.setAttribute("usuarioOtro", solicitud);
        return mapping.findForward(SUCCESS);
    }
}
