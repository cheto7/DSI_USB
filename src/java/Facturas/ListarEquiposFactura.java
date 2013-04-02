/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Equipo;
import Clases.Facturado;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheto
 */
public class ListarEquiposFactura  extends Action{
    
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

        Facturado u = (Facturado) form;
        
        ArrayList<Equipo> equiposAcad = DBMS.getInstance().obtenerEquiposFacturaAgregar(u,"academico");
        ArrayList<Equipo> equiposAdmin = DBMS.getInstance().obtenerEquiposFacturaAgregar(u,"administrativo");
        ArrayList<Equipo> equiposBomb = DBMS.getInstance().obtenerEquiposFacturaAgregar(u,"bombero");
        ArrayList<Equipo> equiposObrero = DBMS.getInstance().obtenerEquiposFacturaAgregar(u,"obrero");
        ArrayList<Equipo> equiposGen = DBMS.getInstance().obtenerEquiposFacturaAgregar(u,"generico");
        request.setAttribute("equiposAcad", equiposAcad);
        request.setAttribute("equiposAdmin", equiposAdmin);
        request.setAttribute("equiposBomb", equiposBomb);
        request.setAttribute("equiposObrero", equiposObrero);
        request.setAttribute("equiposGen", equiposGen);
        request.setAttribute("facturado", u);
        return mapping.findForward(SUCCESS);
    }
    
}
