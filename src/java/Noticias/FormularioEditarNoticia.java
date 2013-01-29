package Noticias;

import Clases.Noticia;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author smaf
 */
public class FormularioEditarNoticia extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Noticia noticia = (Noticia) form;
        noticia.setTituloAnterior(noticia.getTitulo());
        request.setAttribute("noticia",noticia);
        return mapping.findForward(SUCCESS);
    }
}
