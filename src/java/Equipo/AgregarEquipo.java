/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipo;

import Clases.Equipo;
import Clases.Noticia;
import Clases.UploadFile;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheto
 */
public class AgregarEquipo extends org.apache.struts.action.Action {
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Equipo e = (Equipo) form;
        e.setImagen(e.getFile().getAbsolutePath());
        if(e.getFuncionalidad().equals("") || e.getImagen().equals("")
                 || e.getNombre_vista().equals("") || e.getTipo().equals("")) {
            Usuario u = new Usuario();
            u.setMensaje("No puede dejar los campos vacios. ");
            request.setAttribute("equipoNulo",u);
            return mapping.findForward(FAILURE);
        }
        
        Boolean agregada = DBMS.getInstance().agregarEquipo(e);
        if (agregada) {
            return mapping.findForward(SUCCESS);
        } else {
            Usuario u = new Usuario();
            u.setMensaje("No se pudo cargar a la Base de Datos. ");
            request.setAttribute("equipoNulo",u);
            return mapping.findForward(FAILURE);
        }
    }
}
