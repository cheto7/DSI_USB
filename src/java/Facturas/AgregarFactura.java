/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Factura;
import Clases.String_Cheto;
import DBMS.DBMS;
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
public class AgregarFactura extends Action{
    
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Factura fact = (Factura) form;
        boolean agregado = DBMS.getInstance().agregarFactura(fact);
        if(!agregado){
            request.setAttribute("mensajeFactura", new String_Cheto("No pudo ser agregado."));
            return mapping.findForward(FAILURE);
        }
        
        return mapping.findForward(SUCCESS);
        
        
    }
    
}
