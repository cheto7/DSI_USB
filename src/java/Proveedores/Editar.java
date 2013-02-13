/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Proveedores;

import Clases.Proveedor;
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
public class Editar extends org.apache.struts.action.Action {

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
        
        Proveedor p = (Proveedor) form;
        if (p.getRif()==""){
            request.setAttribute("proveedor", p);
            request.setAttribute("mensajeProveedorRif", "error");
            return mapping.findForward(FAILURE);
        }
        else if (p.getNombre()==""){
            request.setAttribute("proveedor", p);
            request.setAttribute("mensajeProveedorNombre", "error");
            return mapping.findForward(FAILURE);
        }
        DBMS.getInstance().editarProveedor(p);
        request.setAttribute("mensajeProveedorEditado","editado");
        
        return mapping.findForward(SUCCESS);
    }
}
