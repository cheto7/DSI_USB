/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Cargo;

import Clases.Cargo;
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
 * @author ivan
 */
public class editarCargoConfirm extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
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
        
        Cargo editar = new Cargo();
        Usuario u = new Usuario();

        editar.setId(Integer.parseInt(request.getParameter("id")));
        editar.setCargo(request.getParameter("cargo"));
        
        if (editar.getCargo().equals("")){
            u.setMensaje("No puede dejar vacío el nombre del cargo. ");
            request.setAttribute("mensajeUsuarioNoEditado", u);
            ArrayList<Cargo> cargo = DBMS.getInstance().obtenerCargos();
            request.setAttribute("cargo", cargo);            
            return mapping.findForward(SUCCESS);
        }

        Boolean modificado = DBMS.getInstance().editarCargo(editar);     

        if (modificado) {
            u.setMensaje("El cargo ha sido Modificado. ");
            request.setAttribute("mensajeUsuarioEditado", u);
        } else {
            u.setMensaje("Ya fue registrado el cargo previamente. ");
            request.setAttribute("mensajeUsuarioNoEditado", u);
        }
        ArrayList<Cargo> cargo = DBMS.getInstance().obtenerCargos();
        request.setAttribute("cargo", cargo);        

        return mapping.findForward(SUCCESS);
    }
}
