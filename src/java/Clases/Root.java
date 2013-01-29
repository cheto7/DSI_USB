
package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author cheo
 */
public class Root  extends ActionForm {
    private String mensaje;

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}