/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Equipo;
import Clases.Solicitud;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ivan
 */
public class AgregarEquipoASolicitud extends org.apache.struts.action.Action {

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
        
        Equipo equipo = new Equipo();
        Solicitud solicitud = new Solicitud();
        
        String serial = request.getParameter("serial");
        String id = request.getParameter("id");
        String frecuencia = request.getParameter("frecuencia");
        String cantidad = request.getParameter("cantidad");
        System.out.println("cantidaaaaaaaaaaaad"+cantidad);
        
        System.out.println("entraaaaaaaaaaaaa AgregarEquipoASolicitud.java");
        System.out.println(serial);
        System.out.println(id);
        
        if ("0".equals(cantidad)){
            request.setAttribute("errorCantidad", "error");
            System.out.println("entraaaaaaaaaaaaa igual a ceroooo");
            return mapping.findForward(SUCCESS);
        }
        
        
        solicitud.setId(Integer.parseInt(id));
        equipo.setSerial(Integer.parseInt(serial));
        DBMS.getInstance().agregarAContiene(equipo,solicitud,frecuencia,cantidad);
        
        //request.setAttribute("solicitud",solicitud);
        return mapping.findForward(SUCCESS);
    }
}
