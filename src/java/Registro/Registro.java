package Registro;

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
 * @author cheo
 */

/*
 * Accion que lleva a la pagina de registro.
 */
public class Registro extends org.apache.struts.action.Action {

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

        unidadAdscripcion vacia = new unidadAdscripcion();
        vacia.setNombre("");
        
        Cargo cargo = new Cargo();
        cargo.setCargo("");
        
        ArrayList<Cargo> cargos = new ArrayList<Cargo>(0);
        ArrayList<Cargo> restocargos = DBMS.getInstance().obtenerCargos();
        cargos.add(cargo);
        cargos.addAll(restocargos);

        ArrayList<unidadAdscripcion> select = new ArrayList<unidadAdscripcion>(0);
        ArrayList<unidadAdscripcion> resto = DBMS.getInstance().obtenerUnidadesAdscripcion();
        select.add(vacia);
        select.addAll(resto);
        
        request.setAttribute("cargos", cargos); 
        request.setAttribute("select", select); 
        
        return mapping.findForward(SUCCESS);
    }
}
