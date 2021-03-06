
package Eliminar;

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

/*Accion que llama a la clase DBMS.java y elimina un usuario. */
public class Eliminar extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

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
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();

        Usuario u = (Usuario) form;
        Boolean eliminado = DBMS.getInstance().eliminarUsuario(u);

        if (eliminado) {

            /*Agarra de la sesion el nombre de usuario autenticado */
            String loggueado = (String) session.getAttribute("usuarioAutenticado");
            Usuario autenticado = new Usuario();
            autenticado.setUsuario(loggueado);

            /*Ejecuta de nuevo el codigo de listar usuarios. */
            ArrayList<Usuario> usuariosHab = DBMS.getInstance().consultarUsuariosHabilitados(autenticado);
            request.setAttribute("usuariosHab", usuariosHab);

            ArrayList<Usuario> usuariosNoHab = DBMS.getInstance().consultarUsuariosNoHabilitados(autenticado);
            request.setAttribute("usuariosNoHab", usuariosNoHab);

            autenticado = DBMS.getInstance().atributosUsuario(autenticado);
            request.setAttribute("autenticado", autenticado);

            return mapping.findForward(SUCCESS);
        } else {
            request.setAttribute("usuario", u);
            return mapping.findForward(FAILURE);
        }
    }
}