
package Pedido;

import Clases.Noticia;
import Clases.Pedido;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author cheo
 */

/* Accion que, dado un pedido y un usuario, almacena esos datos
 * como una nueva solicitud en la base de datos. */
public class Almacenar_solicitud extends DispatchAction {

    private static final String PAGE = "page";
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
    public ActionForward save(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();

        Pedido p = (Pedido) form;
        Boolean agregado = DBMS.getInstance().agregarSolicitud(p);

        Usuario u = new Usuario();
        u.setUsuario(p.getUsuario());
        u = DBMS.getInstance().atributosUsuario(u);

        if (agregado) {
            u.setMensaje("Su solicitud ha sido procesada exitósamente. ");
            request.setAttribute("mensajePedidoAceptado", u);
        } else {
            u.setMensaje("Todos los materiales seleccionados ya fueron solicitados anteriormente. ");
            request.setAttribute("mensajePedidoRechazado",u);
        }

        return mapping.findForward(SUCCESS);
    }

    public ActionForward page(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(PAGE);
    }
}