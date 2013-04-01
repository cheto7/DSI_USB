/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author ivan
 */
public class Periodo extends ActionForm {  
    private Boolean habilitado;
    private Boolean ultimo;
    private String fecha_inicio;
    private String fecha_fin;
    private Integer cantidadRecibida;
    private Integer cantidadProcesada;
    private Integer id;

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public Integer getCantidadRecibida() {
        return cantidadRecibida;
    }

    public void setCantidadRecibida(Integer cantidadRecibida) {
        this.cantidadRecibida = cantidadRecibida;
    }

    public Integer getCantidadProcesada() {
        return cantidadProcesada;
    }

    public void setCantidadProcesada(Integer cantidadProcesada) {
        this.cantidadProcesada = cantidadProcesada;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getUltimo() {
        return ultimo;
    }

    public void setUltimo(Boolean ultimo) {
        this.ultimo = ultimo;
    }
}