<%-- 
    Document   : content-nuevo-periodo
    Created on : 30/03/2013, 09:16:50 PM
    Author     : ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<script>
    $(function() {
   
        $("#fecha").attr('placeholder', 'AAAA-MM-DD');
        $("#fecha").attr('title', 'Ingrese fecha fin del período');
    });
    
</script>
<script>
    $(function($){
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: 'Anterior',
            nextText: 'Siguiente',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
            dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
            weekHeader: 'Sm',
            dateFormat: 'yy-mm-dd',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearRange: '+0:+5',
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);
    });      
      
    $(document).ready(function(){
        $("#fecha").datepicker({
            changeMonth: true,
            changeYear: true
        });

    });
</script>

<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />
        <legend>Nuevo período</legend>

        <p>Se abrirá un nuevo período de solicitud de equipos de protección.
            La fecha de inicio corresponderá a la fecha actual.
        </p>

        <logic:present name="fechaNula">
            <center>
                <label style="color:red">Error: Debe introducir fecha de finalización del nuevo período</label>
            </center>
        </logic:present>
        <logic:present name="fechaErronea">
            <center>
                <label style="color:red">Error: Fecha de fin de período debe ser posterior a la fecha de inicio</label>
            </center>
        </logic:present>
        <logic:present name="fechaInvalida">
            <center>
                <label style="color:red">Error: Fecha inválida</label>
            </center>
        </logic:present>           

        <html:form action = "/AgregarPeriodo" onsubmit = "return (this)">
            <center><label style="display: inline">Fecha de cierre:</label>
                <html:text styleId="fecha" title="AAAA-YY-DD" name="Periodo" property="fecha_fin" styleClass="span2"></html:text><br>

            </center>
            
            <center>
                <html:submit styleClass="btn btn-primary">Abrir</html:submit>
            </center>
         </html:form>