
package Noticias;

import Clases.Noticia;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author smaf
 */
public class AgregarNoticia extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Noticia n = (Noticia) form;
        
        if(n.getTitulo().equals("") || n.getContenido().equals("")) {
            Usuario u = new Usuario();
            u.setMensaje("No puede dejar los campos vacios. ");
            request.setAttribute("noticiaNula",u);
            return mapping.findForward(FAILURE);
        }
        
        Boolean agregada = DBMS.getInstance().agregarNoticia(n);
        if (agregada) {
            ArrayList<Noticia> noticias = DBMS.getInstance().obtenerNoticias();
            request.setAttribute("informacion", noticias);
            
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}