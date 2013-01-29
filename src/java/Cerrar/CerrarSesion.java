
package Cerrar;

import Clases.Noticia;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author cheo
 * Invalida la sesion del usuario autenticado en el momento.
 * 
 */
public class CerrarSesion extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();

        session.invalidate();

        ArrayList<Noticia> noticias = DBMS.getInstance().obtenerNoticias();
        request.setAttribute("informacion", noticias);

        return mapping.findForward(SUCCESS);
    }
}