/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import java.sql.Connection;
import Clases.*;
import java.sql.*;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author smaf
 */
public class DBMS {

    static private Connection conexion;

    protected DBMS() {
    }
    static private DBMS instance = null;

    static public DBMS getInstance() {
        if (null == DBMS.instance) {
            DBMS.instance = new DBMS();
        }
        conectar();
        return DBMS.instance;
    }

    public static boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://localhost/dsi_usb",
                    "dsisistema",
                    "dsisistema");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    public ArrayList< ArrayList< String_Cheto>> consultarSolicitudes(ListadoGeneral lg) {
        ArrayList< ArrayList< String_Cheto>> res = new ArrayList< ArrayList<String_Cheto>>(0);
        String q = "";
        ArrayList<String_Cheto> q1 = new ArrayList<String_Cheto>(0);
        if (lg.getOrganizadoPor().equals("usuario")) {
            q += "select u.usuario as USBID, u.nombre as Nombre, u.apellido as Apellido,"
                    + " e.nombre_vista as Equipo, c.talla as Talla, c.cantidad as Cantidad ";
            q1.add(new String_Cheto("USBID"));
            q1.add(new String_Cheto("Nombre"));
            q1.add(new String_Cheto("Apellido"));
            q1.add(new String_Cheto("Equipo"));
            q1.add(new String_Cheto("Talla"));
            q1.add(new String_Cheto("Cantidad"));
            res.add(q1);
        } else if (lg.getOrganizadoPor().equals("equipo")) {
            q += "select e.nombre_vista as Equipo, c.talla as Talla, SUM(c.cantidad) as Cantidad ";
            q1.add(new String_Cheto("Equipo"));
            q1.add(new String_Cheto("Talla"));
            q1.add(new String_Cheto("Cantidad"));
            res.add(q1);
        }
        q += "from \"PREPAS\".solicitud as s, \"PREPAS\".contiene as c, \"PREPAS\".equipo as e, "
                + "\"PREPAS\".usuario as u ";
        q += "where c.id = s.id and c.serial = e.serial and u.usuario = s.usuario ";

        if ((lg.getPeriodo().equals("todos") == false)) {
            q += "and s.id_periodo = \'" + lg.getPeriodo() + "\' ";
        }

        if (!(lg.getEquipo().equals(""))) {
            q += "and e.nombre_vista ilike \'" + lg.getEquipo() + "\' ";
        }
        if (!(lg.getUsuario().equals(""))) {
            q += "and u.usuario ilike \'" + lg.getUsuario() + "\' "; // ignoreCase
        }
        if (!(lg.getSexo().equals(""))) {
            q += "and u.sexo = \'" + lg.getSexo() + "\' ";
        }
        if (!(lg.getTipo().equals(""))) {
            q += "and u.area_laboral ilike \'" + lg.getTipo() + "\' ";
        }
        if (lg.getOrganizadoPor().equals("usuario")) {
            q += "order by  u.usuario";
        } else if (lg.getOrganizadoPor().equals("equipo")) {
            q += "group by e.nombre_vista, c.talla ";
        }
        q += ";";
        try {
            Statement stmt = conexion.createStatement();
            System.out.println(q);
            ResultSet rs = stmt.executeQuery(q);

            while (rs.next()) {
                ArrayList<String_Cheto> a = new ArrayList<String_Cheto>(0);
                for (int i = 0; i < res.get(0).size(); i++) {
                    a.add(new String_Cheto(rs.getString(res.get(0).get(i).getValue())));
                }
                res.add(a);
            }
            return res;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return res;
    }


    /*
     * Para el Login se consulta el usuario con la base de datos y si existe,
     * entra al sitio.
     * Se encripta la contrasena!
     */
    public Boolean consultarUsuario(Usuario u) {
        String sqlquery = "SELECT password = crypt('" + u.getPassword() + "',password)"
                + "AS contrasena FROM \"PREPAS\".usuario"
                + " WHERE usuario ='" + u.getUsuario() + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            rs.next();
            return rs.getBoolean("contrasena");
        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /*
     * Consulta si al momento de registrarse el nombre de usuario ya se
     * encuentra en uso.
     */
    public Boolean existeUsuario(Usuario u) {

        String sqlquery = "SELECT * FROM \"PREPAS\".usuario"
                + " WHERE usuario ='" + u.getUsuario() + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /*
     * Consulta si al momento de registrarse la cedula ya existe
     */
    public Boolean existeCedula(Usuario u) {

        String sqlquery = "SELECT * FROM \"PREPAS\".usuario"
                + " WHERE ci ='" + u.getCi() + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    /*
     * Consulta si al momento de registrarse la cedula ya existe
     */

    public Boolean existeCorreo(Usuario u) {

        String sqlquery = "SELECT * FROM \"PREPAS\".usuario"
                + " WHERE email ='" + u.getEmail() + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean agregarEquipo(Equipo e) {
        try {
            String sqlquery;
            sqlquery = "INSERT INTO \"PREPAS\".equipo (tipo, imagen, nombre_vista, "
                    + "cantidad,funcionalidad,tiempo_vida,"
                    + "sector,norma,tipo_talla)  VALUES "
                    + "('" + e.getTipo() + "' , '" + e.getImagen()
                    + "' , '" + e.getNombre_vista() + "' , '0', '"
                    + e.getFuncionalidad()
                    + "' , '" + e.getVida_util()+" "+e.getTalla() + "' , '" + e.getSector()
                    + "' , '" + e.getNorma() + "' , '" + e.getTipo_talla() + "')";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    private String fechaActual(){
        Calendar c = new GregorianCalendar(); 
        String dia, mes, annio;
	dia = Integer.toString(c.get(Calendar.DATE));
	mes = Integer.toString(c.get(Calendar.MONTH));
	annio = Integer.toString(c.get(Calendar.YEAR));
        return dia+"-"+mes+"-"+annio;
    }

    public Boolean agregarNoticia(Noticia n) {
        try {
            String sqlquery;
          
            sqlquery = "INSERT INTO \"PREPAS\".noticia (usuario,titulo,contenido,fechaNoticia) VALUES "
                    + "('" + n.getUsuario() + "' , '" + n.getTitulo()
                    + "' , '" + n.getContenido() + "' , '"+ n.getFechaNoticia()+"')";                               
            
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Noticia> obtenerNoticias() {
        ArrayList<Noticia> noticias = new ArrayList<Noticia>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".noticia ORDER BY id DESC";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Noticia n = new Noticia();
                n.setUsuario(rs.getString("usuario"));
                n.setTitulo(rs.getString("titulo"));
                n.setContenido(rs.getString("contenido"));
                n.setFechaNoticia(rs.getString("fechaNoticia"));
                noticias.add(n);
            }
            return noticias;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return noticias;
    }

    public ArrayList<Equipo> obtenerEquipos() {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".equipo WHERE habilitado = 'true'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setImagen(rs.getString("imagen"));
                e.setTipo(rs.getString("tipo"));
                e.setCantidad(Integer.parseInt(rs.getString("cantidad")));
                e.setEvaluacion(Double.parseDouble(rs.getString("evaluacion")));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setSerial(Integer.parseInt(rs.getString("serial")));
                e.setNorma(rs.getString("norma"));
                e.setSector(rs.getString("sector"));
                e.setVida_util(rs.getString("tiempo_vida"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public void editarNoticia(Noticia n) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".noticia SET "
                    + "titulo = '" + n.getTitulo() + "' , "
                    + "contenido = '" + n.getContenido() + "'"
                    + " WHERE usuario = '" + n.getUsuario() + "'"
                    + " AND titulo = '" + n.getTituloAnterior() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editarEquipo(Equipo e) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".equipo SET "
                    + "nombre_vista = '" + e.getNombre_vista() + "' , "
                    + "tipo = '" + e.getTipo() + "' , "
                    + "imagen = '" + e.getImagen() + "' , "
                    + "sector = '" + e.getSector() + "' , "
                    + "tiempo_vida = '" + e.getVida_util() +" "+e.getTalla()+ "' , "
                    + "norma = '" + e.getNorma() + "' , "
                    + "tipo_talla = '" + e.getTipo_talla() + "' , "
                    + "funcionalidad = '" + e.getFuncionalidad() + "'"
                    + " WHERE serial = '" + e.getSerial() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void eliminarNoticia(Noticia n) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".noticia WHERE "
                    + "usuario = '" + n.getUsuario() + "' "
                    + "AND titulo = '" + n.getTitulo() + "' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void eliminarEquipo(Equipo e) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".equipo SET "
                    + "habilitado = 'false' WHERE "
                    + "serial = '" + e.getSerial() + "' ;";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    /*
     * Retorna todos los atributos del usuario a consultar.
     */
    public Usuario atributosUsuario(Usuario us) {

        Usuario u = new Usuario();
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE usuario = '" + us.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
                       
            rs.next();
            u.setUsuario(rs.getString("usuario"));
            u.setPassword(rs.getString("password"));
            u.setTelefono(rs.getString("telefono"));
            u.setNombre(rs.getString("nombre"));
            u.setApellido(rs.getString("apellido"));
            u.setEmail(rs.getString("email"));
            u.setFecha(rs.getString("fecha"));
            u.setSexo(rs.getString("sexo"));
            u.setTalla_mascara(rs.getString("talla_mascara"));
            u.setTalla_camisa(rs.getString("talla_camisa"));
            u.setTalla_pantalon(rs.getString("talla_pantalon"));
            u.setTalla_guantes(rs.getString("talla_guantes"));
            u.setTalla_zapato(rs.getString("talla_zapato"));
            u.setHabilitado(rs.getString("habilitado"));
            u.setAdministrador(rs.getString("administrador"));
            u.setArea_laboral(rs.getString("area_laboral"));
            u.setUnidad_adscripcion(rs.getString("unidad_adscripcion"));
            u.setCi(rs.getString("ci"));
            u.setCargo(rs.getString("cargo"));

            System.out.println("AREA LABORAAAL= "+u.getArea_laboral());
            return u;

        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return u;
    }
    
    
    /*
     * Retorna todos los atributos del usuario a consultar.
     */
    public Usuario atributosUsuarioSinPass(Usuario us) {

        Usuario u = new Usuario();
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE usuario = '" + us.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
                       
            rs.next();
            u.setUsuario(rs.getString("usuario"));
            u.setTelefono(rs.getString("telefono"));
            u.setNombre(rs.getString("nombre"));
            u.setApellido(rs.getString("apellido"));
            u.setEmail(rs.getString("email"));
            u.setFecha(rs.getString("fecha"));
            u.setSexo(rs.getString("sexo"));
            u.setTalla_mascara(rs.getString("talla_mascara"));
            u.setTalla_camisa(rs.getString("talla_camisa"));
            u.setTalla_pantalon(rs.getString("talla_pantalon"));
            u.setTalla_guantes(rs.getString("talla_guantes"));
            u.setTalla_zapato(rs.getString("talla_zapato"));
            u.setHabilitado(rs.getString("habilitado"));
            u.setAdministrador(rs.getString("administrador"));
            u.setArea_laboral(rs.getString("area_laboral"));
            u.setUnidad_adscripcion(rs.getString("unidad_adscripcion"));
            u.setCi(rs.getString("ci"));
            u.setCargo(rs.getString("cargo"));
            return u;

        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
        }
        return u;
    }    

    /*
     * Agrega un usuario a la base de datos.
     */
    public Boolean agregarUsuario(Usuario u) {
        try {
            String sqlquery;
            sqlquery = "INSERT INTO \"PREPAS\".usuario VALUES "
                    + "('" + u.getUsuario() + "' , crypt('" + u.getPassword() + "', gen_salt('bf'))"
                    + " , '" + u.getEmail() + "' , '" + u.getNombre()
                    + "' , '" + u.getApellido() + "' , '" + u.getCi() + "', '" + u.getFecha()
                    + "' , '" + u.getTelefono() + "' , '" + u.getUnidad_adscripcion()
                    + "' , '" + u.getSexo() + "' , '" + u.getTalla_mascara()
                    + "' , '" + u.getTalla_camisa() + "' , '" + u.getTalla_pantalon()
                    + "' , '" + u.getTalla_guantes()
                    + "' , '" + u.getTalla_zapato()
                    + "' , '" + "false"
                    + "' , '" + "usuario"
                    + "' , '" + u.getArea_laboral() + "', '" + u.getCargo() + "' )";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /*
     * Elimina un usuario de la base de datos
     */
    public Boolean eliminarUsuario(Usuario u) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".solicitud WHERE "
                    + "usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);


            sqlquery = "DELETE FROM \"PREPAS\".usuario WHERE "
                    + "usuario = '" + u.getUsuario() + "'";
            stmt = conexion.createStatement();
            System.out.println(sqlquery);
            i = stmt.executeUpdate(sqlquery);

            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /*
     * Consulta todos los usuarios habilitado existentes en la base de datos
     */
    public ArrayList<Usuario> consultarUsuariosHabilitados(Usuario admin) {
        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE usuario != '" + admin.getUsuario() + "' ";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                if (rs.getBoolean("habilitado")) {
                    Usuario u = new Usuario();
                    u.setUsuario(rs.getString("usuario"));
                    u.setCi(rs.getString("ci"));
                    u.setUnidad_adscripcion(rs.getString("unidad_adscripcion"));
                    u.setPassword(rs.getString("password"));
                    u.setTelefono(rs.getString("telefono"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApellido(rs.getString("apellido"));
                    u.setEmail(rs.getString("email"));
                    u.setFecha(rs.getString("fecha"));
                    u.setSexo(rs.getString("sexo"));
                    u.setTalla_mascara(rs.getString("talla_mascara"));
                    u.setTalla_camisa(rs.getString("talla_camisa"));
                    u.setTalla_pantalon(rs.getString("talla_pantalon"));
                    u.setTalla_guantes(rs.getString("talla_guantes"));
                    u.setTalla_zapato(rs.getString("talla_zapato"));
                    u.setHabilitado(rs.getString("habilitado"));
                    u.setAdministrador(rs.getString("administrador"));
                    u.setArea_laboral(rs.getString("area_laboral"));
                    u.setCargo(rs.getString("cargo"));
                    usrs.add(u);
                }
            }
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return usrs;
    }

    /*
     * Consulta todos los usuarios habilitado existentes en la base de datos
     */
    public ArrayList<Usuario> consultarUsuariosNoHabilitados(Usuario admin) {
        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE usuario != '" + admin.getUsuario() + "' ";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                if (!rs.getBoolean("habilitado")) {
                    Usuario u = new Usuario();
                    u.setUsuario(rs.getString("usuario"));
                    u.setCi(rs.getString("ci"));
                    u.setUnidad_adscripcion(rs.getString("unidad_adscripcion"));
                    u.setPassword(rs.getString("password"));
                    u.setTelefono(rs.getString("telefono"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApellido(rs.getString("apellido"));
                    u.setEmail(rs.getString("email"));
                    u.setFecha(rs.getString("fecha"));
                    u.setSexo(rs.getString("sexo"));
                    u.setTalla_mascara(rs.getString("talla_mascara"));
                    u.setTalla_camisa(rs.getString("talla_camisa"));
                    u.setTalla_pantalon(rs.getString("talla_pantalon"));
                    u.setTalla_guantes(rs.getString("talla_guantes"));
                    u.setTalla_zapato(rs.getString("talla_zapato"));
                    u.setHabilitado(rs.getString("habilitado"));
                    u.setAdministrador(rs.getString("administrador"));
                    u.setArea_laboral(rs.getString("area_laboral"));
                    u.setCargo(rs.getString("cargo"));
                    usrs.add(u);
                }
            }
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return usrs;
    }

    /*
     * Consulta todos los usuarios supervisores existentes en la base de datos
     */
    public ArrayList<Usuario> consultarSupervisores() {
        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE administrador = 'supervisor' ";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                if (rs.getBoolean("habilitado")) {
                    Usuario u = new Usuario();
                    u.setUsuario(rs.getString("usuario"));
                    u.setCi(rs.getString("ci"));
                    u.setHabilitado(rs.getString("habilitado"));
                    usrs.add(u);
                }
            }
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return usrs;
    }

    /*
     * Consulta todos los usuarios inspectores existentes en la base de datos
     */
    public ArrayList<Usuario> consultarInspectores() {
        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE administrador = 'inspector' ";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                if (rs.getBoolean("habilitado")) {
                    Usuario u = new Usuario();
                    u.setUsuario(rs.getString("usuario"));
                    u.setCi(rs.getString("ci"));
                    u.setHabilitado(rs.getString("habilitado"));
                    usrs.add(u);
                }
            }
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return usrs;
    }

    /*
     * Consulta todos los usuarios Sin Privilegios existentes en la base de datos
     */
    public ArrayList<Usuario> consultarUsuariosSinPermisos() {
        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".usuario "
                    + "WHERE administrador != 'inspector' "
                    + "AND administrador != 'supervisor' "
                    + "AND administrador != 'administrador' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                if (rs.getBoolean("habilitado")) {
                    Usuario u = new Usuario();
                    u.setUsuario(rs.getString("usuario"));
                    u.setCi(rs.getString("ci"));
                    u.setHabilitado(rs.getString("habilitado"));
                    usrs.add(u);
                }
            }
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return usrs;
    }

    /*
     * Habilita un usuario.
     */
    public Boolean habilitar(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "habilitado = 'true' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /*
     * Deshabilita un usuario.
     */
    public Boolean deshabilitar(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "habilitado = 'false' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /*
     * Otorgar Permisos de Supervisor
     */
    public Boolean serSupervisor(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "administrador = 'supervisor' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    /*
     * Otorgar Permisos de Usuario
     */

    public Boolean serUsuario(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "administrador = 'usuario' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
     * Otorgar Permisos de Administrador
     */
    public Boolean serAdministrador(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "administrador = 'administrador' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /*
     * Otorgar Permisos de Supervisor
     */
    public Boolean serInspector(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "administrador = 'inspector' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean removerPrivilegios(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "administrador = 'usuario' "
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    /*
     * Modifica un usuario existente en la base de datos.
     */
    public Boolean modificarUsuario(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    //+ "password = '" + u.getPassword() + "' , "
                    + "password = crypt('" + u.getPassword() + "', gen_salt('bf')), "
                    + "cargo = '" + u.getCargo() + "' , "
                    + "telefono = '" + u.getTelefono() + "' , "
                    + "administrador = '" + u.getAdministrador() + "' , "
                    + "email = '" + u.getEmail() + "' , "
                    + "unidad_adscripcion = '" + u.getUnidad_adscripcion() + "' , "
                    + "talla_mascara = '" + u.getTalla_mascara() + "' , "
                    + "talla_camisa = '" + u.getTalla_camisa() + "' , "
                    + "talla_pantalon = '" + u.getTalla_pantalon() + "' , "
                    + "talla_guantes = '" + u.getTalla_guantes() + "' , "
                    + "area_laboral = '" + u.getArea_laboral() + "' , "
                    + "talla_zapato = '" + u.getTalla_zapato() + "'"
                    + "WHERE usuario = '" + u.getUsuario() + "'";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    
    /*
     * Modifica un usuario existente en la base de datos sin cambiar passwd.
     */
    public Boolean modificarUsuarioSinPas(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "cargo = '" + u.getCargo() + "' , "
                    + "telefono = '" + u.getTelefono() + "' , "
                    + "administrador = '" + u.getAdministrador() + "' , "
                    + "email = '" + u.getEmail() + "' , "
                    + "unidad_adscripcion = '" + u.getUnidad_adscripcion() + "' , "
                    + "talla_mascara = '" + u.getTalla_mascara() + "' , "
                    + "talla_camisa = '" + u.getTalla_camisa() + "' , "
                    + "talla_pantalon = '" + u.getTalla_pantalon() + "' , "
                    + "talla_guantes = '" + u.getTalla_guantes() + "' , "
                    + "area_laboral = '" + u.getArea_laboral() + "' , "
                    + "talla_zapato = '" + u.getTalla_zapato() + "'"
                    + "WHERE usuario = '" + u.getUsuario() + "'";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }    
    
    public Mensaje modificarMensaje(Mensaje m) {
        Mensaje me = null;
        try {
            String sqlquery = "UPDATE \"PREPAS\".mensaje SET "
                    + "mensaje = '" + m.getMensaje() + "' "
                    + "WHERE id = '" + m.getId() + "'";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            me = this.obtenerMensaje(m);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return me;
    }
    
    public Mensaje obtenerMensaje(Mensaje m) {
        Mensaje me = null;
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".mensaje"
                    + " WHERE id = '" + m.getId() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                me = new Mensaje();
                me.setId(rs.getString("id"));
                me.setMensaje(rs.getString("mensaje"));
            }
            return me;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return me;
    }

    /*
     * Modifica un usuario existente en la base de datos.
     */
    public Boolean modificarUsuarioSinPassword(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    + "cargo = '" + u.getCargo() + "' , "
                    + "telefono = '" + u.getTelefono() + "' , "
                    + "administrador = '" + u.getAdministrador() + "' , "
                    + "email = '" + u.getEmail() + "' , "
                    + "unidad_adscripcion = '" + u.getUnidad_adscripcion() + "' , "
                    + "talla_mascara = '" + u.getTalla_mascara() + "' , "
                    + "talla_camisa = '" + u.getTalla_camisa() + "' , "
                    + "talla_pantalon = '" + u.getTalla_pantalon() + "' , "
                    + "talla_guantes = '" + u.getTalla_guantes() + "' , "
                    + "talla_zapato = '" + u.getTalla_zapato() + "'"
                    + "WHERE usuario = '" + u.getUsuario() + "'";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Solicitud> obtenerSolicitudes(Usuario u) {
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".solicitud"
                    + " WHERE usuario = '" + u.getUsuario() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Solicitud n = new Solicitud();
                n.setNombre_usuario(rs.getString("usuario"));
                n.setId(rs.getInt("id"));
                n.setFecha_solicitud(rs.getString("fecha_solicitud"));
                n.setModificada(rs.getString("modificada"));
                solicitudes.add(n);
            }
            return solicitudes;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return solicitudes;
    }

    /*
     * Elimina ciertos elementos de la solicitud.
     */
    public Boolean eliminarSolicitud(Solicitud s) {
        try {
            String sqlquery;
            sqlquery = "DELETE FROM \"PREPAS\".solicitud"
                    + " WHERE usuario = '" + s.getNombre_usuario()
                    + "' AND equipo ='" + s.getNombre_equipo() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;

        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean eliminarSolicitudCompleta(String usuario) {
        try {
            String sqlquery;
            sqlquery = "DELETE FROM \"PREPAS\".solicitud"
                    + " WHERE usuario = '" + usuario
                    + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;

        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Solicitud> obtenerPedido(String usuario) {
        ArrayList<Solicitud> pedido = new ArrayList<Solicitud>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".solicitud"
                    + " WHERE usuario = '" + usuario
                    + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Solicitud eps = new Solicitud();
                eps.setNombre_vista(rs.getString("nombre_vista"));
                eps.setCantidad(rs.getString("cantidad"));
                pedido.add(eps);
            }
            return pedido;

        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return null;
    }

    /*
     * public ArrayList<String> obtenerPedidoCompleto(String usuario) {
     * ArrayList<String> pedido = new ArrayList<String>(0); try { String
     * sqlquery; sqlquery = "SELECT nombre_vista, talla, cantidad FROM (" +
     * "SELECT nombre_vista, talla_pantalon AS talla, SUM(cantidad) AS cantidad,
     * tipo " + " FROM \"PREPAS\".solicitud NATURAL JOIN \"PREPAS\".usuario
     * NATURAL JOIN \"PREPAS\".equipo " + " WHERE tipo = 'pantalon' " + " GROUP
     * BY nombre_vista, talla_pantalon, tipo " + "UNION " + "SELECT
     * nombre_vista, talla_camisa AS talla, SUM(cantidad) AS cantidad, tipo " +
     * " FROM \"PREPAS\".solicitud NATURAL JOIN \"PREPAS\".usuario NATURAL JOIN
     * \"PREPAS\".equipo " + " WHERE tipo = 'camisa'" + " GROUP BY nombre_vista,
     * talla_camisa, tipo " + "UNION " + "SELECT nombre_vista, '' AS talla,
     * SUM(cantidad) AS cantidad, tipo " + " FROM \"PREPAS\".solicitud NATURAL
     * JOIN \"PREPAS\".usuario NATURAL JOIN \"PREPAS\".equipo " + " WHERE tipo =
     * 'otros' " + " GROUP BY nombre_vista, tipo " + "UNION " + "SELECT
     * nombre_vista, talla_mascara AS talla, SUM(cantidad) AS cantidad, tipo " +
     * " FROM \"PREPAS\".solicitud NATURAL JOIN \"PREPAS\".usuario NATURAL JOIN
     * \"PREPAS\".equipo " + " WHERE tipo = 'cabeza' " + " GROUP BY
     * nombre_vista, talla_mascara, tipo " + "UNION " + "SELECT nombre_vista,
     * talla_guantes AS talla, SUM(cantidad) AS cantidad, tipo " + " FROM
     * \"PREPAS\".solicitud NATURAL JOIN \"PREPAS\".usuario NATURAL JOIN
     * \"PREPAS\".equipo " + " WHERE tipo = 'guantes' " + " GROUP BY
     * nombre_vista, talla_guantes, tipo " + "UNION " + "SELECT nombre_vista,
     * talla_zapato AS talla, SUM(cantidad) AS cantidad, tipo " + " FROM
     * \"PREPAS\".solicitud NATURAL JOIN \"PREPAS\".usuario NATURAL JOIN
     * \"PREPAS\".equipo " + " WHERE tipo = 'zapato' " + " GROUP BY
     * nombre_vista, talla_zapato, tipo ) d " + " GROUP BY tipo, talla,
     * cantidad, nombre_vista ORDER BY tipo, talla";
     *
     * System.out.println(sqlquery);
     *
     * Statement stmt = conexion.createStatement();
     * System.out.println(sqlquery); ResultSet rs = stmt.executeQuery(sqlquery);
     *
     * while (rs.next()) { String eps; eps = rs.getString("nombre_vista");
     * pedido.add(eps); eps = rs.getString("talla"); pedido.add(eps); eps =
     * rs.getString("cantidad"); pedido.add(eps); }
     *
     *
     * return pedido;
     *
     * } catch (SQLException ex) { System.out.println("EXCEPCION");
     * ex.printStackTrace(); } return null;
     }
     */
    public Boolean existeSolicitud(String usuario, String equipo) {

        String sqlquery = "SELECT * FROM \"PREPAS\".solicitud"
                + " WHERE usuario ='" + usuario + "' "
                + "AND equipo = '" + equipo + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public String obtenerFecha() {

        String sqlquery = "SELECT CURRENT_DATE";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            if (rs.next()) {
                String f = rs.getString("date");
                return f;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public ArrayList<Integer> usuarioPedido(String usuario) {

        ArrayList<Integer> cantidades = new ArrayList();
        try {
            String sqlquery = "SELECT cantidad FROM ("
                    + "SELECT usuario, nombre_vista, cantidad, tipo "
                    + "FROM \"PREPAS\".solicitud NATURAL JOIN \"PREPAS\".usuario "
                    + "NATURAL JOIN \"PREPAS\".equipo "
                    + "GROUP BY usuario, nombre_vista, cantidad, tipo "
                    + "ORDER BY tipo, nombre_vista) AS d";

            System.out.println(sqlquery);
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Integer eps;
                eps = Integer.parseInt(rs.getString("cantidad"));
                cantidades.add(eps);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<Equipo> consultarMateriales() {

        ArrayList<Equipo> equipos = new ArrayList();

        try {
            String sqlquery = "SELECT nombre_vista FROM \"PREPAS\".equipo";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return equipos;

    }

    public Boolean agregarProveedor(Proveedor p) {
        try {
            String sqlquery;
            sqlquery = "INSERT INTO \"PREPAS\".proveedor VALUES "
                    + "('" + p.getRif() + "' , '" + p.getNombre()
                    + "' , '" + p.getTelefono() + "' , '" + p.getEmail()
                    + "' , '" + p.getContacto() + "' , '" + p.getDireccion()
                    + "',  '" + p.getHabilitado() + "')";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Proveedor> obtenerProveedores() {
        ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".proveedor WHERE habilitado = 'true'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Proveedor p = new Proveedor();
                p.setRif(rs.getString("rif"));
                p.setNombre(rs.getString("nombre"));
                p.setTelefono(rs.getString("telefono"));
                p.setEmail(rs.getString("email"));
                p.setDireccion(rs.getString("direccion"));
                p.setContacto(rs.getString("contacto"));
                proveedores.add(p);
            }
            return proveedores;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return proveedores;
    }

    /*
     * Deshabilita un proveedor.
     */
    public Boolean eliminarProveedor(Proveedor p) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".proveedor SET "
                    + "habilitado = 'false' "
                    + " WHERE rif = '" + p.getRif() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public void editarProveedor(Proveedor p) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".proveedor SET "
                    + "rif = '" + p.getRif() + "' , "
                    + "nombre = '" + p.getNombre() + "' , "
                    + "telefono = '" + p.getTelefono() + "' , "
                    + "email = '" + p.getEmail() + "' , "
                    + "contacto = '" + p.getContacto() + "' , "
                    + "direccion = '" + p.getDireccion() + "'"
                    + " WHERE rif = '" + p.getRifAnterior() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Boolean existeProveedor(Proveedor p) {

        String sqlquery = "SELECT * FROM \"PREPAS\".proveedor"
                + " WHERE rif ='" + p.getRif() + "' ";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Equipo> obtenerEquiposPuntuacionUsuario(Usuario u) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            
            String sqlquery = "SELECT DISTINCT E.serial as serial,E.imagen as imagen,E.nombre_vista as nombre_vista,AUX.puntuacion + 1 as puntuacion,E.tipo_talla as tipo_talla \n" +
                                "FROM \"PREPAS\".equipo E, (SELECT TU.serial as serial, TU.usuario as usuario, P.puntuacion as puntuacion \n" +
                                                            "FROM (SELECT T.serial as serial, U.usuario as usuario "
                                                                   + "FROM \"PREPAS\".tiene T, \"PREPAS\".usuario U "
                                                                   + "WHERE T.usuario = U.usuario AND U.usuario = '"+ u.getUsuario() +"') as TU left join \"PREPAS\".puntuacion P \n" +
                                                            "ON P.serial = TU.serial AND TU.usuario = P.usuario) as AUX \n"
                              + "WHERE E.serial = AUX.serial\n";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                int aux = rs.getInt("puntuacion");
                // A las puntuaciones se le suma 1 para que el nulo quede como 0 y se pueda reconocer los que no tienen puntuacion.
                if(aux == 0){
                    e.setPuntuacion("Nulo");
                }else if(aux == 1){
                    e.setPuntuacion("Muy malo");
                }else if(aux == 2){
                    e.setPuntuacion("Malo");
                }else if(aux == 3){
                    e.setPuntuacion("Normal");
                }else if(aux == 4){
                    e.setPuntuacion("Bueno");
                }else if(aux == 5){
                    e.setPuntuacion("Muy bueno");
                }else if(aux == 6){
                    e.setPuntuacion("Excelente");
                }
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }
    
    public ArrayList<Equipo> obtenerEquiposSolicitudAcademico(Usuario u) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT serial,imagen,nombre_vista,funcionalidad,tipo_talla FROM \"PREPAS\".equipo "
                    + "WHERE habilitado='true' AND sector= 'academico' "
                    + "EXCEPT "
                    + "SELECT E.serial,E.imagen,E.nombre_vista,E.funcionalidad,E.tipo_talla "
                    + "FROM \"PREPAS\".solicitud S,\"PREPAS\".contiene C,\"PREPAS\".equipo E "
                    + "WHERE S.usuario = '" + u.getUsuario() + "' AND C.id=S.id AND E.serial=C.serial "
                    + "AND E.sector= 'academico' "
                    + "AND S.id_periodo IN (SELECT id FROM \"PREPAS\".periodo WHERE habilitado='true')";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public ArrayList<Equipo> obtenerEquiposSolicitudAdmin(Usuario u) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT serial,imagen,nombre_vista,funcionalidad,tipo_talla FROM \"PREPAS\".equipo "
                    + "WHERE habilitado='true' AND sector= 'administrativo' "
                    + "EXCEPT "
                    + "SELECT E.serial,E.imagen,E.nombre_vista,E.funcionalidad,E.tipo_talla "
                    + "FROM \"PREPAS\".solicitud S,\"PREPAS\".contiene C,\"PREPAS\".equipo E "
                    + "WHERE S.usuario = '" + u.getUsuario() + "' AND C.id=S.id AND E.serial=C.serial "
                    + "AND E.sector= 'administrativo' "
                    + "AND S.id_periodo IN (SELECT id FROM \"PREPAS\".periodo WHERE habilitado='true')";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public ArrayList<Equipo> obtenerEquiposSolicitudBombero(Usuario u) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT serial,imagen,nombre_vista,funcionalidad,tipo_talla FROM \"PREPAS\".equipo "
                    + "WHERE habilitado='true' AND sector= 'bombero' "
                    + "EXCEPT "
                    + "SELECT E.serial,E.imagen,E.nombre_vista,E.funcionalidad,E.tipo_talla "
                    + "FROM \"PREPAS\".solicitud S,\"PREPAS\".contiene C,\"PREPAS\".equipo E "
                    + "WHERE S.usuario = '" + u.getUsuario() + "' AND C.id=S.id AND E.serial=C.serial "
                    + "AND E.sector= 'bombero' "
                    + "AND S.id_periodo IN (SELECT id FROM \"PREPAS\".periodo WHERE habilitado='true')";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public ArrayList<Equipo> obtenerEquiposSolicitudObrero(Usuario u) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT serial,imagen,nombre_vista,funcionalidad,tipo_talla FROM \"PREPAS\".equipo "
                    + "WHERE habilitado='true' AND sector= 'obrero' "
                    + "EXCEPT "
                    + "SELECT E.serial,E.imagen,E.nombre_vista,E.funcionalidad,E.tipo_talla "
                    + "FROM \"PREPAS\".solicitud S,\"PREPAS\".contiene C,\"PREPAS\".equipo E "
                    + "WHERE S.usuario = '" + u.getUsuario() + "' AND C.id=S.id AND E.serial=C.serial "
                    + "AND E.sector= 'obrero' "
                    + "AND S.id_periodo IN (SELECT id FROM \"PREPAS\".periodo WHERE habilitado='true')";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public ArrayList<Equipo> obtenerEquiposSolicitudGenerico(Usuario u) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT serial,imagen,nombre_vista,funcionalidad,tipo_talla FROM \"PREPAS\".equipo "
                    + "WHERE habilitado='true' AND sector= 'generico' "
                    + "EXCEPT "
                    + "SELECT E.serial,E.imagen,E.nombre_vista,E.funcionalidad,E.tipo_talla "
                    + "FROM \"PREPAS\".solicitud S,\"PREPAS\".contiene C,\"PREPAS\".equipo E "
                    + "WHERE S.usuario = '" + u.getUsuario() + "' AND C.id=S.id AND E.serial=C.serial "
                    + "AND E.sector= 'generico' "
                    + "AND S.id_periodo IN (SELECT id FROM \"PREPAS\".periodo WHERE habilitado='true')";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public Solicitud agregarASolicitud(Usuario u) {
        try {
            Solicitud s = new Solicitud();
            String sqlquery;
            //Busca la ultima solicitud del usuario
            sqlquery = "SELECT S.id,S.usuario,S.fecha_solicitud,S.id_periodo "
                    + "FROM \"PREPAS\".solicitud S, \"PREPAS\".periodo P "
                    + "WHERE P.habilitado='true' AND P.id=S.id_periodo "
                    + "AND S.usuario = '" + u.getUsuario() + "' "
                    + "AND S.id IN (SELECT MAX(S1.id) "
                    + "FROM \"PREPAS\".solicitud S1, \"PREPAS\".periodo P1 "
                    + "WHERE P1.habilitado='true' AND P1.id=S1.id_periodo "
                    + "AND S1.usuario = '" + u.getUsuario() + "')";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            if (rs.next()) { // Si encontraste una devuelvela
                s.setNombre_usuario(rs.getString("usuario"));
                s.setFecha_solicitud(rs.getString("fecha_solicitud"));
                s.setId(rs.getInt("id"));
                s.setPeriodo(rs.getInt("id_periodo"));
                return s;
            } else {
                //Obtenemos id del periodo abierto

                sqlquery = "SELECT id FROM \"PREPAS\".periodo WHERE habilitado='true'";

                stmt = conexion.createStatement();
                System.out.println(sqlquery);
                rs = stmt.executeQuery(sqlquery);
                if (rs.next()) {
                    Integer idPeriodo = rs.getInt("id");

                    sqlquery = "INSERT INTO \"PREPAS\".solicitud (usuario, fecha_solicitud,id_periodo)  VALUES "
                            + "('" + u.getUsuario() + "' , (SELECT CURRENT_DATE), '" + idPeriodo + "')";
                    stmt = conexion.createStatement();
                    System.out.println(sqlquery);
                    stmt.executeUpdate(sqlquery);

                    sqlquery = "SELECT * FROM \"PREPAS\".solicitud WHERE usuario='"
                            + u.getUsuario() + "' AND id_periodo = '" + idPeriodo + "'";
                    rs = stmt.executeQuery(sqlquery);
                    rs.next();
                    s.setNombre_usuario(rs.getString("usuario"));
                    s.setFecha_solicitud(rs.getString("fecha_solicitud"));
                    s.setId(rs.getInt("id"));
                    s.setPeriodo(rs.getInt("id_periodo"));
                    return s;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void agregarAContiene(Equipo e, Solicitud s, String frecuencia, String cantidad) {
        try {
            String sqlquery;
            sqlquery = "INSERT INTO \"PREPAS\".contiene (id, serial,cantidad,talla,frecuencia)  VALUES "
                    + "('" + s.getId() + "' , '" + e.getSerial() + "' , '" + Integer.parseInt(cantidad) + "' , '"
                    + tallaAsociada(e.getTipo_talla(), s.getNombre_usuario()) + "' , ' "
                    + frecuencia + "')";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private String tallaAsociada(String tipo_talla, String usuario) throws SQLException {
        String sqlquery = "SELECT talla_mascara,talla_camisa,talla_pantalon, "
                + "talla_guantes,talla_zapato "
                + "FROM \"PREPAS\".usuario "
                + "WHERE usuario = '" + usuario + "'";
        System.out.println("tipo tallaaaaaaaaa: " + tipo_talla);
        try {
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            rs.next();
            if ("mascara".equals(tipo_talla)) {
                return rs.getString("talla_mascara");
            } else if ("camisa".equals(tipo_talla)) {
                return rs.getString("talla_camisa");
            } else if ("guantes".equals(tipo_talla)) {
                return rs.getString("talla_guantes");
            } else if ("pantalon".equals(tipo_talla)) {
                return rs.getString("talla_pantalon");
            } else if ("zapato".equals(tipo_talla)) {
                return rs.getString("talla_zapato");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return "No aplica";
    }

    private Integer transformaFrecuencia(String frecuencia) {
        if ("Diaria".equals(frecuencia)) {
            return 1;
        }
        if ("Semanal".equals(frecuencia)) {
            return 7;
        }
        if ("Mensual".equals(frecuencia)) {
            return 30;
        }
        if ("Trimestral".equals(frecuencia)) {
            return 60;
        }
        if ("Anual".equals(frecuencia)) {
            return 365;
        } else {
            return 0;
        }
    }

    public ArrayList<Solicitud> obtenerSolicitudUsuario(Usuario u, Solicitud sol) {
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        try {
            String sqlquery;

            sqlquery = "SELECT C.id, C.cantidad,C.frecuencia, E.nombre_vista, E.imagen, C.talla,E.serial,S.id_periodo "
                    + "FROM \"PREPAS\".solicitud S,\"PREPAS\".contiene C,\"PREPAS\".equipo E "
                    + "WHERE S.id= '" + sol.getId() + "' AND S.usuario = '" + u.getUsuario() + "' "
                    + "AND C.id=S.id AND E.serial=C.serial";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Solicitud s = new Solicitud();
                s.setId(rs.getInt("id"));
                s.setCantidad(rs.getString("cantidad"));
                s.setFrecuencia(rs.getString("frecuencia"));
                s.setNombre_vista(rs.getString("nombre_vista"));
                s.setImagen(rs.getString("imagen"));
                s.setTalla(rs.getString("talla"));
                s.setSerialEquipo(rs.getInt("serial"));
                s.setPeriodo(rs.getInt("id_periodo"));
                solicitudes.add(s);
            }
            return solicitudes;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return solicitudes;
    }

    public void EliminarEquipoEnSolicitud(Solicitud sol) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".contiene WHERE "
                    + "id = '" + sol.getId() + "' "
                    + "AND serial = '" + sol.getSerialEquipo() + "' ";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
    }

    public void modificarEnContiene(Solicitud s) {
        try {
            String sqlquery;
            sqlquery = "UPDATE \"PREPAS\".contiene SET "
                    + "cantidad = '" + s.getCantidad() + "' , "
                    + "frecuencia = '" + s.getFrecuencia() + "' "
                    + "WHERE id = '" + s.getId() + "' AND "
                    + "serial = '" + s.getSerialEquipo() + "'";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Solicitud> obtenerSolicitudesModificadas(Periodo p) {
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        try {
            String sqlquery = "SELECT S.id,U.nombre,U.apellido,S.fecha_solicitud "
                    + "FROM  \"PREPAS\".periodo P, \"PREPAS\".solicitud S, \"PREPAS\".usuario U "
                    + "WHERE P.id='" + p.getId() + "' AND P.id=S.id_periodo AND "
                    + "S.modificada= 'true' AND S.usuario=U.usuario";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                System.out.println("ENTRAAA CICLO MODIFICADA");
                Solicitud s = new Solicitud();
                s.setId(Integer.parseInt(rs.getString("id")));
                s.setNombre_usuario(rs.getString("nombre") + " " + rs.getString("apellido"));
                s.setFecha_solicitud(rs.getString("fecha_solicitud"));
                solicitudes.add(s);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return solicitudes;
    }

    public ArrayList<Solicitud> obtenerSolicitudesNoModificadas(Periodo p) {
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        try {
            String sqlquery = "SELECT S.id,U.nombre,U.apellido,S.fecha_solicitud "
                    + "FROM  \"PREPAS\".periodo P, \"PREPAS\".solicitud S, \"PREPAS\".usuario U "
                    + "WHERE P.id='" + p.getId() + "' AND P.id=S.id_periodo AND "
                    + "S.modificada= 'false' AND S.usuario=U.usuario";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                System.out.println("ENTRAAA CICLO NOO MODIFICADA");
                Solicitud s = new Solicitud();
                s.setId(Integer.parseInt(rs.getString("id")));
                s.setNombre_usuario(rs.getString("nombre") + " " + rs.getString("apellido"));
                s.setFecha_solicitud(rs.getString("fecha_solicitud"));
                solicitudes.add(s);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return solicitudes;
    }

    public ResultSet verSolicitud(Solicitud s) {
        try {
            String sqlquery = "SELECT U.usuario, U.nombre, U.apellido,U.ci, U.sexo, U.area_laboral, U.email, "
                    + " S.id,S.id_periodo,S.fecha_solicitud,S.modificada,C.serial,C.cantidad,C.talla,C.frecuencia, "
                    + " E.nombre_vista,E.sector "
                    + "FROM \"PREPAS\".usuario U,\"PREPAS\".solicitud S,\"PREPAS\".contiene C, \"PREPAS\".equipo E "
                    + "WHERE U.usuario = S.usuario AND S.id = '" + s.getId() + "'AND S.fecha_solicitud= '" + s.getFecha_solicitud()
                    + "' AND S.id = C.id AND C.serial = E.serial";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            return stmt.executeQuery(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }

    public void actualizarSolicitudModificada(Solicitud s) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".solicitud SET "
                    + "modificada = 'true' "
                    + "WHERE id = '" + s.getId() + "'";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Factura> listarFacturasNoValidadas() {
        try {
            String sqlquery = "SELECT fecha, numero_factura, nombre_proveedor "
                    + "FROM \"PREPAS\".factura "
                    + "WHERE validado = \'FALSO\'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            ArrayList<Factura> ar = new ArrayList<Factura>();
            while (rs.next()) {
                Factura f = new Factura();
                f.setFecha(rs.getDate("fecha"));
                f.setNumero_factura(rs.getInt("numero_factura"));
                f.setProveedor(rs.getString("nombre_proveedor"));
                f.setValidado("FALSO");
                ar.add(f);
            }
            return ar;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }
    
    public ArrayList<Factura> listarFacturasValidadas() {
        try {
            String sqlquery = "SELECT fecha, numero_factura, nombre_proveedor "
                    + "FROM \"PREPAS\".factura "
                    + "WHERE validado = \'VERDAD\'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            ArrayList<Factura> ar = new ArrayList<Factura>();
            while (rs.next()) {
                Factura f = new Factura();
                f.setFecha(rs.getDate("fecha"));
                f.setNumero_factura(rs.getInt("numero_factura"));
                f.setProveedor(rs.getString("nombre_proveedor"));
                f.setValidado("VERDAD");
                ar.add(f);
            }
            return ar;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }    
    
    public ArrayList<Mensaje> listarMensajes() {
        try {
            String sqlquery = "SELECT id, mensaje "
                    + "FROM \"PREPAS\".mensaje ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            ArrayList<Mensaje> ar = new ArrayList<Mensaje>();
            while (rs.next()) {
                Mensaje m = new Mensaje();
                m.setId(rs.getString("id"));
                m.setMensaje(rs.getString("mensaje"));
                ar.add(m);
            }
            return ar;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }

    public boolean agregarFactura(Factura f) {
        Date dNow = new Date();
        SimpleDateFormat ft =
                new SimpleDateFormat("dd-MM-yyyy");
        try {
            System.out.println("FECHA DE FACTURAA ==== "+ft.format(dNow).toString());
            String sqlquery;
            sqlquery = "INSERT INTO \"PREPAS\".factura (nombre_proveedor, validado, fecha)  VALUES "
                    + "('" + f.getProveedor() + "' , 'FALSO' , "
                    + "to_date('" + ft.format(dNow).toString() + "','DD-MM-YYYY') )";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            stmt.executeUpdate(sqlquery);
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Boolean eliminarFactura(int numero_factura) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".facturado WHERE "
                    + "numero_factura = '" + numero_factura + "' "
                    + "AND validado = \'FALSO\'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            stmt.executeUpdate(sqlquery);
            
            sqlquery = "DELETE FROM \"PREPAS\".factura WHERE "
                    + "numero_factura = '" + numero_factura + "' "
                    + "AND validado = \'FALSO\'";

            stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);            

            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Equipo> obtenerEquipoFactura(Factura f) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery;

            sqlquery = "SELECT E.serial AS seri, E.imagen AS ima, E.nombre_vista AS nom, F.cantidad AS cant , F.talla AS tal "
                    + "FROM \"PREPAS\".equipo E, \"PREPAS\".facturado F "
                    + "WHERE E.serial = F.serial AND F.numero_factura = \'"
                    + f.getNumero_factura() + "\'";

            System.out.println(sqlquery);

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setCantidad(rs.getInt("cant"));
                e.setSerial(rs.getInt("seri"));
                e.setImagen(rs.getString("ima"));
                e.setNombre_vista(rs.getString("nom"));
                e.setTalla(rs.getString("tal"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public ArrayList<Equipo> obtenerEquiposFacturaAgregar(Facturado f, String sector) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT serial,imagen,nombre_vista,funcionalidad,tipo_talla "
                    + "FROM \"PREPAS\".equipo "
                    + "WHERE habilitado='true' AND sector= '" + sector + "' ";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setSerial(rs.getInt("serial"));
                e.setImagen(rs.getString("imagen"));
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setTipo_talla(rs.getString("tipo_talla"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }

    public Boolean existeFacturado(Facturado f) {
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".facturado F "
                    + "WHERE F.numero_factura = '" + f.getNumero_factura()
                    + "' AND F.serial = '" + f.getSerial()
                    + "' AND F.talla = '" + f.getTalla() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Puntuacion existePuntuacion(Puntuacion p) {
        try {
            String sqlquery;
            sqlquery = "SELECT serial, usuario, puntuacion FROM \"PREPAS\".puntuacion "
                    + "WHERE serial = " + p.getSerial()
                    + " AND usuario = '" + p.getUsuario()
                    + "' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            Puntuacion p1 = null;
            while (rs.next()) {
                p1 = new Puntuacion();
                p1.setSerial(rs.getInt("serial"));
                p1.setUsuario(rs.getString("usuario"));
                p1.setPuntuacion(rs.getInt("puntuacion"));
                return p1;
            }
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Boolean agregarAFacturado(Facturado f) {
        try {
            Boolean existe = existeFacturado(f);
            if (!existe) {
                String sqlquery;
                sqlquery = "INSERT INTO \"PREPAS\".facturado (numero_factura,serial,talla,cantidad,costo_unidad,validado) "
                        + "VALUES ('" + f.getNumero_factura() + "','"
                        + f.getSerial() + "','"
                        + f.getTalla() + "','"
                        + f.getCantidad() + "','0','FALSO')";

                System.out.println(sqlquery);

                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                return i > 0;
            }
            return false;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Equipo obtenerEquipoPuntuacion(Puntuacion p){
        try {
            String sqlquery;
            sqlquery = "SELECT serial, puntuacion, usuarios_puntuando FROM \"PREPAS\".equipo "
                    + "WHERE serial = " + p.getSerial()
                    + " ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            Equipo e = new Equipo();
            while (rs.next()) {
                e.setSerial(rs.getInt("serial"));
                e.setUsuarios_puntuando(rs.getInt("usuarios_puntuando"));
                e.setPuntuacion(rs.getFloat("puntuacion") + "");
            }
            return e;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public Boolean agregarPuntuacion(Puntuacion p) {
        try {
            Puntuacion p1 = existePuntuacion(p);
            Equipo e = this.obtenerEquipoPuntuacion(p);
            Boolean existe = false;
            if(p1 != null){
                existe = true;
            }
            if (!existe) {
                float np = ((Float.parseFloat(e.getPuntuacion()) * e.getUsuarios_puntuando()) + p.getPuntuacion())/(e.getUsuarios_puntuando() + 1);
                String sqlquery;
                sqlquery = "INSERT INTO \"PREPAS\".puntuacion (serial,usuario,puntuacion) "
                        + "VALUES (" + p.getSerial() + ",'"
                        + p.getUsuario()+ "',"
                        + p.getPuntuacion()+ ");"
                        + "";
                String sqlquery2 = "UPDATE \"PREPAS\".equipo SET "
                        + "usuarios_puntuando = "+ (e.getUsuarios_puntuando() + 1) +", "
                        + "puntuacion = " + Float.toString(np) + " "
                        + "WHERE serial = " + e.getSerial() + "";


                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                //return i > 0;
                //if(i > 0){
                    System.out.println(sqlquery2);
                    i = stmt.executeUpdate(sqlquery2);
                    return i > 0;
                //}
            }else{
                float np = (((Float.parseFloat(e.getPuntuacion()) * e.getUsuarios_puntuando()) - p1.getPuntuacion()) + p.getPuntuacion())/(e.getUsuarios_puntuando());
                 
                String sqlquery = "UPDATE \"PREPAS\".puntuacion "
                        + "SET  puntuacion = " + p.getPuntuacion()
                        + "     WHERE serial = " + p.getSerial() + " AND "
                        + "usuario = '" + p.getUsuario() + "'";

                String sqlquery2 = "UPDATE \"PREPAS\".equipo SET "
                        + "usuarios_puntuando = "+ e.getUsuarios_puntuando() +", "
                        + "puntuacion = " + Float.toString(np) + " "
                        + "WHERE serial = " + e.getSerial() + "";

                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                //if(i > 0){
                    System.out.println(sqlquery2);
                    i = stmt.executeUpdate(sqlquery2);
                    return i > 0;
                //}
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean modificarEquipoFactura(Facturado f) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".facturado "
                    + "SET  cantidad = " + f.getCantidad()
                    + "     WHERE numero_factura = " + f.getNumero_factura() + " AND "
                    + "serial = " + f.getSerial() + " AND "
                    + "talla = '" + f.getTalla() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean eliminarEquipoFactura(Facturado f) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".facturado WHERE "
                    + "numero_factura = " + f.getNumero_factura() + " AND "
                    + "serial = " + f.getSerial() + " AND "
                    + "talla = '" + f.getTalla() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);

            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean validarEquipoFactura(Facturado f) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".facturado "
                    + "SET  validado = " + "'VERDAD'"
                    + "     WHERE numero_factura = " + f.getNumero_factura() + " AND "
                    + "serial = " + f.getSerial() + " AND "
                    + "talla = '" + f.getTalla() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean ponerValidadaFactura(Factura f) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".factura "
                    + "SET  validado = " + "'VERDAD'"
                    + "     WHERE numero_factura = " + f.getNumero_factura();

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean validarFactura(Factura f) {
        try {

            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".facturado "
                    + "WHERE numero_factura = '" + f.getNumero_factura()
                    + "' AND validado = 'FALSO'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            boolean validar = true;
            boolean hayEquipo = false;
            while (rs.next()) {
                Equipo e = new Equipo();
                Facturado fact = new Facturado();
                e.setSerial(rs.getInt("serial"));
                e.setTalla(rs.getString("talla"));
                e.setCantidad(rs.getInt("cantidad"));
                fact.setNumero_factura(rs.getInt("numero_factura"));
                fact.setSerial(rs.getInt("serial"));
                fact.setTalla(rs.getString("talla"));
                boolean aux = agregarAEquipoTalla(e);
                validar = validar && aux;
                hayEquipo = true;
                if (aux) {
                    validarEquipoFactura(fact);
                }
            }
            if (validar && hayEquipo) {
                return ponerValidadaFactura(f);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public int equipoTallaCantidad(String t, int s) {
        try {
            String sqlquery;
            sqlquery = "SELECT cantidad FROM \"PREPAS\".equipoTalla "
                    + "WHERE serial = " + s
                    + " AND talla = '" + t + "' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                return rs.getInt("cantidad");
            }
            return -1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    public int existeEquipoTalla(Equipo e) {
        try {
            String sqlquery;
            sqlquery = "SELECT cantidad FROM \"PREPAS\".equipoTalla "
                    + "WHERE serial = " + e.getSerial()
                    + " AND talla = '" + e.getTalla()
                    + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                return rs.getInt("cantidad");
            }
            return -1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    public Boolean modificarEquipoTalla(Equipo e, int cant) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".equipoTalla "
                    + "SET  cantidad = " + (e.getCantidad() + cant)
                    + "     WHERE serial = " + e.getSerial() + " AND "
                    + "talla = '" + e.getTalla() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean agregarAEquipoTalla(Equipo e) {
        int cant = existeEquipoTalla(e);
        if (cant >= 0) {
            return modificarEquipoTalla(e, cant);
        }
        try {
            String sqlquery;
            sqlquery = "INSERT INTO \"PREPAS\".equipoTalla (serial,talla,cantidad) "
                    + "VALUES (" + e.getSerial() + ",'"
                    + e.getTalla() + "',"
                    + e.getCantidad() + ")";

            System.out.println(sqlquery);

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            int i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public String_Cheto obtenerProveedor(Factura f) {
        String_Cheto proveedor = new String_Cheto("");
        try {
            String sqlquery;

            sqlquery = "SELECT nombre_proveedor "
                    + "FROM \"PREPAS\".factura "
                    + "WHERE numero_factura = \'"
                    + f.getNumero_factura() + "\'";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                proveedor.setValue(rs.getString("nombre_proveedor"));
            }
            return proveedor;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return proveedor;
    }

    public ArrayList<unidadAdscripcion> obtenerUnidadesAdscripcion() {
        ArrayList<unidadAdscripcion> unidades = new ArrayList<unidadAdscripcion>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".unidadAdscripcion ORDER BY nombre";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                unidadAdscripcion n = new unidadAdscripcion();
                n.setId(rs.getString("id"));
                n.setNombre(rs.getString("nombre"));

                unidades.add(n);
            }
            return unidades;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return unidades;
    }
    
    public ArrayList<Cargo> obtenerCargos() {
        ArrayList<Cargo> cargos = new ArrayList<Cargo>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".cargo ORDER BY cargo";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Cargo c = new Cargo();
                c.setId(rs.getInt("id"));
                c.setCargo(rs.getString("cargo"));

                cargos.add(c);
            }
            return cargos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return cargos;
    }    

    /*
     * Elimina un usuario de la base de datos
     */
    public Boolean eliminarUnidad(String id) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".unidadAdscripcion WHERE "
                    + "id = '" + id + "' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);

            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Boolean eliminarCargo(String id) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".cargo WHERE "
                    + "id = '" + id + "' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);

            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }    

    public ArrayList<unidadAdscripcion> obtenerRestoUnidades(String id) {
        ArrayList<unidadAdscripcion> unidades = new ArrayList<unidadAdscripcion>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".unidadAdscripcion ORDER BY nombre";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                if (rs.getString("id").equals(id)) {
                    System.out.println("Removiendo unidad de la Lista");
                } else {
                    unidadAdscripcion n = new unidadAdscripcion();
                    n.setId(rs.getString("id"));
                    n.setNombre(rs.getString("nombre"));
                    unidades.add(n);
                }
            }
            return unidades;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return unidades;
    }
    
    public ArrayList<Cargo> obtenerRestoCargos(String id) {
        ArrayList<Cargo> cargos = new ArrayList<Cargo>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".cargo ORDER BY cargo";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                if (rs.getString("id").equalsIgnoreCase(id)) {
                    System.out.println("Removiendo cargo de la Lista");
                } else {
                    Cargo c = new Cargo();
                    c.setId(rs.getInt("id"));
                    c.setCargo(rs.getString("cargo"));
                    cargos.add(c);
                }
            }
            return cargos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return cargos;
    }    
    

    public Boolean editarUnidad(unidadAdscripcion u) {
        try {
            Boolean noExiste = noExisteUnidad(u.getNombre());
            if(noExiste){
                String sqlquery = "UPDATE \"PREPAS\".unidadAdscripcion "
                        + "SET  nombre = '" + u.getNombre() + "' "
                        + "     WHERE id = " + u.getId() + " ";

                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                return i > 0;
            }
            else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Boolean editarCargo(Cargo c) {
        try {
            Boolean noExiste = noExisteCargo(c);
            if (noExiste){
                String sqlquery = "UPDATE \"PREPAS\".cargo "
                        + "SET  cargo = '" + c.getCargo() + "' "
                        + "     WHERE id = " + c.getId() + " ";

                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                return i > 0;
            }
            else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    

    public Boolean noExisteUnidad(String n) {
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".unidadAdscripcion";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                if (rs.getString("nombre").equals(n)) {
                    System.out.println("La Uniad Existe");
                    return false;
                }
            }
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }
    
    public Boolean noExisteCargo(Cargo c) {
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".cargo";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                if (rs.getString("cargo").equals(c.getCargo())){
                    return false;
                }
            }
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }    

    public Boolean agregarUnidad(String n) {
        try {
            Boolean noExiste = noExisteUnidad(n);
            if (noExiste) {
                String sqlquery;
                sqlquery = "INSERT INTO \"PREPAS\".unidadAdscripcion (nombre) "
                        + "VALUES ('" + n + "')";

                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                return i > 0;
            }
            return false;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Boolean agregarCargo(Cargo c) {
        try {
            Boolean noExiste = noExisteCargo(c);
            if (noExiste) {
                String sqlquery;
                sqlquery = "INSERT INTO \"PREPAS\".cargo (cargo) "
                        + "VALUES ('" + c.getCargo() + "')";

                Statement stmt = conexion.createStatement();
                System.out.println(sqlquery);
                Integer i = stmt.executeUpdate(sqlquery);
                return i > 0;
            }
            return false;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }    

    public ArrayList<Entregas> consultarSolicitudes() {
        ArrayList<Entregas> solicitudes = new ArrayList<Entregas>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".solicitud";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Entregas e = new Entregas();
                e.setUsuario(rs.getString("usuario"));
                e.setIdSolicitud(rs.getString("id"));
                e.setFecha_solicitud(rs.getString("fecha_solicitud"));
                solicitudes.add(e);
            }
            return solicitudes;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return solicitudes;
    }

    public ArrayList<Entregas> consultarRestoSolicitudes(String u, String f) {
        ArrayList<Entregas> solicitudes = new ArrayList<Entregas>(0);
        try {
            String sqlquery;
            sqlquery = "SELECT * FROM \"PREPAS\".solicitud";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                if ((rs.getString("usuario").equals(u)) && (rs.getString("fecha_solicitud").equals(f))) {
                    System.out.println("Removiendo solicitud de la Lista");
                } else {
                    Entregas e = new Entregas();
                    e.setUsuario(rs.getString("usuario"));
                    e.setFecha_solicitud(rs.getString("fecha_solicitud"));
                    e.setIdSolicitud(rs.getString("id"));
                    solicitudes.add(e);
                }
            }
            return solicitudes;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return solicitudes;
    }

    public ArrayList<Entregas> obtenerSolicitud(int s) {
        ArrayList<Entregas> solicitudes = new ArrayList<Entregas>(0);
        try {

            String sqlquery = "SELECT U.usuario, U.nombre, U.apellido, U.sexo, U.area_laboral, U.email, "
                    + " S.id,S.fecha_solicitud,S.modificada,C.serial,C.cantidad,C.talla,C.frecuencia, "
                    + " E.nombre_vista,E.sector, E.norma, E.tiempo_vida "
                    + "FROM \"PREPAS\".usuario U,\"PREPAS\".solicitud S,\"PREPAS\".contiene C, \"PREPAS\".equipo E "
                    + "WHERE U.usuario = S.usuario AND S.id = '" + s + "' AND S.id = C.id AND C.serial = E.serial";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Entregas nueva = new Entregas();
                int sugerido,factor;
                
                String tiempo = rs.getString("tiempo_vida").split("\\s")[1];
                int vida = Integer.parseInt(rs.getString("tiempo_vida").split("\\s")[0]);
                if (tiempo.equalsIgnoreCase("Días")){
                    factor = 200 / (vida);
                }
                else if (tiempo.equalsIgnoreCase("Semanas")){
                    factor = 200 / (vida) * 5;
                }
                else if (tiempo.equalsIgnoreCase("Meses")){
                    factor = 200 / (vida) * 20;
                }
                else { //anio
                    factor = 200 / (vida) * 200;
                }
                
                nueva.setIdSolicitud(rs.getString("id"));
                nueva.setSerialEquipo(rs.getString("serial"));
                nueva.setEquipo(rs.getString("nombre_vista"));
                nueva.setUsuario(rs.getString("usuario"));
                nueva.setCantidad_solicitada(rs.getInt("cantidad"));
                nueva.setFecha_solicitud(rs.getString("fecha_solicitud"));
                nueva.setTalla(rs.getString("talla"));
                nueva.setFecha_entrega(rs.getString("norma")); // uso fecha entrega para pasar la norma
                if(rs.getString("frecuencia").equals("Diaria")){ //seteo en frecuencia la cantidad sugerida
                    sugerido = factor;
                    nueva.setSugerido(sugerido);
                }
                else if(rs.getString("frecuencia").equals("Semanal")){ //seteo en frecuencia la cantidad sugerida
                    sugerido = factor / 5;
                }
                else if(rs.getString("frecuencia").equals("Mensual")){
                    sugerido = factor / 20;
                }
                else if(rs.getString("frecuencia").equals("Trimestral")){
                    sugerido = factor / 60;
                }
                else {
                    sugerido = factor / 90;
                }
                
                if (sugerido<1){
                    nueva.setSugerido(1);
                }
                else{
                    nueva.setSugerido(sugerido);
                }

                int idS = Integer.parseInt(nueva.getIdSolicitud());
                int serial = Integer.parseInt(nueva.getSerialEquipo());
                ResultSet rt = obtenerTiene(idS, serial);

                if (rt == null) {
                    nueva.setCantidad_entregada(0);
                } else {
                    while (rt.next()) {
                        nueva.setCantidad_entregada(rt.getInt("cantidad"));
                    }
                }

                solicitudes.add(nueva);
                System.out.println("Agregando a la Lista: " + nueva.getUsuario());
            }
            return solicitudes;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return solicitudes;
    }

    public int obtenerCantidadTiene(int serial, int id) {
        try {
            String sqlquery = "SELECT cantidad FROM  \"PREPAS\".tiene "
                    + "WHERE id = " + id + " AND serial = " + serial + " ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                return rs.getInt("cantidad");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int obtenerCantidadExistencia(String id, int s) {
        try {
            String sqlquery = "SELECT talla FROM  \"PREPAS\".contiene "
                    + "WHERE serial = "+s+" AND id ='"+id+"' ";
 
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                String talla = rs.getString("talla");
                System.out.println("___Talla: " + talla + "____");
                Equipo e = new Equipo();
                e.setTalla(talla);
                e.setSerial(s);
                int cantidad = equipoTallaCantidad(talla, s);
                System.out.println("___Existen " + cantidad + "____");
                return cantidad;

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public int obtenerSerial(String e) {
        try {
            String sqlquery = "SELECT serial FROM  \"PREPAS\".equipo "
                    + "WHERE nombre_vista = '" + e + "' ";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                return rs.getInt("serial");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public Boolean nuevaCantidad(int s, int id, int ec, int tc) {
        try {
            String sqlquery = "SELECT talla FROM  \"PREPAS\".contiene "
                    + "WHERE serial = " + s + " AND id =" + id + " ";

            Statement stmt = conexion.createStatement();
            System.out.println("________________________________");
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            String t = "";

            if (rs.next()) {
                t = rs.getString("talla");
            }

            sqlquery = "UPDATE \"PREPAS\".equipoTalla "
                    + "SET  cantidad = " + ec
                    + "     WHERE serial = " + s + " AND "
                    + "talla = '" + t + "'";

            Integer i = stmt.executeUpdate(sqlquery);
            System.out.println(sqlquery);

            sqlquery = "UPDATE \"PREPAS\".tiene "
                    + "SET  cantidad = " + tc + " "
                    + "     WHERE serial = " + s + " AND  id = " + id + " ";

            System.out.println(sqlquery);
            Integer j = stmt.executeUpdate(sqlquery);

            return ((i > 0) && (j > 0));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //Existe en .tiene
    //obtener de .tiene
    //obtener serial .equipo

    public Boolean modificarUsuarioAdmin(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    //+ "password = '" + u.getPassword() + "' , "
                    + "nombre = '" + u.getNombre() + "' , "
                    + "apellido = '" + u.getApellido() + "' , "
                    + "fecha = '" + u.getFecha() + "' , "
                    + "telefono = '" + u.getTelefono() + "' , "
                    + "administrador = '" + u.getAdministrador() + "' , "
                    + "sexo = '" + u.getSexo() + "' , "
                    + "email = '" + u.getEmail() + "' , "
                    + "talla_mascara = '" + u.getTalla_mascara() + "' , "
                    + "talla_camisa = '" + u.getTalla_camisa() + "' , "
                    + "talla_pantalon = '" + u.getTalla_pantalon() + "' , "
                    + "talla_guantes = '" + u.getTalla_guantes() + "' , "
                    + "talla_zapato = '" + u.getTalla_zapato() + "' , "
                    + "unidad_adscripcion = '" + u.getUnidad_adscripcion() + "' , "
                    + "cargo = '" + u.getCargo() + "' , "
                    + "area_laboral = '" + u.getArea_laboral() + "' "
                    + "WHERE usuario = '" + u.getUsuario() + "'";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public String estaHabilitado(Usuario admin) {
        String habilitado = "";
        try {
            String sqlquery = "SELECT habilitado FROM \"PREPAS\".usuario "
                    + "WHERE usuario = '" + admin.getUsuario() + "' ";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            rs.next();
            habilitado = rs.getString("habilitado");
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return habilitado;
    }

    public Boolean existePeriodo() {
        try {
            String sqlquery;

            sqlquery = "SELECT COUNT(*) AS numero FROM \"PREPAS\".periodo WHERE habilitado='true'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            rs.next();
            Integer numero = rs.getInt("numero");

            System.out.println("NUMEROOOOOOO " + numero);
            if (numero > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Periodo> obtenerPeriodos() {
        ArrayList<Periodo> periodos = new ArrayList<Periodo>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".periodo ORDER BY id DESC";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);;
            while (rs.next()) {
                Periodo p = new Periodo();
                p.setId(rs.getInt("id"));
                p.setCantidadProcesada(rs.getInt("cantidad_procesada"));
                p.setCantidadRecibida(rs.getInt("cantidad_recibida"));
                p.setFecha_inicio(rs.getString("fecha_inicio"));
                p.setFecha_fin(rs.getString("fecha_fin"));
                p.setHabilitado(rs.getBoolean("habilitado"));
                p.setUltimo(rs.getBoolean("ultimo"));
                periodos.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return periodos;
    }

    public Boolean agregarPeriodo(Periodo p) {
        try {
            
            if (!existePeriodo(p)){
                String sqlquery;

                sqlquery = "UPDATE \"PREPAS\".periodo SET"
                        + " ultimo = 'false'"
                        + " WHERE ultimo = 'true' ";
                Statement stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);

                sqlquery = "INSERT INTO \"PREPAS\".periodo (fecha_inicio,fecha_fin) VALUES "
                        + "('"+p.getFecha_inicio()+"', '" + p.getFecha_fin() + "')";

                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                System.out.println(sqlquery);
                return i > 0;
            }
            else{
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public Boolean existePeriodo(Periodo p) {

        String sqlquery = "SELECT * FROM \"PREPAS\".periodo"
                + " WHERE fecha_inicio ='" + p.getFecha_inicio() + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }    

    public Boolean cerrarPeriodo(Periodo p) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".periodo SET "
                    + "habilitado = 'false' "
                    + " WHERE id = '" + p.getId() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean reAbrirPeriodo(Periodo p) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".periodo SET "
                    + "habilitado = 'true' "
                    + " WHERE id = '" + p.getId() + "' AND ultimo='true'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Periodo obtenerPeriodo(Periodo p) {
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".periodo WHERE id='" + p.getId() + "'";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            Periodo per = new Periodo();
            rs.next();
            per.setId(rs.getInt("id"));
            per.setCantidadProcesada(rs.getInt("cantidad_procesada"));
            per.setCantidadRecibida(rs.getInt("cantidad_recibida"));
            per.setFecha_inicio(rs.getString("fecha_inicio"));
            per.setFecha_fin(rs.getString("fecha_fin"));
            per.setHabilitado(rs.getBoolean("habilitado"));
            per.setUltimo(rs.getBoolean("ultimo"));
            return per;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return null;
    }
    
    public Periodo obtenerPeriodo(Solicitud s) {
        try {
            String sqlquery = "SELECT P.id FROM \"PREPAS\".periodo P, \"PREPAS\".solicitud S "
                    + "WHERE S.id='" + s.getId() + "' AND S.id_periodo=P.id";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            Periodo per = new Periodo();
            rs.next();
            per.setId(rs.getInt("id"));
            return per;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return null;
    }    

    public ResultSet obtenerTiene(int idS, int serial) {
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".tiene WHERE id= " + idS + " AND serial = " + serial + " ";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            return rs;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return null;
    }

    public Boolean agregarTiene(int idS, String u, int serial) {
        try {

            String sqlquery = "INSERT INTO \"PREPAS\".tiene (id,usuario,serial,cantidad,fecha_entrega) VALUES "
                    + "(" + idS + ",'" + u + "'," + serial + ",0,(SELECT CURRENT_DATE) )";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            System.out.println(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public void CancelarSolicitud(Solicitud s) {
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".contiene WHERE "
                    + "id = '" + s.getId() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            Integer i = stmt.executeUpdate(sqlquery);

            sqlquery = "DELETE FROM \"PREPAS\".solicitud WHERE "
                    + "id = '" + s.getId() + "'";
            System.out.println(sqlquery);
            i = stmt.executeUpdate(sqlquery);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    /*public ArrayList<Solicitud> consolidadoTipoEPP(Periodo p) {
     ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
     try {
     String sqlquery= "SELECT E.nombre_vista AS nombre_vista"
     + "              U.unidad_adscripcion AS unidad_adscripcion, "
     + "              C.talla AS talla, "
     + "              sum(C.cantidad) AS cantidad "
     + "              "
     + " FROM \"PREPAS\".solicitud S NATURAL JOIN "
     + "      \"PREPAS\".periodo P NATURAL JOIN "
     + "      \"PREPAS\".contiene C NATURAL JOIN "
     + "      \"PREPAS\".equipo E NATURAL JOIN "
     + "      \"PREPAS\".usuario U"
     + " WHERE P.fecha_inicio='"+p.getFecha_inicio()+"' AND"
     + "       S.modificada = 'true' AND "
     + " GROUP BY E.nombre_vista, U.unidad_adscripcion";

     Statement stmt = conexion.createStatement();
     System.out.println(sqlquery);
     ResultSet rs = stmt.executeQuery(sqlquery);

     while (rs.next()) {
     Noticia n = new Noticia();
     n.setUsuario(rs.getString("usuario"));
     n.setTitulo(rs.getString("titulo"));
     n.setContenido(rs.getString("contenido"));
     n.setFechaNoticia(rs.getString("fechaNoticia"));
     solicitudes.add(n);
     }
     return solicitudes;
     } catch (SQLException ex) {
     System.out.println("EXCEPCION");
     ex.printStackTrace();
     }
     return solicitudes;
     }*/
    public Boolean existeEmail(Email em) {

        String sqlquery = "SELECT * FROM \"PREPAS\".usuario"
                + " WHERE email = '" + em.getEmail() + "' OR usuario = '" + em.getEmail() + "'";

        System.out.println(sqlquery);
        try {
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            return b;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Boolean modificarContrasena(Usuario u) {
        try {
            String sqlquery = "UPDATE \"PREPAS\".usuario SET "
                    //+ "password = '" + u.getPassword() + "' , "
                    + "password = crypt('" + u.getPassword() + "', gen_salt('bf')) "
                    + " WHERE email = '" + u.getEmail() + "' OR usuario = '" + u.getEmail() + "'";


            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
             System.out.println(u.getPassword()+"<<<<<<<<");
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Boolean agregarTalla (Equipo e){
        try {
            String sqlquery = "INSERT INTO \"PREPAS\".equipoTalla (serial,talla,cantidad)"
                    + " VALUES ("+e.getSerial()+",'"+e.getTalla()+"',"+e.getCantidad()+")";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);

            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Boolean cambiarTalla (Equipo e){
        try {
            String sqlquery = "UPDATE \"PREPAS\".equipoTalla SET "
                    + "cantidad = "+e.getCantidad()+" "
                    + "WHERE serial = "+e.getSerial()+" AND talla = '"+e.getTalla()+"'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);

            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }    
    
    public ArrayList<Equipo> obtenerTallasEquipo(Equipo e) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT * FROM \"PREPAS\".equipoTalla "
                    + "WHERE serial = '"+e.getSerial()+"' ORDER BY talla";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo eq = new Equipo();
                eq.setSerial(rs.getInt("serial"));
                eq.setTalla(rs.getString("talla"));
                eq.setCantidad(rs.getInt("cantidad"));
                equipos.add(eq);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }
    
    public ArrayList<Equipo> obtenerTallasEquipo() {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery = "SELECT E.nombre_vista, T.talla, T.cantidad FROM \"PREPAS\".equipoTalla T, \"PREPAS\".equipo E "
                    + "WHERE T.serial=E.serial ORDER BY E.nombre_vista";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo eq = new Equipo();
                eq.setNombre_vista(rs.getString("nombre_vista"));
                eq.setTalla(rs.getString("talla"));
                eq.setCantidad(rs.getInt("cantidad"));
                equipos.add(eq);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }    
    
    public Boolean eliminarTalla (Equipo e){
        try {
            String sqlquery = "DELETE FROM \"PREPAS\".equipoTalla WHERE "
                    + "serial = '" + e.getSerial() + "' "
                    + "AND talla = '" + e.getTalla() + "' ";            

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);

            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public ArrayList<Solicitud> solicitudesDePeriodo(Periodo p) {
        ArrayList<Solicitud> solicitudes = new ArrayList<Solicitud>(0);
        try {
            String sqlquery = "SELECT S.id,U.nombre,U.apellido,U.ci,U.unidad_adscripcion,S.fecha_solicitud "
                    + "FROM  \"PREPAS\".periodo P, \"PREPAS\".solicitud S, \"PREPAS\".usuario U "
                    + "WHERE P.fecha_inicio='" + p.getFecha_inicio() + "' AND P.fecha_fin='"+p.getFecha_fin()+"' AND S.id_periodo=P.id AND "
                    + "S.modificada= 'true' AND S.usuario=U.usuario "
                    + "ORDER BY U.ci DESC";
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                System.out.println("ENTRAAA CICLO MODIFICADA");
                Solicitud s = new Solicitud();
                s.setId(Integer.parseInt(rs.getString("id")));
                s.setNombre_usuario(rs.getString("nombre") + " " + rs.getString("apellido"));
                s.setFecha_solicitud(rs.getString("fecha_solicitud"));
                s.setNombre_vista(rs.getString("ci")); // Usado para colocar la cédula del usuario
                s.setTalla(rs.getString("unidad_adscripcion")); // Usado para pasar la unidad de adscripcion
                solicitudes.add(s);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return solicitudes;
    }
    
    public Usuario obtenerUsuarioDeSolicitud(Solicitud s) {
        try {
            String sqlquery = "SELECT usuario FROM  \"PREPAS\".solicitud "
                    + "WHERE id = '" + s.getId() + "'";

            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                Usuario u = new Usuario();
                 u.setUsuario(rs.getString("usuario"));
                 u = atributosUsuario(u);
                 return u;
            } else {
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Equipo> obtenerMaterialCantidad(Periodo p) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery= "SELECT U.area_laboral, E.nombre_vista, C.talla, SUM(C.cantidad) AS cantidad, "
                    + "              E.funcionalidad, E.norma, Q.cantidad AS existencia "
                    + "FROM \"PREPAS\".periodo P, \"PREPAS\".solicitud S, \"PREPAS\".contiene C, \"PREPAS\".equipo E, "
                    + "\"PREPAS\".equipoTalla Q, \"PREPAS\".usuario U "
                    + "WHERE P.fecha_inicio='"+p.getFecha_inicio()+"' AND "
                    + "      P.fecha_fin = '"+p.getFecha_fin()+"' AND "                    
                    + "      P.id = S.id_periodo AND "
                    + "      S.modificada = 'true' AND "                    
                    + "      C.id = S.id AND "
                    + "      C.serial = E.serial AND "
                    + "      U.usuario = S.usuario AND "
                    + "      E.serial = Q.serial AND "
                    + "      C.talla = Q.talla "
                    + "GROUP BY U.area_laboral, E.nombre_vista, C.talla, E.funcionalidad,E.norma, Q.cantidad "
                    + "ORDER BY U.area_laboral, E.nombre_vista";
          
            
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setTalla(rs.getString("talla"));
                e.setCantidad(rs.getInt("cantidad"));
                e.setFuncionalidad(rs.getString("funcionalidad"));
                e.setNorma(rs.getString("norma"));
                e.setSerial(rs.getInt("existencia")); // aqui paso la cantidad en existencia
                e.setSector(rs.getString("area_laboral"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }
    
     public ArrayList<Usuario> obtenerUsuarioCantidad(Periodo p) {
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>(0);
        try {
            String sqlquery= "SELECT U.ci, U.nombre, U.apellido, U.unidad_adscripcion, U.area_laboral, U.sexo, U.cargo, "
                    + "       E.nombre_vista, C.talla, C.cantidad "
                    + "FROM \"PREPAS\".periodo P, \"PREPAS\".solicitud S, \"PREPAS\".contiene C, \"PREPAS\".equipo E, \"PREPAS\".usuario U "
                    + "WHERE P.fecha_inicio='"+p.getFecha_inicio()+"' AND "
                    + "      P.fecha_fin = '"+p.getFecha_fin()+"' AND "
                    + "      S.modificada = 'true' AND "
                    + "      P.id = S.id_periodo AND "
                    + "      C.id = S.id AND "
                    + "      C.serial = E.serial AND "
                    + "      S.usuario = U.usuario "
                    + "ORDER BY U.area_laboral,U.unidad_adscripcion,U.ci";
          
            
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setCi(rs.getString("ci"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setUnidad_adscripcion(rs.getString("unidad_adscripcion"));
                u.setArea_laboral(rs.getString("area_laboral"));
                u.setSexo(rs.getString("sexo"));
                u.setCargo(rs.getString("cargo"));
                u.setTalla_camisa(rs.getString("nombre_vista")); //talla camisa usado para pasar nombre de equipo
                u.setTalla_guantes(rs.getString("talla"));//talla guantes usado para pasar talla de equipo
                u.setTalla_mascara(rs.getString("cantidad")); //talla mascara usado para pasar cantidad de equipo
                usuarios.add(u);
            }
            return usuarios;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return usuarios;
    }
     
    public ArrayList<Equipo> obtenerEquipoUnidad(Periodo p) {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>(0);
        try {
            String sqlquery= "SELECT U.unidad_adscripcion,U.area_laboral, E.nombre_vista, C.talla, SUM(C.cantidad) AS cantidad "
                    + "FROM \"PREPAS\".periodo P, \"PREPAS\".solicitud S, \"PREPAS\".contiene C, \"PREPAS\".equipo E, \"PREPAS\".usuario U "
                    + "WHERE P.fecha_inicio='"+p.getFecha_inicio()+"' AND "
                    + "      P.fecha_fin = '"+p.getFecha_fin()+"' AND "
                    + "      S.modificada = 'true' AND "
                    + "      P.id = S.id_periodo AND "
                    + "      C.id = S.id AND "
                    + "      C.serial = E.serial AND "
                    + "      S.usuario = U.usuario "
                    + "GROUP BY E.nombre_vista,C.talla, U.unidad_adscripcion,U.area_laboral "
                    + "ORDER BY U.area_laboral, E.nombre_vista, U.unidad_adscripcion";
          
            
            Statement stmt = conexion.createStatement();
            System.out.println(sqlquery);
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setNombre_vista(rs.getString("nombre_vista"));
                e.setTalla(rs.getString("talla"));
                e.setCantidad(rs.getInt("cantidad"));
                e.setFuncionalidad(rs.getString("unidad_adscripcion"));
                e.setSector(rs.getString("area_laboral"));
                equipos.add(e);
            }
            return equipos;
        } catch (SQLException ex) {
            System.out.println("EXCEPCION");
            ex.printStackTrace();
        }
        return equipos;
    }     
     
    
}
