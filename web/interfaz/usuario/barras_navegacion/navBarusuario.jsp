<%-- 
    Document   : navBarusuario
    Created on : Nov 4, 2012, 3:04:59 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<script src="assets/js/jquery-ui.js"></script>

<script>
    $(function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            active: 2
        });
    });
</script>

<div id="datos_persona" style="margin-bottom:20px;">
    <p>
        <bean:write name="autenticado" property="nombre"></bean:write> 
        <bean:write name="autenticado" property="apellido"></bean:write>
    </p>
</div>

<ul id="navbar">
    <li>
        <html:form action = "/FormularioEditarAdmin" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:10px 20px 40px 20px"> Editar Información </html:submit>
        </html:form> 
    </li>

    <li>
        <html:form action="/Ir_pag_pedido" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:hidden name="autenticado" property="password"/>
            <html:submit style="padding:10px 20px 40px 20px"> Realizar Solicitud </html:submit>
        </html:form>
    </li>

    <li>
        <html:form action="/ListarPedido" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Ver solicitud</html:submit>
        </html:form> 
    </li>
    
    <li>
        <html:form action="/CerrarSesion" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Cerrar Sesión</html:submit>
        </html:form> 
    </li>

    <div id="accordion">
    <h3>Administración</h3>
        <div>
            
    <li>
        <html:form action="/ListadosGenerales" onsubmit="return (this)"> 
            <html:submit style="padding:0px 10px 30px 0px">Consolidados</html:submit>
        </html:form>
    </li>    

    <li>
        <html:form action="/ColeccionUsuarios" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:0px 10px 30px 0px">Lista usuarios</html:submit>
        </html:form>
    </li>

    <li>
        <html:form action="/IrAgregarNoticia" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:0px 10px 30px 0px">Agregar noticia</html:submit>
        </html:form>
    </li>
    
    <li>
        <html:form action="/ListarNoticia" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:0px 10px 30px 0px">Lista noticias</html:submit>
        </html:form>
    </li>
        </div>

</ul>

