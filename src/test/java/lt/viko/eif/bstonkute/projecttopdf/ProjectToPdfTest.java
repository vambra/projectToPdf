package lt.viko.eif.bstonkute.projecttopdf;

import org.junit.jupiter.api.Test;

import java.io.*;

import static org.junit.jupiter.api.Assertions.*;

class ProjectToPdfTest {
    @Test
    void convertToPdf() {
        String xslFoFormattingFilename = "projectsToPdf.xsl";
        String xmlSourceFilename = "projectDataTest.xml";
        String destinationFilename = "projectsAsPdfTest.pdf";
        ProjectToPdf.convertToPdf(xslFoFormattingFilename, xmlSourceFilename, destinationFilename);
        File xslFoFormattingFile = new File(xslFoFormattingFilename);
        File xmlSourceFile = new File(xmlSourceFilename);
        File destinationFile = new File(destinationFilename);
        assertTrue(xslFoFormattingFile.exists());
        assertTrue(xmlSourceFile.exists());
        assertTrue(destinationFile.exists());
        try {
            BufferedReader reader = new BufferedReader(new FileReader(xslFoFormattingFilename));
            assertNotNull(reader.readLine());
            reader = new BufferedReader(new FileReader(xmlSourceFilename));
            assertNotNull(reader.readLine());
            reader = new BufferedReader(new FileReader(destinationFilename));
            assertNotNull(reader.readLine());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}