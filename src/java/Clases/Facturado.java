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
    private String talla;
    private String tipo_talla;

    
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
    
    
    
}
