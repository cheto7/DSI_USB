package Editar;

import Clases.Usuario;
import Clases.unidadAdscripcion;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import DBMS.*;
import java.util.ArrayList;

/**
 *
 * @author cheo
 */

/*Accion que busca los atributos del administrador, los envia a la vista de
 * modificacion y coloca cada atributo en el rubro correspondiente del
 * form. */
public class FormularioEditarAdmin extends org.apache.struts.action.Action {
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

        Usuario u = (Usuario) form;
        u = DBMS.getInstance().atributosUsuario(u);
        request.setAttribute("autenticado", u);

        unidadAdscripcion actual = new unidadAdscripcion();
        actual.setNombre(u.getUnidad_adscripcion());
        ArrayList<unidadAdscripcion> select = new ArrayList<unidadAdscripcion>(0);
        select.add(actual);
        ArrayList<unidadAdscripcion> resto = DBMS.getInstance().obtenerUnidadesAdscripcion();
        select.addAll(resto);
        request.setAttribute("select", select);

        return mapping.findForward(SUCCESS);
    }
}