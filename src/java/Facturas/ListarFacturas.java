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
        ArrayList<Factura> facturasNoValidadas = DBMS.getInstance().listarFacturasNoValidadas();
        ArrayList<Factura> facturasValidadas = DBMS.getInstance().listarFacturasValidadas();
        if(facturasNoValidadas.isEmpty()){
            request.setAttribute("mensaje","No hay facturas no validadas");
        }
        if(facturasValidadas.isEmpty()){
            request.setAttribute("mensaje","No hay facturas validadas");
        }        
        request.setAttribute("facturasNoValidadas", facturasNoValidadas);
        request.setAttribute("facturasValidadas", facturasValidadas);
        
        return mapping.findForward(SUCCESS);
    }
    
}
