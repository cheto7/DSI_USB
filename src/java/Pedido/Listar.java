
package Pedido;

import Clases.Usuario;
import DBMS.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author smaf
 */
public class Listar extends org.apache.struts.action.Action {

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

        String autenticado = (String) session.getAttribute("usuarioAutenticado");
        Usuario u = new Usuario();
        u.setUsuario(autenticado);
        u = DBMS.getInstance().atributosUsuario(u);

        ArrayList<Clases.Solicitud> solicitudes = DBMS.getInstance().obtenerSolicitudes(u);
        request.setAttribute("solicitudes",solicitudes);

        return mapping.findForward(SUCCESS);
    }
}
