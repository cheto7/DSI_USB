/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipo;

import Clases.Equipo;
import Clases.Usuario;
import DBMS.DBMS;
import java.io.File;
import java.io.InputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.File;
import org.apache.struts.upload.FormFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author cheto
 */
public class AgregarEquipo extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Equipo e = (Equipo) form;
        if (    "".equals(e.getNombre_vista())) {
            request.setAttribute("errorNombreEquipo", "error");
            return mapping.findForward(FAILURE);
        }
        if (e.getTipo() == "") {
            request.setAttribute("errorTipoEquipo", "error");
            return mapping.findForward(FAILURE);
        }
        if (e.getFuncionalidad() == "") {
            request.setAttribute("errorFuncionalidadEquipo", "error");
            return mapping.findForward(FAILURE);
        }
        if (e.getTipo_talla() == "") {
            request.setAttribute("errorTallaEquipo", "error");
            return mapping.findForward(FAILURE);
        }
        /*
        String str = e.getNombre_vista();
        if (str.substring(str.length()-4,str.length())!=".png" || 
            str.substring(str.length()-4,str.length())!=".jpg" ||
            str.substring(str.length()-4,str.length())!=".gif"
           ){
            request.setAttribute("errorFormatoEquipo", "error");
            return mapping.findForward(FAILURE);        
        }
        * 
        */

        String rutaApp = this.getServlet().getServletContext().getRealPath("/");
             
        
        String path = rutaApp + "assets/materiales/" + e.getNombre_vista() + ".png";               

//Controlamos las condiciones para subirlo

        try {

// se comprueba que la ruta exista

            File f = new File(path);

            if (!f.exists()) {
                f.createNewFile();
            }

            if (makeSureDirectoryExists(parent(f))) {
                System.out.println(path);
// Se graba en la ruta la foto;

                FileOutputStream out = new FileOutputStream(f);

                out.write(e.getFile().getFileData());

                out.flush();

                out.close();

//indicamos que la intalación tiene ya foto asociada
                e.setImagen(f.getAbsolutePath());
            } //if


        } //try
        catch (Exception ex) {

            System.out.println("Lanzada excepcion en agregarEquipo subiendo imagen:" + ex);

            return null;

        }

//Destruimos el archivo temporal

        e.getFile().destroy();

        Boolean agregada = DBMS.getInstance().agregarEquipo(e);
        if (agregada) {
            return mapping.findForward(SUCCESS);
        } else {
            Usuario u = new Usuario();
            u.setMensaje("No se pudo cargar a la Base de Datos. ");
            request.setAttribute("equipoNulo", u);
            return mapping.findForward(FAILURE);
        }
    }

    private File parent(File f) {

        String dirname = f.getParent();

        if (dirname == null) {

            return new File(File.separator);

        }

        return new File(dirname);

    }

    /**
     *
     * Crear un subdirectorio si este no existe
     *
     * @param dir --> El path del archivo (dirección + nombre)
     *
     * @return True -> Existe o se ha creado False --> No existe y no se ha
     * podido crear
     *
     */
    private boolean makeSureDirectoryExists(File dir) {

        if (!dir.exists()) {

            if (makeSureDirectoryExists(parent(dir))) {
                dir.mkdir();
            } else {
                return false;
            }
        }

        return true;

    }
}
