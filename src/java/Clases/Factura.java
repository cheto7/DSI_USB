/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.Date;
import org.apache.struts.action.ActionForm;

/**
 *
 * @author cheto
 */
public class Factura extends ActionForm{
    
    private String proveedor;   //nombre_proveedor
    private int numero_factura;
    private Date fecha;
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
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
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

    /**
     * @return the proveedor
     */
    public String getProveedor() {
        return proveedor;
    }

    /**
     * @param proveedor the proveedor to set
     */
    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }
    
    
    
}
