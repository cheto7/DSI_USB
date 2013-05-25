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
public class IrValidarFactura extends Action{
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        System.out.println("HOLAAAAAAAAAAAAAAAA");
        
        Factura f = (Factura) form;
        System.out.println("factura es: "+f.getNumero_factura());
        DBMS.getInstance().validarFactura(f);
        return mapping.findForward(SUCCESS);
    }
}
