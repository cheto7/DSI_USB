/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Equipo;
import Clases.Factura;
import Clases.String_Cheto;
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
public class FormularioEditarFactura extends Action{
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Factura f = (Factura) form;
     
        ArrayList<Equipo> equipos = DBMS.getInstance().obtenerEquipoFactura(f);
        String_Cheto proveedor = DBMS.getInstance().obtenerProveedor(f);
        request.setAttribute("equipos", equipos);
        request.setAttribute("factura", f);
        request.setAttribute("proveedor", proveedor);
        return mapping.findForward(SUCCESS);
    }
    
}
