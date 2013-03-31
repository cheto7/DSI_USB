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
       
    private String idSolicitud;
    private String usuario;
    private String equipo;    
    private String fecha_solicitud;
    private String cantidad;
    private String frecuencia;
    private String talla;

    
    public String getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(String frecuencia) {
        this.frecuencia = frecuencia;
    }
    
    public String getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(String idSolicitud) {
        this.idSolicitud = idSolicitud;
    }      

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

    public String getFecha_solicitud() {
        return fecha_solicitud;
    }

    public void setFecha_solicitud(String fecha_solicitud) {
        this.fecha_solicitud = fecha_solicitud;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }        

}
