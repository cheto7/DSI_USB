/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Noticias;

import Clases.Noticia;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author smaf
 */
public class Eliminar extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Noticia n = (Noticia) form;
        DBMS.getInstance().eliminarNoticia(n);
        
        return mapping.findForward(SUCCESS);
    }
}
