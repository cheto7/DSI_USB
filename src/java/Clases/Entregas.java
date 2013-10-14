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
    private String serialEquipo;
    private String equipo;    
    private String usuario;
    private int cantidad_solicitada;
    private int cantidad_entregada;
    private String fecha_solicitud;
    private String fecha_entrega;
    private String talla;
    private int sugerido;

    public int getSugerido() {
        return sugerido;
    }

    public void setSugerido(int sugerido) {
        this.sugerido = sugerido;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public int getCantidad_entregada() {
        return cantidad_entregada;
    }

    public void setCantidad_entregada(int cantidad_entregada) {
        this.cantidad_entregada = cantidad_entregada;
    }

    public int getCantidad_solicitada() {
        return cantidad_solicitada;
    }

    public void setCantidad_solicitada(int cantidad_solicitada) {
        this.cantidad_solicitada = cantidad_solicitada;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public String getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(String fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

    public String getFecha_solicitud() {
        return fecha_solicitud;
    }

    public void setFecha_solicitud(String fecha_solicitud) {
        this.fecha_solicitud = fecha_solicitud;
    }

    public String getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(String idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getSerialEquipo() {
        return serialEquipo;
    }

    public void setSerialEquipo(String serialEquipo) {
        this.serialEquipo = serialEquipo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

   

}
