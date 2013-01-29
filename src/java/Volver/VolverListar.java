
package Volver;

/**
 *
 * @author cheo
 */
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class VolverListar extends org.apache.struts.action.Action {

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

        Usuario u = (Usuario) form;
        u = DBMS.getInstance().atributosUsuario(u);
        request.setAttribute("usuario", u);
        
        ArrayList<Usuario> usuariosHab = DBMS.getInstance().consultarUsuariosHabilitados(u);
        request.setAttribute("usuariosHab", usuariosHab);

        ArrayList<Usuario> usuariosNoHab = DBMS.getInstance().consultarUsuariosNoHabilitados(u);
        request.setAttribute("usuariosNoHab", usuariosNoHab);

        u = DBMS.getInstance().atributosUsuario(u);
        request.setAttribute("autenticado", u);

        return mapping.findForward(SUCCESS);
    }
}