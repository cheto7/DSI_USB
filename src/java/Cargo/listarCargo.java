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
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ivan
 */
public class listarCargo extends org.apache.struts.action.Action {

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
        
        /*
         * NUEVO!
         */
        HttpSession session = request.getSession();
        String loggueado = (String) session.getAttribute("usuarioAutenticado");
        Usuario autenticado = new Usuario();
        autenticado.setUsuario(loggueado);


        ArrayList<Cargo> cargo = DBMS.getInstance().obtenerCargos();
        request.setAttribute("cargo", cargo);

        ArrayList<Cargo> select = DBMS.getInstance().obtenerCargos();
        request.setAttribute("select", select);      

        return mapping.findForward(SUCCESS);
    }
}
