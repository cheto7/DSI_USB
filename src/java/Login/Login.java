
package Login;

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
import org.apache.struts.chain.contexts.ActionContext;
import org.apache.struts.chain.contexts.ServletActionContext;

/**
 *
 * @author andreth
 * Modificado por Azocar
 */

/*Accion que consulta el usuario y el login en la base de datos para darle
 * o no acceso a la pagina de inicio la cual varia dependiendo
 * del usuario que accede al sistema. */
public class Login extends org.apache.struts.action.Action {

    private final String ADMINISTRADOR = "administrador";
    private final String SUPERVISOR = "supervisor";
    private final String INSPECTOR = "inspector";
    private final String HABILITADO = "habilitado";
    private final String NO_HABILITADO = "no_habilitado";
    private final String FAILURE = "failure";

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

        ArrayList<Noticia> noticias = DBMS.getInstance().obtenerNoticias();
        request.setAttribute("informacion", noticias);
        Usuario u = (Usuario) form;
        
        if (DBMS.getInstance().consultarUsuario(u)) {
            u = DBMS.getInstance().atributosUsuario(u);

            HttpSession session = request.getSession();
            Boolean sesionIniciada = true;

            /*le colocamos al session ciertos atributos
             1- usuarioAutenticado -> string del nombre de usuario
             2- autenticado -> usuario autenticado
             3- sesion Iniciada -> booleano que permitira la entrada
             a la aplicacion si se ha iniciado
             sesion. */
            session.setAttribute("usuarioAutenticado", u.getUsuario());
            session.setAttribute("usuarioAdministrador", u.getAdministrador());
            session.setAttribute("autenticado", u);
            session.setAttribute("sesionIniciada", sesionIniciada);

            
            if (u.getAdministrador().equals("administrador")) /* el usuario es el administrador del sistema. */
                return mapping.findForward(ADMINISTRADOR);

            if (u.getAdministrador().equals("supervisor")) /* el usuario es un Supervisor. */
                return mapping.findForward(SUPERVISOR);
            
            if (u.getAdministrador().equals("inspector")) /* el usuario es un Inspector. */
                return mapping.findForward(INSPECTOR);
            
            else if (u.getHabilitado() == null  /*el usuario esta deshabilitado. */
                        || u.getHabilitado().equals("false"))
                return mapping.findForward(NO_HABILITADO);                
            
            else if (u.getHabilitado() != null  /* el usuario esta habilitado. */
                        && u.getHabilitado().equals("true")) {
                    return mapping.findForward(HABILITADO);
            }
            
            return mapping.findForward(FAILURE);
                                                    
        } else { /*Casos en el que todo falla (no esta en la BD)*/
            u.setMensaje("Clave o nombre de usuario incorrecta. ");
            request.setAttribute("mensaje",u);
            return mapping.findForward(FAILURE);
        }
    }
}