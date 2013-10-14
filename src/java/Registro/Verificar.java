package Registro;

import Clases.Cargo;
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
        ArrayList<Cargo> cargos = DBMS.getInstance().obtenerCargos();
        request.setAttribute("cargos", cargos);
        
        /*
         * Verificacion de campos obligatorios vacios
         */
        if (u.getUsuario().equals("")) {
            u.setMensaje("Debe introducir su USB-ID.");
            return mapping.findForward(FAILURE);
        }
        if (u.getNombre().equals("")) {
            u.setMensaje("Debe introducir su nombre.");
            return mapping.findForward(FAILURE);
        }
        if (u.getApellido().equals("")) {
            u.setMensaje("Debe introducir sus apellidos.");
            return mapping.findForward(FAILURE);
        }        
        if (u.getPassword().equals("")) {
            u.setMensaje("Debe introducir su contraseña.");
            return mapping.findForward(FAILURE);
        }
        if (u.getCi().equals("")) {
            u.setMensaje("Debe introducir su cédula de identidad.");
            return mapping.findForward(FAILURE);
        }
        if (u.getUnidad_adscripcion().isEmpty()) {
            u.setMensaje("Debe introducir su unidad de adscrición.");
            return mapping.findForward(FAILURE);
        }
        if (u.getArea_laboral().equals("")) {
            u.setMensaje("Debe seleccionar su área laboral.");
            return mapping.findForward(FAILURE);
        }
        if (u.getFecha().equals("")) {
            u.setMensaje("Debe introducir su fecha de ingreso a la USB.");
            return mapping.findForward(FAILURE);
        }
        if (u.getEmail().equals("")) {
            u.setMensaje("Debe introducir su correo electrónico.");
            return mapping.findForward(FAILURE);
        }
        
        /*
         * Verifica que la fecha de ingreso no sea posterior a la fecha actual
         */
        java.util.Date date = new java.util.Date(); 
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yy");
        String fecha = sdf.format(date);
        String [] actual = fecha.split("-");
        System.out.println("fechaa de ingreso: "+u.getFecha());
        System.out.println("fechaa de actual: "+fecha);
        String [] ingreso = u.getFecha().split("/");
        
        if (Integer.parseInt(ingreso[2])>Integer.parseInt(actual[2])){
            u.setMensaje("La fecha de ingreso debe ser anterior a la fecha actual.");
            return mapping.findForward(FAILURE);
        }
        if ((Integer.parseInt(ingreso[1])>Integer.parseInt(actual[1])) && 
            Integer.parseInt(ingreso[2])>=Integer.parseInt(actual[2])){
            u.setMensaje("La fecha de ingreso debe ser anterior a la fecha actual.");
            return mapping.findForward(FAILURE);
        }
        if ((Integer.parseInt(ingreso[0])>Integer.parseInt(actual[0])) && 
            Integer.parseInt(ingreso[2])>=Integer.parseInt(actual[2]) &&
            Integer.parseInt(ingreso[1])>=Integer.parseInt(actual[1])){
            u.setMensaje("La fecha de ingreso debe ser anterior a la fecha actual.");
            return mapping.findForward(FAILURE);
        }
         
        

        /*
         * Verifica que el nombre de usuario no este en la base de datos.
         */
        if (DBMS.getInstance().existeUsuario(u)) {
            u.setMensaje("El USB-ID ya existe.");

            return mapping.findForward(FAILURE);
        }
        /*
         * Verifica la cedula del usuario no este en la base de datos.
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
         * Verificacion con respecto al nombre y el apellido y cedula
         */
        if (!u.getNombre().matches("[a-zA-Z]+")) {
            u.setMensaje("Nombre inválido. Debe usar solo letras");
            return mapping.findForward(FAILURE);
        }
        if (!u.getApellido().matches("[a-zA-Z]+")) {
            u.setMensaje("Apellido inválido. Debe usar solo letras");
            return mapping.findForward(FAILURE);
        }
        if (!u.getCi().matches("[0-9]+")) {
            u.setMensaje("Cédula inválido. Debe usar solo números");
            return mapping.findForward(FAILURE);
        }        

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
