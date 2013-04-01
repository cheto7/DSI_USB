<%-- 
    Document   : form-edit-content-admin
    Created on : 06/03/2013, 09:31:12 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<legend>Datos del usuario</legend>

<h1 style="display: inline">Nombre de usuario:</h1> 
<bean:write name="Usuario" property="usuario"/><br>


<html:form action = "/EditarAdmin" styleId="Form" onsubmit = "return (this)">
    <html:hidden name="Usuario" property="usuario"/>
    <%--<html:hidden name="Usuario" property="administrador"/>--%>
    <html:hidden name="Usuario" property="habilitado"/>
    <html:hidden name="autenticado" property="usuario"/>
    
    <h1 style="display: inline"><br>Nombres:</h1> 
    <html:text name="Usuario" property="nombre"></html:text><br>
    
    <h1 style="display: inline"><br>Apellidos:</h1> 
    <html:text name="Usuario" property="apellido"></html:text><br>
    
    <h1 style="display: inline"><br>Fecha de nacimiento: </h1>
    <html:text name="Usuario" property="fecha"></html:text><br>
    
    <h1 style="display: inline"><br>Sexo: </h1>
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
    
    <%--<h1 style="display: inline"><br>Password: </h1>
    <html:password name="Usuario" property="password" styleId="password"></html:password><br>--%>
    
    <h1 style="display: inline"><br>Correo electrónico alternativo:</h1>
    <html:text name="Usuario" property="email"></html:text><br>
    
    <h1 style="display: inline"><br>Teléfono: </h1>
    <html:text name="Usuario" property="telefono"></html:text><br>
    
    <h1><br>Dirección: </h1>
    <html:textarea name="Usuario" property="direccion" rows="5" styleId="dir" styleClass="span5"></html:textarea><br>    
    <br/>

    <legend>Tallas corporales:</legend>
    <h1 style="display: inline">Talla de Máscara:</h1>
    <html:select name="Usuario" property="talla_mascara">
        <option>
            <bean:write name="Usuario" property="talla_mascara"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
    <br>
    
    <h1 style="display: inline">Talla de Camisa:</h1>
    <html:select name="Usuario" property="talla_camisa">
        <option>
            <bean:write name="Usuario" property="talla_camisa"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
    <br>
    <h1 style="display: inline">Talla de Pantalón:</h1>
    <html:select name="Usuario" property="talla_pantalon">
        <option>
            <bean:write name="Usuario" property="talla_pantalon"></bean:write>
        </option>
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
    <br>
    <h1 style="display: inline">Talla de Guantes:</h1>
    <html:select name="Usuario" property="talla_guantes">
        <option>
            <bean:write name="Usuario" property="talla_guantes"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
    <br>
    <h1 style="display: inline">Talla de Zapato:</h1>
    <html:select name="Usuario" property="talla_zapato">
        <option>
            <bean:write name="Usuario" property="talla_zapato"></bean:write>
        </option>
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
    <legend>Área laboral:</legend>
    <html:select name="Usuario" property="area_laboral" styleClass="span3" >
        <option>
            <bean:write name="Usuario" property="area_laboral"></bean:write>
        </option>
        <option>Administrativa</option>
        <option>Académica</option>
        <option>Bombero</option>
        <option>Obrero</option> 
    </html:select>
        
    <legend>Permisos:</legend>
    <html:select name="Usuario" property="administrador" styleClass="span3" >
        <option>
            <bean:write name="Usuario" property="administrador"></bean:write>
        </option>
        <option>Usuario</option>
        <option>Supervisor</option>
        <option>Inspector</option>
        <option>Administrador</option> 
    </html:select>

    <br>
    <br>
    <center>
        <html:submit styleClass="btn btn-primary">Modificar</html:submit>
    </center>
</html:form>