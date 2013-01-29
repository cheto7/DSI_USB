<%-- 
    Document   : conf-solicitud
    Created on : Nov 4, 2012, 2:19:41 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Pagina visualizar solicitud</legend>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<logic:notPresent name="solicitudes">
    <center>
        <label> No hay ha realizado ninguna solicitud.</label>
    </center>
</logic:notPresent>

<logic:present name="solicitudes">

    <logic:empty name="solicitudes">
        <center>
            <label> No ha realizado ninguna solicitud.</label>
        </center>
    </logic:empty>
    <br>

    <logic:notEmpty name="solicitudes">

        <table class="table table-hover">
            <tbody>
                <tr>
                    <th><center>Equipo</center></th>
                    <th><center>Imagen</center></th>
                    <th><center>Cantidad</center></th>
                    <th><center>Frecuencia</center></th>
                    <th><center>Eliminar</center></th>
                </tr>

                <logic:iterate name="solicitudes" id="solicitud">
                    <tr>
                        <td><bean:write name="solicitud" property="nombre_vista" /></td>
                        <td><center><img src="<bean:write name="solicitud" property="imagen" />"/></center></td>
                        <td><center> <bean:write name="solicitud" property="cantidad"/> </center></td>
                        <td><center> <bean:write name="solicitud" property="frecuencia"/> </center></td>
                        <td><center>
                            <html:form action="/EliminarElemSolicitud" onsubmit="return (this)"> 
                                <html:hidden name="solicitud" property="nombre_equipo"/>                               
                                <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                            </html:form>
                        </center></td>
                    </tr>
                </logic:iterate>
            </tbody>
        </table>

        <center>
            <html:form style="float: left; padding-left: 20%" method="POST" action="/ConfirmarEliminarSolicitud?method=save" onsubmit="return (this)">
                <html:submit styleClass="btn btn-primary"> Eliminar solicitud completa </html:submit>
            </html:form>

            <html:form style="float: left; padding-left: 10px" action="/Ir_pag_pedido" onsubmit="return (this)">
                <html:hidden name="autenticado" property="usuario"/>
                <html:hidden name="autenticado" property="password"/>
                <html:submit styleClass="btn btn-info"> Modificar Solicitud </html:submit>
            </html:form>
                
            <html:link action="/Download" target="_blank" >
                <img src="assets/Boton PDF comprobante pedido DEF.png"/>
            </html:link>
        </center>

    </logic:notEmpty>    
</logic:present>

<!--Script para activar las flechas de movimiento -->
<script>

    $(function() {
        var $elem = $('#content');
        
        $('#nav_up').fadeIn('slow');
        $('#nav_down').fadeIn('slow');  

        $(window).bind('scrollstart', function(){
            $('#nav_up,#nav_down').stop().animate({'opacity':'0.2'});
        });

        $(window).bind('scrollstop', function(){
            $('#nav_up,#nav_down').stop().animate({'opacity':'1'});
        });
        
        $('#nav_down').click(
        function (e) {
            $('html, body').animate({scrollTop: $elem.height()}, 800);
        }
    );
        
        $('#nav_up').click(
        function (e) {
            $('html, body').animate({scrollTop: '0px'}, 800);
        }
    );
    });
</script>


<div style="display:none;" class="nav_up" id="nav_up"></div>
<div style="display:none;" class="nav_down" id="nav_down"></div>

