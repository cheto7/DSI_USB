<%-- 
    Document   : form-edit-admin-content
    Created on : Nov 4, 2012, 3:28:21 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<legend>Editar información usuario</legend>
<legend>Datos Personales</legend> 

<h1 style="display: inline">Usuario: </h1><bean:write name="autenticado" property="usuario"/><br><br>
<h1 style="display: inline">Nombre: </h1><bean:write name="autenticado" property="nombre"/><br><br>
<h1 style="display: inline">Apellido: </h1><bean:write name="autenticado" property="apellido"/><br><br>

<html:form action = "/EditarAdmin" onsubmit = "return (this)">
    <html:hidden name="autenticado" property="usuario"/>
    <label>Password</label><html:password name="autenticado" property="password"></html:password><br>
    <label>Correo electrónico alternativo:</label><html:text name="autenticado" property="email"></html:text><br>
    <label>Telèfono</label><html:text name="autenticado" property="telefono"></html:text><br>  
    <label>Dirección</label><html:textarea name="autenticado" property="direccion" rows="5" ></html:textarea><br>
        <br />

        <legend>Talla de equipos:</legend>
        <label>Talla de Máscara:</label>
    <html:select name="autenticado" property="talla_mascara">

        <option>
            <bean:write name="autenticado" property="talla_mascara"></bean:write>
            </option>

            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
    </html:select>
    <br>
    <label>Talla de Camisa:</label>
    <html:select name="autenticado" property="talla_camisa">
        <option>
            <bean:write name="autenticado" property="talla_camisa"></bean:write>
            </option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
    </html:select>
    <br>
    <label>Talla de Pantalón:</label>
    <html:select name="autenticado" property="talla_pantalon">
        <option>
            <bean:write name="autenticado" property="talla_pantalon"></bean:write>
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
    <label>Talla de Guantes:</label>
    <html:select name="autenticado" property="talla_guantes">
        <option>
            <bean:write name="autenticado" property="talla_guantes"></bean:write>
            </option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
    </html:select>
    <br>
    <label>Talla de Zapato:</label>
    <html:select name="autenticado" property="talla_zapato">
        <option>
            <bean:write name="autenticado" property="talla_zapato"></bean:write>
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

    <br>
    <html:submit> Modificar </html:submit>
</html:form>