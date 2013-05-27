/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entregas;

import Clases.Entregas;
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
public class entregarEquipo extends org.apache.struts.action.Action {

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

        Usuario u = new Usuario();
        String fecha = request.getParameter("fecha_solicitud");
        String idSolicitud = request.getParameter("idSolicitud");
        String s = request.getParameter("serialEquipo");
        String usuario = request.getParameter("usuario");
        String c = request.getParameter("cantidad_entregada");

        int id = Integer.parseInt(idSolicitud);
        int serial = Integer.parseInt(s);
        int cantidad_entregada = Integer.parseInt(c);

        int cantidadTiene = DBMS.getInstance().obtenerCantidadTiene(serial, id);
        int cantidadExistencia = DBMS.getInstance().obtenerCantidadExistencia(idSolicitud, serial);
        
        if (cantidadTiene == 0){
            Boolean agregado = false;
            agregado = DBMS.getInstance().agregarTiene(id, usuario, serial);
        }
            

        int nuevaCantidadT = cantidadTiene + cantidad_entregada;
        int nuevaCantidadE = cantidadExistencia - cantidad_entregada;

        //VERIFICAR QUE cantidad_entrega > 0
        if (nuevaCantidadT > 0) {

            if (nuevaCantidadE >= 0) {
                Boolean resta = DBMS.getInstance().nuevaCantidad(serial, id, nuevaCantidadE, nuevaCantidadT);
                if (resta) {
                    u.setMensaje("Entrega Procesada. ");
                    request.setAttribute("mensajeUsuarioEditado", u);
                } else {
                    u.setMensaje("Algo ha ocurrido y no se pudo Procesar la Entrega. ");
                    request.setAttribute("mensajeUsuarioNoEditado", u);
                }

            } else {
                u.setMensaje("No Existen suficientes equipos. Quedan: "+cantidadExistencia);
                request.setAttribute("mensajeUsuarioNoEditado", u);
            }
        }

        Entregas entregar = new Entregas();
        entregar.setUsuario(usuario);
        entregar.setFecha_solicitud(fecha);
        entregar.setIdSolicitud(idSolicitud);

        ArrayList<Entregas> listaSolicitudes = new ArrayList<Entregas>(0);
        listaSolicitudes.add(entregar);
        ArrayList<Entregas> resto = DBMS.getInstance().consultarRestoSolicitudes(usuario, fecha);
        listaSolicitudes.addAll(resto);
        request.setAttribute("listaSolicitudes", listaSolicitudes);

        ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(id, fecha);
        request.setAttribute("solicitud", solicitudes);


        return mapping.findForward(SUCCESS);
    }
}
