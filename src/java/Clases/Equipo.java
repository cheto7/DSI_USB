package Clases;

import java.io.File;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author cheo
 */
public class Equipo extends ValidatorForm {

    private int serial;
    private String imagen;
    private String tipo;
    private String nombre_vista;
    private int cantidad;
    private Double evaluacion;
    private String funcionalidad;
    private File file;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
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
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * @param imagen the imagen to set
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
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
     * @return the evaluacion
     */
    public Double getEvaluacion() {
        return evaluacion;
    }

    /**
     * @param evaluacion the evaluacion to set
     */
    public void setEvaluacion(Double evaluacion) {
        this.evaluacion = evaluacion;
    }

    /**
     * @return the funcionalidad
     */
    public String getFuncionalidad() {
        return funcionalidad;
    }

    /**
     * @param funcionalidad the funcionalidad to set
     */
    public void setFuncionalidad(String funcionalidad) {
        this.funcionalidad = funcionalidad;
    }

}
