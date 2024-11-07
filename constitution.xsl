<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Constitution</title>
                <link rel="stylesheet" type="text/css" href="constitutionstyle.css"/>
            </head>
            <body>
                <h1 style="text-align:center;">The Constitution Document</h1>
                <xsl:apply-templates select="//meta_data"/>
                <hr/>
                <h2 style="text-align:center;">Table of Contents</h2>
                <hr/>
                    <ul>
                        <xsl:apply-templates select="//section" mode="toc">
                            <xsl:sort>
                                <xsl:value-of select="translate('','''', @number)"/>
                            </xsl:sort>
                        </xsl:apply-templates>
                    </ul>
                    <hr/>
                <xsl:apply-templates select="//section"/>
            </body>
        </html>
    </xsl:template>
    <!-- template for the doc -->
    
    <xsl:template match="//section" mode="toc">
        <li>
            
            <h2>
                <a href="#{@number}">
                    <xsl:value-of select="@number"/>
                    <xsl:text>:</xsl:text>
                </a>
            </h2>
        </li>
       
                <xsl:for-each select="sub_section">
                    <li>
                        <i>
                            <a href="#{@number}">
                                <xsl:value-of select="subsection_name"/>
                            </a>
                        </i>
                    </li>
                </xsl:for-each>
    </xsl:template>
    <!-- table of contents, but have to link it -->
    
   <xsl:template match="//meta_data">
       <div class="meta_data">
            <p style="text-align:center;">
                <xsl:value-of select="."/>
            </p>
       </div>
   </xsl:template> 
   <!-- this is for the metadata text -->
    
    <xsl:template match="//section">
        <div class="section">
            <hr/>
            <h2 id="{@number}" style="text-align:center;">
                    <xsl:value-of select="section_name[@type='article' or @type='amendment' or @type='preamble']"/>
                </h2>
                <p>
                    <xsl:value-of select="text() | (consent_of_governed | inherent_rights | criminal_justice | purposes_of_law | legal_documents | legislative_body | judicial_body | executive_body | limits_of_power)"/>
                </p>
            <xsl:for-each select="sub_section">
                <div class="sub_section">
                    <h3 style="text-align:center;">
                        <xsl:value-of select="subsection_name"/>
                    </h3>
                    <p>
                        <xsl:value-of select="text() | (consent_of_governed | inherent_rights | criminal_justice | purposes_of_law | legal_documents | legislative_body | judicial_body | executive_body | limits_of_power)"/>
                    </p>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- this sets the style, layout, and text for all of the constitution text -->
    
</xsl:stylesheet>