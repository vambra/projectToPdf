package lt.viko.eif.bstonkute.projecttopdf;

import org.apache.fop.apps.*;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

/**
 * Class for converting XML file to PDF, following the given XSL FO formatting.
 *
 * @author Brigita Stonkutė
 */
public class ProjectToPdf {
    /**
     * Converts XML to formatted PDF file.
     *
     * @param xslFoFile       XSL FO file containing the PDF formatting specifications
     * @param xmlSourceFile   XML file containing the data to be formatted
     * @param destinationFile name or path for the created PDF file
     */
    public static void convertToPdf(String xslFoFile, String xmlSourceFile, String destinationFile) {
        try {
            File xsltFile = new File(xslFoFile);
            StreamSource xmlSource = new StreamSource(xmlSourceFile);
            FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
            FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
            OutputStream out;
            out = new FileOutputStream(destinationFile);
            try {
                Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
                TransformerFactory factory = TransformerFactory.newInstance();
                Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));
                Result res = new SAXResult(fop.getDefaultHandler());
                transformer.transform(xmlSource, res);
            } catch (FOPException | TransformerException e) {
                System.out.println("Conversion failed");
            } finally {
                out.close();
            }
        } catch (IOException e) {
            System.out.println("Conversion failed");
        }
    }
}
