/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Solicitudes;

import Clases.ListadoGeneral;
import Clases.String_Cheto;
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
public class Consulta extends Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ListadoGeneral lg = (ListadoGeneral) form;
        
        ArrayList < ArrayList <String_Cheto> > arr = DBMS.DBMS.getInstance().consultarSolicitudes(lg);
        request.setAttribute("ConSol", arr);
        return mapping.findForward(SUCCESS);
        
    }
    
}
