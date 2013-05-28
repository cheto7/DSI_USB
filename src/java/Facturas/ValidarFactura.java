/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Factura;
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
public class ValidarFactura extends Action {
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Factura f = (Factura) form;
        request.setAttribute("factura", f);
        return mapping.findForward(SUCCESS);
    }
}
