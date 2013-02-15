package Clases;

import java.io.File;
import org.apache.struts.upload.FormFile;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author cheto
 */
public class Equipo extends ValidatorForm {

    private int serial;
    private String imagen;
    private String tipo;
    private String nombre_vista;
    private int cantidad;
    private Double evaluacion;
    private String funcionalidad;
    private FormFile file;
    private String norma;
    private String vida_util;
    private String sector;

    public String getNorma() {
        return norma;
    }

    public void setNorma(String norma) {
        this.norma = norma;
    }

    public String getVida_util() {
        return vida_util;
    }

    public void setVida_util(String vida_util) {
        this.vida_util = vida_util;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public FormFile getFile() {
        return file;
    }

    public void setFile(FormFile file) {
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

    /**
     * @return the tiempo_vida
     */
    public int getTiempo_vida() {
        return tiempo_vida;
    }

    /**
     * @param tiempo_vida the tiempo_vida to set
     */
    public void setTiempo_vida(int tiempo_vida) {
        this.tiempo_vida = tiempo_vida;
    }

    /**
     * @return the obrero
     */
    public String getObrero() {
        return obrero;
    }

    /**
     * @param obrero the obrero to set
     */
    public void setObrero(String obrero) {
        this.obrero = obrero;
    }

    /**
     * @return the profesor
     */
    public String getProfesor() {
        return profesor;
    }

    /**
     * @param profesor the profesor to set
     */
    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }

    /**
     * @return the bombero
     */
    public String getBombero() {
        return bombero;
    }

    /**
     * @param bombero the bombero to set
     */
    public void setBombero(String bombero) {
        this.bombero = bombero;
    }

    /**
     * @return the administrativo
     */
    public String getAdministrativo() {
        return administrativo;
    }

    /**
     * @param administrativo the administrativo to set
     */
    public void setAdministrativo(String administrativo) {
        this.administrativo = administrativo;
    }

    /**
     * @return the generico
     */
    public String getGenerico() {
        return generico;
    }

    /**
     * @param generico the generico to set
     */
    public void setGenerico(String generico) {
        this.generico = generico;
    }

}
