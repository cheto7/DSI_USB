
package Editar;

import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import DBMS.*;

/**
 *
 * @author cheo
 */

/*Accion que busca los atributos del usuario, los envia a la vista de
 * modificacion y coloca cada atributo en el rubro correspondiente del
 * form. */
public class FormularioEditarUsuario extends org.apache.struts.action.Action {

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
            request.setAttribute("Usuario", u);

            return mapping.findForward(SUCCESS);
    }
}