/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Solicitud;
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
public class ListarSolicitudes extends org.apache.struts.action.Action {

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
        
        ArrayList<Solicitud> solModificadas = DBMS.getInstance().obtenerSolicitudesModificadas();
        ArrayList<Solicitud> solNoModificadas = DBMS.getInstance().obtenerSolicitudesNoModificadas();
        if (solModificadas.isEmpty()){
            request.setAttribute("noHayModificadas", "mensaje");
        }
        if (solNoModificadas.isEmpty()){
            request.setAttribute("noHayNoModificadas", "mensaje");
        }        
        request.setAttribute("solModificadas", solModificadas);
        request.setAttribute("solNoModificadas", solNoModificadas);
        return mapping.findForward(SUCCESS);
    }
}
