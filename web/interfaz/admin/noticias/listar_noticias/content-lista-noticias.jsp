<%-- 
    Document   : content-lista-noticias
    Created on : Nov 25, 2012, 12:46:09 PM
    Author     : smaf
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<logic:present name="mensajeNoticiaEditada">
    <logic:notEmpty name="mensajeNoticiaEditada">
        <center>
            <label style="color:blue"><bean:write name="mensajeNoticiaEditada" property="mensaje"/>
                '<bean:write name="editada" property="titulo"/>'
                ha sido modificada.
            </label>
        </center>
    </logic:notEmpty>
</logic:present>

<fieldset>
    <legend>Lista de Noticias</legend> 

    <logic:notPresent name="noticias">
        <center>
            <label> No hay noticias que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="noticias">

        <logic:empty name="noticias">
            <center>
                <label> No hay noticias que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="noticias">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Titulo</center></th>
                <th><center>Contenido</center></th>
                <th><center>Modificador</center></th>
                <th><center>Eliminar</center></th>
                </tr>

                <logic:iterate name="noticias" id="noticia">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="noticia" property="titulo"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                            <p> <bean:write name="noticia" property="contenido"></bean:write> </p>
                        </td>

                        <td>
                    <center>
                        <html:form action = "/FormularioEditarNoticia" onsubmit = "return (this)">
                            <html:hidden name="noticia" property="titulo"/>
                            <html:hidden name="noticia" property="contenido"/>
                            <html:hidden name="noticia" property="usuario"/>
                            <html:submit styleClass="btn btn-success"> Editar </html:submit>
                        </html:form> 
                    </center>
                    </td>

                    <td>
                    <center>
                        <html:form action="/ConfirmarEliminarNoticia" onsubmit="return (this)">
                            <html:hidden name="noticia" property="titulo"/>
                            <html:hidden name="noticia" property="contenido"/>
                            <html:hidden name="noticia" property="usuario"/>
                            <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                        </html:form>
                    </center>
                    </td>
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
</fieldset>