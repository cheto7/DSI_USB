
package Pedido;

import Clases.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheo
 */

/*Accion que lleva a la pagina de realizar solicitud. */
public class Solicitud extends org.apache.struts.action.Action {

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
        
        Usuario u = (Usuario) form;
        if (DBMS.DBMS.getInstance().consultarUsuario(u)) {
            u = DBMS.DBMS.getInstance().atributosUsuario(u);
            request.setAttribute("autenticado",u);
            return mapping.findForward(SUCCESS);
        }else {
            return mapping.findForward(FAILURE);
        }
    }
}