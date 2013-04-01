
package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author Azocar
 */
public class unidadAdscripcion extends ActionForm {
    
    private String id;
    private String nombre;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
