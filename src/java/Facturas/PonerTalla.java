/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Facturas;

import Clases.Facturado;
import Clases.String_Cheto;
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
public class PonerTalla extends Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
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
        if (!String.valueOf(f.getCantidad()).matches("[1-9][0-9]*")){ // Intenta pedir Cero unidades de algun EPP
            request.setAttribute("errorCantidad", "error");
            return mapping.findForward(FAILURE);
        }
        ArrayList<String_Cheto> select = new ArrayList<String_Cheto>();
        if(request.getParameter("tipo_talla").equalsIgnoreCase("camisa")){
            select.add(new String_Cheto("S"));
            select.add(new String_Cheto("M"));
            select.add(new String_Cheto("L"));
            select.add(new String_Cheto("XL"));
        }else if(request.getParameter("tipo_talla").equalsIgnoreCase("mascara")){
            select.add(new String_Cheto("S"));
            select.add(new String_Cheto("M"));
            select.add(new String_Cheto("L"));
            select.add(new String_Cheto("XL"));
            
        }else if(request.getParameter("tipo_talla").equalsIgnoreCase("pantalon")){
            select.add(new String_Cheto("28"));
            select.add(new String_Cheto("30"));
            select.add(new String_Cheto("32"));
            select.add(new String_Cheto("34"));
            select.add(new String_Cheto("36"));
            select.add(new String_Cheto("38"));
            select.add(new String_Cheto("40"));
            select.add(new String_Cheto("42"));
            select.add(new String_Cheto("44"));
            select.add(new String_Cheto("48"));
        }else if(request.getParameter("tipo_talla").equalsIgnoreCase("guantes")){
            select.add(new String_Cheto("S"));
            select.add(new String_Cheto("M"));
            select.add(new String_Cheto("L"));
            select.add(new String_Cheto("XL"));
        }else if(request.getParameter("tipo_talla").equalsIgnoreCase("zapato")){
            select.add(new String_Cheto("36"));
            select.add(new String_Cheto("36.5"));
            select.add(new String_Cheto("37"));
            select.add(new String_Cheto("37.5"));
            select.add(new String_Cheto("38"));
            select.add(new String_Cheto("38.5"));
            select.add(new String_Cheto("39"));
            select.add(new String_Cheto("39.5"));
            select.add(new String_Cheto("40"));
            select.add(new String_Cheto("40.5"));
            select.add(new String_Cheto("41"));
            select.add(new String_Cheto("41.5"));
            select.add(new String_Cheto("42"));
            select.add(new String_Cheto("42.5"));
            select.add(new String_Cheto("44"));
            select.add(new String_Cheto("44.5"));
            select.add(new String_Cheto("45"));
        }else {
            select.add(new String_Cheto("No aplica"));
        }
        System.out.println("Parameter: "+request.getParameter("tipo_talla"));
        System.out.println("Facturado: "+f.getTipo_talla());
        request.setAttribute("facturado", f);
        request.setAttribute("select", select);
        return mapping.findForward(SUCCESS);
    }
    
}
