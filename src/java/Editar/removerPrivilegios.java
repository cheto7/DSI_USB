
package Editar;

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
 * @author azocar
 */
public class removerPrivilegios extends org.apache.struts.action.Action {

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
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        HttpSession session = request.getSession();

        Usuario u = (Usuario) form;
        Boolean sinPrivilegio = DBMS.getInstance().removerPrivilegios(u);

        if (sinPrivilegio) {       
        String loggueado = (String) session.getAttribute("usuarioAutenticado");
        Usuario autenticado = new Usuario();
        autenticado.setUsuario(loggueado);

        ArrayList<Usuario> usuariosHab = DBMS.getInstance().consultarUsuariosSinPermisos();
        request.setAttribute("usuariosHab", usuariosHab);

        ArrayList<Usuario> supervisores = DBMS.getInstance().consultarSupervisores();
        request.setAttribute("supervisores", supervisores);

        ArrayList<Usuario> inspectores = DBMS.getInstance().consultarInspectores();
        request.setAttribute("inspectores", inspectores);

            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}