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
    private static final String FAILURE = "failure";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Equipo e = (Equipo) form;
        if ("".equals(e.getNombre_vista())) {
            request.setAttribute("errorNombreEquipo", "error");
            request.setAttribute("equipo", e);
            return mapping.findForward(FAILURE);
        }
        if (e.getTipo().equals("")) {
            request.setAttribute("errorTipoEquipo", "error");
            request.setAttribute("equipo", e);
            return mapping.findForward(FAILURE);
        }
        if (e.getFuncionalidad().equals("<br>")) {
            request.setAttribute("errorFuncionalidadEquipo", "error");
            request.setAttribute("equipo", e);
            return mapping.findForward(FAILURE);
        }
        if (e.getVida_util().equals("") || e.getVida_util().equals("0") || e.getTalla().equals("")) {
            request.setAttribute("errorVidaUtil", "error");
            request.setAttribute("equipo", e);
            return mapping.findForward(FAILURE);
        }
        
        
        
        DBMS.getInstance().editarEquipo(e);
        request.setAttribute("equipoEditado",e);
        
        return mapping.findForward(SUCCESS);
    }
}
