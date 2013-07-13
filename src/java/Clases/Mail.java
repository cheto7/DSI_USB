/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;

/**
 *
 * @author ivan
 */
public class Mail {

    String to;
    String from="dsinooficial@gmail.com";
    String password = "sistemadsi";
    String smtpServ="smtp.gmail.com";

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public int sendMailHabilitado(String to) {
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpServ);       
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		  });
        MimeMessage message = new MimeMessage(session);

        try {
            BodyPart texto = new MimeBodyPart();
            texto.setText("Nos es grato informarle que su solicitud de ingreso al sistema de"
                    + " solicitud de equipos de protección personal de la Dirección de Seguridad "
                    + "integral de la Universidad Simón Bolívar, ha sido aprobada.");
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Solicitud de ingreso");
            message.setContent(multiParte);

            Transport t = session.getTransport("smtp");
            t.connect(from, password);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    public int sendMailClave(Usuario clave) {
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpServ);       
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		  });
        MimeMessage message = new MimeMessage(session);

        try {
            BodyPart texto = new MimeBodyPart();
            texto.setText("Se ha recibido una solicitud de cambio de contraseña, su nueva contraseña"
                    + "es: "+clave.getPassword() );
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(clave.getEmail()));
            message.setSubject("Solicitud de ingreso");
            message.setContent(multiParte);

            Transport t = session.getTransport("smtp");
            t.connect(from, password);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    public int sendMailGenerico(String to, String mensaje, String asunto) {
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpServ);       
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		  });
        MimeMessage message = new MimeMessage(session);

        try {
            BodyPart texto = new MimeBodyPart();
            texto.setText(mensaje);
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(asunto);
            message.setContent(multiParte);

            Transport t = session.getTransport("smtp");
            t.connect(from, password);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    
    public int sendMailPresolicitud(String to) {
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpServ);       
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		  });
        MimeMessage message = new MimeMessage(session);

        try {
            BodyPart texto = new MimeBodyPart();
            texto.setText("Usted ha solicitado ingresar al sistema de solicitud"
                    + " de equipos de proteccion personal de la Dirección de Seguridad Integral (DSI)."
                    + " Proximamente se le enviará"
                    + " un correo electronico sobre el estatus de su solicitud.\n"
                    + " Si no ha realizado esta solicitud, ignore el presente mensaje");
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Solicitud de ingreso");
            message.setContent(multiParte);

            Transport t = session.getTransport("smtp");
            t.connect(from, password);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }    
}