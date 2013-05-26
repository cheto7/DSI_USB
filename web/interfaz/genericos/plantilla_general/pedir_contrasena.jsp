<%-- 
    Document   : registro-content
    Created on : Nov 3, 2012, 11:03:42 PM
    Author     : sibs

    Modified on : Mar 29, 2012
    Author     : Karen
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
<!-- FORMULARIO DE REGISTRO -->


<logic:present name="mensajeUsuarioEditado">
    <logic:notEmpty name="mensajeUsuarioEditado">
        <center>
            <label style="color:blue"><bean:write name="mensajeUsuarioEditado" property="mensaje"/>                
            </label>
        </center>
    </logic:notEmpty>   
</logic:present>

<logic:present name="mensajeUsuarioNoEditado">
    <logic:notEmpty name="mensajeUsuarioNoEditado">
        <center>
            <label style="color:red">Error:<bean:write name="mensajeUsuarioNoEditado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

    <html:form styleId="Form" method="POST" action="/Recuperar" onsubmit="return (this)" acceptCharset="ISO-8859-1">
    <fieldset>
        <legend>Recuperar Contraseña</legend>
        <table width="100%">
            <tr>
                <td>
                    <label style="color:red">Ingrese USB-ID o correo electrónico con el que se registró:</label>
                    <html:text name="Email" property="email" styleId="email"></html:text>
                    <span class="help-block">Ejemplos: <br> usuario@usb.ve <br> usuario@gmail.com</span>
                    
                </td>
                 
                
            </tr>

        </table>
       
        



<center>
        <p style="color:red"><br><br>A esta dirección de correo electrónico se le va a enviar una nueva contraseña</p>
        
        <html:submit styleClass="btn btn-primary">Recuperar</html:submit>
        </center>
    </fieldset>
</html:form>   

</div>
<div id="sidebar-first">
    <ul>

    </ul>

    <div id="datos_persona" style="margin-bottom:20px; display:none">

    </div>
