package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author cheo
 */
public class Equipo extends ActionForm {

    private String equipo;
    private String imagen;

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }
}
