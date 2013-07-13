/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuarios;

import Clases.Mensaje;
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
public class FormularioVerMensaje extends Action{
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Mensaje m = (Mensaje) form;
        request.setAttribute("mensaje", m);
        return mapping.findForward(SUCCESS);
    }
}
