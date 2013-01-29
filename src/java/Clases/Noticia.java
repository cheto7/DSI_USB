
package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author smaf
 */
public class Noticia extends ActionForm {
    
    private String usuario;
    private String titulo;
    private String contenido;
    private String fechaNoticia;
    private String tituloAnterior;

    public String getTituloAnterior() {
        return tituloAnterior;
    }

    public void setTituloAnterior(String tituloAnterior) {
        this.tituloAnterior = tituloAnterior;
    }

    public String getFechaNoticia() {
        return fechaNoticia;
    }

    public void setFechaNoticia(String fechaNoticia) {
        this.fechaNoticia = fechaNoticia;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
    
}
