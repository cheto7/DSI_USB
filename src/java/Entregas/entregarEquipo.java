/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entregas;

import Clases.Entregas;
import Clases.Periodo;
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
        Solicitud sol = new Solicitud();
        
        sol.setNombre_vista(request.getParameter("nombre_vista"));//cedula
        sol.setTalla("talla"); // unidad de adscripcion
        sol.setNombre_usuario("nombre_usuario"); //nombre dle usuario
        
        String s = request.getParameter("serialEquipo");
        String usuario = request.getParameter("usuario");        
        String fecha = request.getParameter("fecha_solicitud");
        String idSolicitud = request.getParameter("idSolicitud");
        String c = request.getParameter("cantidad_entregada");
        Periodo p = new Periodo();
        p.setFecha_inicio(request.getParameter("fecha_inicio"));
        p.setFecha_fin(request.getParameter("fecha_fin"));
        request.setAttribute("periodos", p);
        int id = Integer.parseInt(idSolicitud);
        int serial = Integer.parseInt(s);
        
        //Chequeo del formulario
        // solo debe tener números
        if (c.matches("[1-9][0-9]*")==false){
            ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(id);
            request.setAttribute("id", idSolicitud);
            request.setAttribute("fecha_solicitud", fecha);
            request.setAttribute("errorFormulario", "error");
            request.setAttribute("solicitud", solicitudes);
            return mapping.findForward(SUCCESS);            
        }
        
        int cantidad_entregada = Integer.parseInt(c);
               

        System.out.println("fecha: " +fecha + "\n" +
                           "idSolicitud: "+ idSolicitud+"\n"+
                           "SerialEquipo: "+ s + "\n"+
                           "usuario: " + usuario +"\n"+
                           "CantidadEntregada: "+ c +"\n");

        
        int cantidadTiene = DBMS.getInstance().obtenerCantidadTiene(serial, id);
        int cantidadExistencia = DBMS.getInstance().obtenerCantidadExistencia(idSolicitud, serial);
        
        System.out.println("CantidadTiene en base de datos: "+cantidadTiene + "\n" +
                            "CantidadExistencia del equipo: "+ cantidadExistencia);
        
        if (cantidadExistencia == -1){
            ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(id);
            request.setAttribute("id", idSolicitud);
            request.setAttribute("fecha_solicitud", fecha);
            request.setAttribute("noHayEquipo", "error");
            request.setAttribute("solicitud", solicitudes);
            return mapping.findForward(SUCCESS);
        }

        if (cantidadTiene == 0){
            DBMS.getInstance().agregarTiene(id, usuario, serial);
        }

        int nuevaCantidadT = cantidadTiene + cantidad_entregada;
        int nuevaCantidadE = cantidadExistencia - cantidad_entregada;

        if (nuevaCantidadE >= 0) {
            Boolean resta = DBMS.getInstance().nuevaCantidad(serial, id, nuevaCantidadE, nuevaCantidadT);
            if (resta) {
                u.setMensaje("Entrega Procesada. ");
                request.setAttribute("mensajeUsuarioEditado", u);
            } else {
                u.setMensaje("Algo ha ocurrido y no se pudo procesar la entrega. ");
                request.setAttribute("mensajeUsuarioNoEditado", u);
            }

        } else {
            u.setMensaje("No Existen suficientes equipos. Quedan: " + cantidadExistencia);
            request.setAttribute("mensajeUsuarioNoEditado", u);
        }

        request.setAttribute("id", idSolicitud);
        request.setAttribute("fecha_solicitud", fecha);
        
        ArrayList<Entregas> solicitudes = DBMS.getInstance().obtenerSolicitud(id);        
        request.setAttribute("solicitud", solicitudes);
        request.setAttribute("Solicitud", sol);
        
        return mapping.findForward(SUCCESS);
    }
}