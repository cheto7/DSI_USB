/*
import java.io.*;
import java.sql.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import javax.swing.text.Document;*/

public class CreatePDF{
    public static void main(String arg[])throws Exception{
       /* Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream("C:/data.pdf"));

        document.open();

        PdfPTable table = new PdfPTable(2);
        table.addCell("Name");
        table.addCell("Address");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                                        "jdbc:mysql://localhost:3306/test",
                                        "root", "root");

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from data");

        while(rs.next()) {
            table.addCell(rs.getString("name"));
            table.addCell(rs.getString("address"));
        }

        document.add(table);
        document.close();*/
    }
}