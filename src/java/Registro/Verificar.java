package Registro;

import Clases.Mail;
import Clases.Noticia;
import Clases.Usuario;
import Clases.unidadAdscripcion;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author cheo
 */

/*
 * Accion que verifica que el usuario que se quiere registrar haya llenado todos
 * los campos correctamente.
 */
public class Verificar extends DispatchAction {

    private static final String SUCCESS = "success";
    private static final String PAGE = "page";
    private static final String FAILURE = "failure";

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
    public ActionForward save(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Usuario u = (Usuario) form;

        ArrayList<unidadAdscripcion> select = DBMS.getInstance().obtenerUnidadesAdscripcion();
        request.setAttribute("select", select);

        /*
         * Verifica que el nombre de usuario no este en la base de datos.
         */
        if (DBMS.getInstance().existeUsuario(u)) {
            u.setMensaje("El nombre de usuario ya existe.");

            return mapping.findForward(FAILURE);
        }
        /*
         * Verifica que el nombre de usuario no este en la base de datos.
         */
        else if (DBMS.getInstance().existeCedula(u)) {
            u.setMensaje("La cédula de identidad ya ha sido registrada.");

            return mapping.findForward(FAILURE);
        }
        /*
         * Verifica que el nombre de usuario no este en la base de datos.
         */
        else if (DBMS.getInstance().existeCorreo(u)) {
            u.setMensaje("El correo electrónico ya ha sido registrado.");

            return mapping.findForward(FAILURE);
        }        

        /*
         * Verificaciones de password.
         */
        if (u.getPassword().contains(";") || u.getPassword().contains("<")
                || u.getPassword().contains(">") || u.getPassword().contains("'")
                || u.getPassword().contains("&") || u.getPassword().contains("$")) {
            u.setMensaje("Clave invalida, contiene alguno de estos caracteres ';' , "
                    + "'<' , '>', '&' , '$' , '''");
            return mapping.findForward(FAILURE);
        }

        /*
         * Verificaciones de USB-ID.
         */
        if (u.getUsuario().contains(";") || u.getUsuario().contains("<")
                || u.getUsuario().contains(">") || u.getUsuario().contains("'")
                || u.getUsuario().contains("&") || u.getUsuario().contains("$")) {
            u.setMensaje("USB-ID invalido, contiene alguno de estos caracteres ';' , "
                    + "'<' , '>', '&' , '$' , '''");
            return mapping.findForward(FAILURE);
        }

        /*
         * Verificaciones de password, USB-ID, Nombre, Apellido, CI y Sector
         * Universitario(area_laboral) no pueden ser vacias.
         */
        if (u.getUsuario().equals("") || u.getPassword().equals("")
                || u.getApellido().equals("") || u.getCi().equals("") || u.getUnidad_adscripcion().isEmpty()
                || u.getArea_laboral().equals("") || u.getNombre().equals("")) {
            u.setMensaje("Campo de 'USB-ID', 'Contraseña', 'Nombre', "
                    + "'Apellido', 'CI' o 'Sector Universitario' no pueden ser vacíos. ");
            return mapping.findForward(FAILURE);
        }

        /*
         * Verificaciones de sexo.
         */
        if (u.getSexo() == null) {
            u.setMensaje("Por favor seleccione sexo. ");
            return mapping.findForward(FAILURE);
        }

        /*
         * Verificacion carnet USB-ID.
         */
        if (!u.getUsuario().contains("@usb.ve")) {
            u.setMensaje("No es un USB-ID válido. ");
            return mapping.findForward(FAILURE);
        }

        /*
         * Verificaciones de e-mail.
         */
        if (u.getEmail().equals("")) {
        } else {
            if (!u.getEmail().contains("@")) {
                u.setMensaje("No es un email válido. ");
                return mapping.findForward(FAILURE);
            }
            if (!u.getEmail().contains(".")) {
                u.setMensaje("No es un email válido. ");
                return mapping.findForward(FAILURE);
            }

        }



        /*
         * Verificacion con respecto al nombre y el apellido.
         */
        if (u.getNombre().contains(";") || u.getNombre().contains("<")
                || u.getNombre().contains(">") || u.getNombre().contains("'")
                || u.getNombre().contains("&") || u.getNombre().contains("$")
                || u.getApellido().contains(";") || u.getApellido().contains("<")
                || u.getApellido().contains(">") || u.getApellido().contains("'")
                || u.getApellido().contains("&") || u.getApellido().contains("$")) {
            u.setMensaje("Nombre o apellido invalido, contiene alguno de estos caracteres ';' , "
                    + "'<' , '>', '&' , '$' , '''");
            return mapping.findForward(FAILURE);
        }

        /*
         * if
         * (!u.getFecha().matches("([012][0-9]|3[01])/(0[1-9]|1[012])/(0[1-9]|[12][0-9]|3[01])$"))
         * { u.setMensaje("Fecha invalida. Formato dd/mm/yy"); return
         * mapping.findForward(FAILURE);
     }
         */
        Boolean agregado = DBMS.getInstance().agregarUsuario(u);
        if (agregado) {
            ArrayList<Noticia> noticias = DBMS.getInstance().obtenerNoticias();
            request.setAttribute("informacion", noticias);
            u.setMensaje("Usuario registrado exitósamente. ");
            request.setAttribute("mensajeRegistrado", u);

            /*Mail email = new Mail();   
            email.sendMailPresolicitud(u.getEmail());*/
            return mapping.findForward(SUCCESS);
        } else {
            u.setMensaje("Campo incorrecto");
            request.setAttribute("usuario", u);
            return mapping.findForward(FAILURE);
        }
    }

    public ActionForward page(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(PAGE);
    }
}
