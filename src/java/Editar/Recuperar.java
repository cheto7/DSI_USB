/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Editar;

import Clases.Contrasena;
import Clases.Email;
import Clases.Mail;
import Clases.Usuario;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author karen
 */
public class Recuperar extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private Contrasena clave;

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
        
        Email e = (Email) form;
        Usuario u;
        u = new Usuario();
        u.setEmail(e.getEmail());
        
        Boolean existe = DBMS.getInstance().existeEmail(e);
        

        if (existe) {
            clave = new Contrasena();
            u.setPassword(clave.nextSessionId());
            Boolean modificado = DBMS.getInstance().modificarContrasena(u);
            Mail mail= new Mail();
            mail.sendMailClave(u);
            
           
            u.setMensaje("Se ha enviado satisfactoriamente una nueva contraseña");
            request.setAttribute("mensajeUsuarioEditado", u);
            



        } else {
            u.setMensaje("El correo electrónico ingresado no está registrado");
            request.setAttribute("mensajeUsuarioNoEditado", u);


        }
        return mapping.findForward(SUCCESS);

    }
}
