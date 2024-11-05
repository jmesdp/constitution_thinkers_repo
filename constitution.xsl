<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Constitution</title>
            </head>
            <body>
                <h1 style="text-align:center;">The Constitution Document</h1>
                <xsl:apply-templates select="//meta_data"/>
                <xsl:apply-templates select="//section"/>
                <xsl:apply-templates select="/section_name"/>
            </body>
        </html>
    </xsl:template>
 
   <xsl:template match="//meta_data">
       <div class="meta_data">
        <p style="text-align:center;">
            <xsl:apply-templates/>
        </p>
       </div>
   </xsl:template> 
    
    <xsl:template match="//section">
        <div class="section">
            <h2 style="text-align:center;">
                <xsl:value-of select="section_name[@type='article' or @type='amendment' or @type='preamble']"/>
            </h2>
            <p>
                <xsl:value-of select="."/>
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="sub_section">
        <div class="sub_section">
            <h3 style="text-align:center;">
                <xsl:value-of select="subsection_name[@type='section']"/>
            </h3>
            <p>
                <xsl:value-of select="."/>
            </p>
        </div>
    </xsl:template>
    
    
</xsl:stylesheet>