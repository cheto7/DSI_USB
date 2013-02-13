/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipo;

import Clases.Equipo;
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
public class FormularioEditarEquipo extends Action {
    
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Equipo e = (Equipo) form;
        request.setAttribute("equipo",e);
        return mapping.findForward(SUCCESS);
    }
    
    
}
