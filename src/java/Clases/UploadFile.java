/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.File;
import org.apache.struts.action.ActionForm;

/**
 *
 * @author cheto
 */
public class UploadFile extends ActionForm{
    private File file;

    /**
     * @return the file
     */
    public File getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(File file) {
        this.file = file;
    }
}
