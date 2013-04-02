/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Equipo;
import Clases.Facturado;
import DBMS.DBMS;
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
public class AgregarEquipoAFactura extends Action{
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Equipo equipo = new Equipo();
        Facturado f = (Facturado) form;
        /*
        String serial = request.getParameter("serial");
        String id = request.getParameter("id");
        String ttalla = request.getParameter("tipo_talla");
        String frecuencia = request.getParameter("frecuencia");
        String cantidad = request.getParameter("cantidad");
        String usuario = request.getParameter("usuario");
        System.out.println("usuariooooooooooooooo: "+usuario);
        */
        if ("0".equals(f.getCantidad())){ // Intenta pedir Cero unidades de algun EPP
            request.setAttribute("errorCantidad", "error");
            return mapping.findForward(SUCCESS);
        }
        boolean agregado = DBMS.getInstance().agregarAFacturado(f);
        if(!agregado){
            request.setAttribute("agregadoEquipo", "no agregado");
        }
        return mapping.findForward(SUCCESS);
    }
    
}
