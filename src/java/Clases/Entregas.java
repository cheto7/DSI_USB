/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;
import org.apache.struts.action.ActionForm;

/**
 *
 * @author daniel
 */
public class Entregas extends ActionForm {
    private String usuario;
    private String equipo;
    private String cantidad;

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }


    
}
