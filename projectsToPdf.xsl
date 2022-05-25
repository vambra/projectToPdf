<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <fo:root language="EN">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrait"
                                       page-height="297mm" page-width="210mm"
                                       margin-top="5mm" margin-bottom="5mm"
                                       margin-left="5mm" margin-right="5mm">
                    <fo:region-body margin-top="25mm" margin-bottom="20mm"/>
                    <fo:region-before region-name="xsl-region-before"
                                      extent="25mm" display-align="before"
                                      precedence="true"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4-portrait">
                <fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
                    <fo:block>All Projects</fo:block>
                    <fo:table table-layout="fixed" width="100%" font-size="10pt"
                              border-color="grey" border-width="0.35mm"
                              border-style="solid" text-align="center"
                              display-align="center" space-after="5mm">
                        <fo:table-column column-width="proportional-column-width(30)"/>
                        <fo:table-column column-width="proportional-column-width(30)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-body font-size="95%">
                            <fo:table-row height="8mm" border-color="grey"
                                          border-width="0.35mm" border-style="solid"
                                          text-align="center" display-align="center"
                                          space-after="5mm">
                                <fo:table-cell><fo:block>Character</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Source</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Due Date</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Start Date</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Finish Date</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Budget</fo:block></fo:table-cell>
                            </fo:table-row>
                            <xsl:for-each select="projectList/project">
                                <fo:table-row>
                                    <fo:table-cell><fo:block><xsl:value-of select="character"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="source"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="dueDate"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="startDate"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="finishDate"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select='format-number(budget, "0.00")'/> EUR</fo:block></fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>
                    <xsl:for-each select="projectList/project">
                        <fo:block page-break-before="always" font-size="14pt" text-align="left" space-after="5px">
                            <xsl:value-of select="character"/> | <xsl:value-of select="source"/>
                        </fo:block>
                        <fo:table table-layout="fixed" width="100%" font-size="10pt"
                                  border-color="grey" border-width="0.35mm"
                                  border-style="solid" text-align="center"
                                  display-align="center" space-after="5mm">
                            <fo:table-column column-width="proportional-column-width(20)"/>
                            <fo:table-column column-width="proportional-column-width(20)"/>
                            <fo:table-column column-width="proportional-column-width(40)"/>
                            <fo:table-body>
                                <fo:table-row height="8mm" border-color="grey"
                                              border-width="0.35mm" border-style="solid"
                                              text-align="center" display-align="center"
                                              space-after="5mm">
                                    <fo:table-cell><fo:block>Component</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block>Cost</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block>Tasks</fo:block></fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="componentList/component">
                                    <fo:table-row border-width="0.35mm" border-color="grey" border-style="solid">
                                        <fo:table-cell><fo:block><xsl:value-of select="name"/></fo:block></fo:table-cell>
                                        <fo:table-cell><fo:block><xsl:value-of select='format-number(cost, "0.00")'/> EUR</fo:block></fo:table-cell>
                                        <fo:table-cell>
                                            <fo:table table-layout="fixed" width="90%" font-size="10pt"
                                                      display-align="center" space-after="5mm">
                                                <fo:table-column column-width="proportional-column-width(40)"/>
                                                <fo:table-column column-width="proportional-column-width(20)"/>
                                                <fo:table-column column-width="proportional-column-width(20)"/>
                                                <fo:table-body>
                                                    <xsl:for-each select="taskList/task">
                                                        <fo:table-row>
                                                            <fo:table-cell><fo:block text-align="left"><xsl:value-of select="name"/></fo:block></fo:table-cell>
                                                            <fo:table-cell><fo:block text-align="right"><xsl:value-of select="progress"/>%</fo:block></fo:table-cell>
                                                            <fo:table-cell><fo:block text-align="right"><xsl:value-of select="timeElapsedHours"/>:<xsl:value-of select='format-number(timeElapsedMinutes, "00")'/></fo:block></fo:table-cell>
                                                        </fo:table-row>
                                                    </xsl:for-each>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                        <xsl:for-each select="conventionList/convention">
                            <fo:block><xsl:value-of select="name"/>, <xsl:value-of select="date"/></fo:block>
                            <fo:table table-layout="fixed" width="100%" font-size="10pt"
                                      border-color="grey" border-width="0.35mm"
                                      border-style="solid" text-align="center"
                                      display-align="center" space-after="5mm">
                                <fo:table-column column-width="proportional-column-width(20)"/>
                                <fo:table-column column-width="proportional-column-width(20)"/>
                                <fo:table-column column-width="proportional-column-width(20)"/>
                                <fo:table-body>
                                    <fo:table-row height="8mm" border-color="grey"
                                                  border-width="0.35mm" border-style="solid"
                                                  text-align="center" display-align="center"
                                                  space-after="5mm">
                                        <fo:table-cell><fo:block>Competition category</fo:block></fo:table-cell>
                                        <fo:table-cell><fo:block>Award</fo:block></fo:table-cell>
                                        <fo:table-cell><fo:block>Prize</fo:block></fo:table-cell>
                                    </fo:table-row>
                                    <xsl:for-each select="competitionList/competition">
                                        <fo:table-row>
                                            <fo:table-cell><fo:block><xsl:value-of select="category"/></fo:block></fo:table-cell>
                                            <fo:table-cell>
                                                <xsl:choose>
                                                    <xsl:when test="award = '1st'">
                                                        <fo:block>
                                                            <fo:external-graphic src="url(place1.svg)"
                                                                                 content-width="40px"
                                                                                 content-height="40px"/>
                                                        </fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="award = '2nd'">
                                                        <fo:block>
                                                            <fo:external-graphic src="url(place2.svg)"
                                                                                 content-width="40px"
                                                                                 content-height="40px"/>
                                                        </fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="award = '3rd'">
                                                        <fo:block>
                                                            <fo:external-graphic src="url(place3.svg)"
                                                                                 content-width="40px"
                                                                                 content-height="40px"/>
                                                        </fo:block>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <fo:block><xsl:value-of select="award"/></fo:block>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </fo:table-cell>
                                            <fo:table-cell><fo:block><xsl:value-of select="prize"/></fo:block></fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </fo:table-body>
                            </fo:table>
                        </xsl:for-each>
                    </xsl:for-each>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>