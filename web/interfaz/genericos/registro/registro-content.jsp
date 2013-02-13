<%-- 
    Document   : registro-content
    Created on : Nov 3, 2012, 11:03:42 PM
    Author     : sibs
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

<html:form styleId="Form" method="POST" action="/Verificar?method=save" onsubmit="return (this)">
    <fieldset>
        <legend>Registro de Usuarios</legend>

        <label style="color:red">USB-ID:</label>
        <html:text name="Usuario" property="usuario" styleId="usbid"></html:text>
            <span class="help-block">Ejemplo: usuario@usb.ve</span>

            <label style="color:red" >Contraseña:</label>
        <html:password name="Usuario" property="password" styleId="password"></html:password>

            <label style="color:red">Confirmar Contraseña:</label>
            <input id="confirm_password" type="password" class="text" name="confirm_password" placeholder="Confirmar Contraseña" title="Ingrese su contraseña"/>
            <br>

            <label style="color:red">Datos Personales:</label>
            <div class="controls controls-row">
            <html:text name="Usuario" property="nombre" styleId="nombre" styleClass="span2"></html:text>
            <html:text name="Usuario" property="apellido" styleId="apellido" styleClass="span2"></html:text>
            </div>

            <label>Correo electrónico alternativo:</label>
        <html:text name="Usuario" property="email" styleId="email"></html:text>
            <span class="help-block">Ejemplo: usuario@gmail.com</span>

            <label>Fecha de Nacimiento</label>
        <html:text name="Usuario" property="fecha" styleId="fechanac"></html:text>
            <span class="help-block">Ejemplo: 16/07/89 </span>   

            <label>Teléfono</label>
        <html:text name="Usuario" property="telefono" styleId="tele"></html:text>

            <label>Dirección:</label>
        <html:textarea name="Usuario" property="direccion" rows="5" styleId="dir" styleClass="span5" ></html:textarea>

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
        <br/>


        <legend style="color:red">Talla de equipos:</legend>

        <label>Talla de Máscara:</label>
        <html:select name="Usuario" property="talla_mascara" styleClass="span1">
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option> 
        </html:select>

        <label>Talla de Camisa:</label>
        <html:select name="Usuario" property="talla_camisa" styleClass="span1">
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
        </html:select>

        <label>Talla de Pantalón:</label>
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

        <label>Talla de Guantes:</label>
        <html:select name="Usuario" property="talla_guantes" styleClass="span1">
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
        </html:select>

        <label>Talla de Zapato:</label>
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
            
        <legend style="color:red">Área laboral:</legend>
        <html:select name="Usuario" property="area_laboral" styleClass="span1" style="width: 5">
            <option value="administrativo">Administrativa</option>
            <option value="academico">Académica</option>
            <option value="bombero">Bombero</option>
            <option value="obrero">Obrero</option> 
        </html:select>

        <br />
        <p style="color:red">NOTA: Todos los campos indicados en rojo deben ser llenados</p>
        <html:submit>Registrarse</html:submit>
        </fieldset>
</html:form>   

</div>
<div id="sidebar-first">
    <ul>

    </ul>

    <div id="datos_persona" style="margin-bottom:20px; display:none">

    </div>