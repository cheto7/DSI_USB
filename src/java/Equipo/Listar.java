/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipo;

import Clases.Equipo;
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
public class Listar extends Action {
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ArrayList<Equipo> equipos = DBMS.getInstance().obtenerEquipos();
        request.setAttribute("equipos", equipos);
        return mapping.findForward(SUCCESS);
        
    }
    
}
