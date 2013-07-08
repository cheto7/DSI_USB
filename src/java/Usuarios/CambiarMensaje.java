/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuarios;

import Clases.Mensaje;
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
public class CambiarMensaje extends Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ArrayList<Mensaje> mensajes = DBMS.getInstance().listarMensajes();
        if(mensajes.isEmpty()) 
            request.setAttribute("mensaje","No hay facturas no validadas");
        
        request.setAttribute("mensajes", mensajes);
        
        return mapping.findForward(SUCCESS);
    }
    
}
