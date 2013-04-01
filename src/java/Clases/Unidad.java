
package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author smaf
 */
public class Unidad extends ActionForm {
    
    private int id;
    private String nombre;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }        
    
}
