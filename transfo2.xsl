<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:ds="http://www.dsti-food.com/" 
xmlns:al="http://allergens.dsti.com/">
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe List</title>
            </head>
            <body>
                <h1>Recipe List</h1>
                <xsl:apply-templates select="ds:Food/ds:recipe"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="ds:recipe">
        <h2><xsl:value-of select="ds:title"/></h2>
    </xsl:template>

</xsl:stylesheet>
