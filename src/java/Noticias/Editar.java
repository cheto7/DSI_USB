/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Noticias;

import Clases.Noticia;
import Clases.Usuario;
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
public class Editar extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Noticia n = (Noticia) form;
        DBMS.getInstance().editarNoticia(n);
        Usuario not = new Usuario();
        not.setMensaje("La noticia ");
        request.setAttribute("mensajeNoticiaEditada",not);
        request.setAttribute("editada",n);
        
        return mapping.findForward(SUCCESS);
    }
}
