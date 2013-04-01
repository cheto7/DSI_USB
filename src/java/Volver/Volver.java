
package Volver;

/**
 *
 * @author cheo
 */
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

public class Volver extends org.apache.struts.action.Action {
    

    private static final String ADMINISTRADOR = "administrador";
    private static final String SUPERVISOR = "supervisor";
    private static final String INSPECTOR = "inspector";
    private static final String HABILITADO = "habilitado";
    private static final String NO_HABILITADO = "no_habilitado";
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
        
        String loggueado = (String) session.getAttribute("usuarioAutenticado");
        Usuario autenticado = new Usuario();
        autenticado.setUsuario(loggueado);
        autenticado = DBMS.getInstance().atributosUsuario(autenticado);
        
        ArrayList<Noticia> noticias = DBMS.getInstance().obtenerNoticias();
        request.setAttribute("informacion", noticias);
        
        if (autenticado.getAdministrador().equals("administrador")) 
            return mapping.findForward(ADMINISTRADOR);
        else if (autenticado.getAdministrador().equals("supervisor")) 
            return mapping.findForward(SUPERVISOR); 
        else if (autenticado.getAdministrador().equals("inspector")) 
            return mapping.findForward(INSPECTOR);   

            /*el usuario esta deshabilitado. */
            else if (autenticado.getHabilitado() == null
                    || autenticado.getHabilitado().equals("false")) 
                return mapping.findForward(NO_HABILITADO);
                /* el usuario esta habilitado. */
             else if (autenticado.getHabilitado() != null
                    && autenticado.getHabilitado().equals("true")) {
                return mapping.findForward(HABILITADO);
            } else if (autenticado.getAdministrador().equals("supervisor")) {
                return mapping.findForward(SUPERVISOR);
            }

        return mapping.findForward(FAILURE);
    }
}