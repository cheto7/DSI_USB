/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipo;

import Clases.Equipo;
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
public class Editar extends Action {
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Equipo e = (Equipo) form;
        DBMS.getInstance().editarEquipo(e);
        request.setAttribute("equipoEditado",e);
        
        return mapping.findForward(SUCCESS);
    }
}
