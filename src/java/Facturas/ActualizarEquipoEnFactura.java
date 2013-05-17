/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Facturado;
import Clases.Solicitud;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheto
 */
public class ActualizarEquipoEnFactura extends Action{
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
        
        Facturado f = (Facturado) form;
        
        if (f.getCantidad()==0){
            request.setAttribute("cantidadNula", "error");
            request.setAttribute("facturado", f);
            return mapping.findForward(FAILURE);
        }
        //f.setCantidad(Integer.parseInt(f.getCantidadString()));
        request.setAttribute("facturado", f);
        DBMS.getInstance().modificarEquipoFactura(f);        
        
        return mapping.findForward(SUCCESS);
    }
}
