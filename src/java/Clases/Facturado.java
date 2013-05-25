/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author cheto
 */
public class Facturado extends ActionForm{
    
    private int numero_factura;
    private int serial; //Equipo
    private int cantidad;
    private String cantidadString;
    private String talla;
    private String tipo_talla;
    private String nombre_vista;
    private String validado;

    
    /**
     * @return the numero_factura
     */
    public int getNumero_factura() {
        return numero_factura;
    }

    /**
     * @param numero_factura the numero_factura to set
     */
    public void setNumero_factura(int numero_factura) {
        this.numero_factura = numero_factura;
    }

    /**
     * @return the serial
     */
    public int getSerial() {
        return serial;
    }

    /**
     * @param serial the serial to set
     */
    public void setSerial(int serial) {
        this.serial = serial;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the talla
     */
    public String getTalla() {
        return talla;
    }

    /**
     * @param talla the talla to set
     */
    public void setTalla(String talla) {
        this.talla = talla;
    }

    /**
     * @return the tipo_talla
     */
    public String getTipo_talla() {
        return tipo_talla;
    }

    /**
     * @param tipo_talla the tipo_talla to set
     */
    public void setTipo_talla(String tipo_talla) {
        this.tipo_talla = tipo_talla;
    }

    /**
     * @return the nombre_vista
     */
    public String getNombre_vista() {
        return nombre_vista;
    }

    /**
     * @param nombre_vista the nombre_vista to set
     */
    public void setNombre_vista(String nombre_vista) {
        this.nombre_vista = nombre_vista;
    }

    /**
     * @return the cantidadString
     */
    public String getCantidadString() {
        return cantidadString;
    }

    /**
     * @param cantidadString the cantidadString to set
     */
    public void setCantidadString(String cantidadString) {
        this.cantidadString = cantidadString;
    }

    /**
     * @return the validado
     */
    public String getValidado() {
        return validado;
    }

    /**
     * @param validado the validado to set
     */
    public void setValidado(String validado) {
        this.validado = validado;
    }
    
    
    
}
