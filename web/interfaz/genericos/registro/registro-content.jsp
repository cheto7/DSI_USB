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

<!-- FORMULARIO DE REGISTRO -->

<logic:present name="Usuario" property="mensaje">
    <center><label style="color: red"><bean:write name="Usuario" property="mensaje" /></label></center>
</logic:present>

<html:form styleId="Form" method="POST" action="/Verificar?method=save" onsubmit="return (this)" acceptCharset="ISO-8859-1">
    <fieldset>
        <legend>Registro</legend>
        <table width="100%">
            <tr>
                <td>
                    <label style="color:red">USB-ID:</label>
                    <html:text name="Usuario" property="usuario" styleId="usbid"></html:text>
                        <span class="help-block">Ejemplo: usuario@usb.ve</span>                    
                    </td>
                    <td>
                        <label style="color:red">Datos Personales:</label>
                        <div class="controls controls-row">
                        <html:text name="Usuario" property="nombre" styleId="nombre" styleClass="span2"></html:text>
                        <html:text name="Usuario" property="apellido" styleId="apellido" styleClass="span2"></html:text>                        
                        </div>                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="color:red" >Contraseña:</label>
                    <html:password name="Usuario" property="password" styleId="password"></html:password>
                    </td>
                    <td>
                        <label style="color:red">Confirmar Contraseña:</label>
                        <input id="confirm_password" type="password" class="text" 
                               name="confirm_password" placeholder="Confirmar Contraseña" 
                               title="Ingrese su contraseña"/>                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="color:red">Cédula de identidad:</label>
                        <div class="controls controls-row">
                        <html:text name="Usuario" property="ci" 
                                   styleId="cedula" 
                                   styleClass="span2">
                        </html:text>                                    
                    </div>           

                </td>
                <td>
                    <label style="color: red">Correo electrónico:</label>
                    <html:text name="Usuario" property="email" styleId="email"></html:text>
                        <span class="help-block">Ejemplo: usuario@gmail.com</span>
                    </td>

                </tr>
                <tr>
                    <td>
                        <br>
                        <label style="color: red">Fecha de Ingreso a la USB:</label>
                    <html:text name="Usuario" property="fecha" styleId="fecha" 
                               styleClass="campofecha">
                    </html:text>              
                </td>
                <td>
                    <label>Teléfono:</label>
                    <html:text name="Usuario" property="telefono" styleId="tele"></html:text>                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="color:red"> Sexo: </label>
                        <label class="radio">
                        <html:radio property="sexo" value="masculino">
                            Masculino
                        </html:radio>
                    </label>
                    <label class="radio">
                        <html:radio property="sexo" value="femenino">
                            Femenino
                        </html:radio>
                    </label>                                
                </td>
                <td>
                    <label style="color:red">Unidad Adscripción:</label>
                    <logic:present name="select">
                        <logic:empty name="select">
                            <html:select name="Usuario" property="unidad_adscripcion" styleClass="span5" style="width:250px">

                                <html:option value= "" > Unidad de Adscripcion</html:option>                    

                            </html:select>
                        </logic:empty>

                        <logic:notEmpty name="select">
                            <html:select name="Usuario" property="unidad_adscripcion" styleClass="span5" style="width:250px">                                   
                                <html:optionsCollection name="select" value="nombre" label="nombre"/>                                            
                            </html:select>
                        </logic:notEmpty>

                    </logic:present>
                </td>
            </tr>
        </table>
        <legend>Tallas personales:</legend>
        <table width="100%">
            <tr>
                <td>      
                    <label style="display: inline">Talla de máscara:</label>
                    <html:select name="Usuario" property="talla_mascara" styleClass="span1">
                <option>S</option>
                <option>M</option>
                <option>L</option>
                <option>XL</option> 
            </html:select>
            </td>
            <td>        
                <label style="display: inline">Talla de camisa:</label>
                <html:select name="Usuario" property="talla_camisa" styleClass="span1">
                <option>S</option>
                <option>M</option>
                <option>L</option>
                <option>XL</option>
            </html:select>
            </td>
            <td> 
                <label style="display: inline">Talla de pantalón:</label>

                <html:select name="Usuario" property="talla_pantalon" styleClass="span1">
                <option>28</option>
                <option>30</option>
                <option>32</option>
                <option>34</option>
                <option>36</option>
                <option>38</option>
                <option>40</option>
                <option>42</option>
                <option>44</option>
                <option>48</option>
            </html:select>
            </td>
            </tr>

            <tr>

                <td>        
                    <label style="display: inline">Talla de guantes:</label>

                    <html:select name="Usuario" property="talla_guantes" styleClass="span1">
                <option>S</option>
                <option>M</option>
                <option>L</option>
                <option>XL</option>
            </html:select></td>

            <td>        
                <label style="display: inline">Talla de zapato:</label>
                <html:select name="Usuario" property="talla_zapato" styleClass="span1">
                <option>36</option>
                <option>36.5</option>
                <option>37</option>
                <option>37.5</option>
                <option>38</option>
                <option>38.5</option>
                <option>39</option>
                <option>39.5</option>
                <option>40</option>
                <option>40.5</option>
                <option>41</option>
                <option>41.5</option>
                <option>42</option>
                <option>42.5</option>
                <option>44</option>
                <option>44.5</option>
                <option>45</option>
            </html:select>
            </td>
            <td></td>
            </tr>

        </table>

        <legend>Sector universitario:</legend>
        <table width="80%">
            <tr>
                <td>
                    <label>Área:</label>
                    <html:select name="Usuario" property="area_laboral" styleClass="span3">
                       <option></option>
                       <option value="administrativo">Administrativa</option>
                       <option value="academico">Académica</option>
                       <option value="bombero">Bombero</option>
                       <option value="obrero">Obrero</option>
                    </html:select>
                </td>
            <td>
                <label>Cargo:</label>
                <html:text name="Usuario" property="cargo" styleId="apellido"></html:text>                    
                </td>
                </tr>

            </table>



            <center>
                <p style="color:red"><br><br>NOTA: Todos los campos indicados en rojo deben ser llenados</p>

            <html:submit styleClass="btn btn-primary">Registrarse</html:submit>
            </center>
        </fieldset>
</html:form>

</div>
<div id="sidebar-first">
    <ul>

    </ul>

    <div id="datos_persona" style="margin-bottom:20px; display:none">

    </div>
