/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Factura;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheto
 */
public class ListarFacturas extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ArrayList<Factura> facturas = DBMS.getInstance().listarFacturas();
        if(facturas.isEmpty()) 
            request.setAttribute("mensaje","No hay facturas no validadas");
        
        request.setAttribute("facturas", facturas);
        
        return mapping.findForward(SUCCESS);
    }
    
}
