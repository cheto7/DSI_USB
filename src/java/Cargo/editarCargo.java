/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Cargo;

import Clases.Cargo;
import Clases.unidadAdscripcion;
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
public class editarCargo extends org.apache.struts.action.Action {

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
        
        String idCargo = request.getParameter("id");
        String cargo = request.getParameter("cargo");
        Cargo editar = new Cargo();
        
        editar.setId(Integer.parseInt(idCargo));
        editar.setCargo(cargo);

        ArrayList<Cargo> cargos = new ArrayList<Cargo>(0);
        cargos.add(editar);
        
        ArrayList<Cargo> resto = DBMS.getInstance().obtenerRestoCargos(idCargo);
        cargos.addAll(resto);
        
        request.setAttribute("cargo", cargos);
        request.setAttribute("editar", "Activado");

        return mapping.findForward(SUCCESS);
    }
}
