
package Pedido;

import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheo
 */

/*Accion que llama a la clase DBMS.java y elimina un elemento del pedido. */
public class EliminarElem extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();

        Clases.Solicitud s = (Clases.Solicitud) form;
        String loggueado = (String) session.getAttribute("usuarioAutenticado");
        s.setNombre_usuario(loggueado);

        Boolean eliminado = DBMS.getInstance().eliminarSolicitud(s);

        if (eliminado) {          
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}
