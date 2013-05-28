/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.Equipo;
import Clases.String_Cheto;
import Clases.Usuario;
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
public class EvaluarEquipos extends Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Usuario u = (Usuario) form;
     
        ArrayList<Equipo> equipos = DBMS.getInstance().obtenerEquiposPuntuacionUsuario(u);
        request.setAttribute("equipos", equipos);
        return mapping.findForward(SUCCESS);
    }
}
