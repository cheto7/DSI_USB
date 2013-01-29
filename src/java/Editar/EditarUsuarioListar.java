
package Editar;

import Clases.Noticia;
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

/*Accion que lleva a la pagina de modificacion de usuario.*/
public class EditarUsuarioListar extends org.apache.struts.action.Action {

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
        Boolean modificado = false;
        
        Usuario u = (Usuario) form;
        modificado = DBMS.getInstance().modificarUsuario(u);
        
        if (modificado) {
            u.setMensaje("Los datos del usuario ");
            request.setAttribute("mensajeUsuarioEditado", u);
        } else {
            u.setMensaje("Algo ha ocurrido y no se pudo modificar los datos. ");
            request.setAttribute("mensajeUsuarioNoEditado", u);
        }

        u = DBMS.getInstance().atributosUsuario(u);
        request.setAttribute("usuario", u);
        return mapping.findForward(SUCCESS);
    }
}