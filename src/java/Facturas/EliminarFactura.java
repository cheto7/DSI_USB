/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Factura;
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
public class EliminarFactura extends Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Factura f = (Factura) form;
        
        
        boolean elim = DBMS.getInstance().eliminarFactura(f.getNumero_factura());
        
        if(!elim){
            request.setAttribute("no_eliminado", "no_eliminado");
        }
        
        request.setAttribute("eliminado", "eliminado");
        return mapping.findForward(SUCCESS);
        
        
    }
    
}
