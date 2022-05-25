package lt.viko.eif.bstonkute.projecttopdf;

public class Main {
    public static void main(String args[]) {
        ProjectToPdf.convertToPdf("projectsToPdf.xsl", "projectData.xml", "projectsAsPdf.pdf");
    }
}
