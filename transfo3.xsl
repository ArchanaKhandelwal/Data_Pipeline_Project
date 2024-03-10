<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:food="http://www.dsti-food.com/" 
xmlns:al="http://allergens.dsti.com/">
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe List</title>
                <style type="text/css">
                    body { font-family: Arial, sans-serif; }
                    h1 { color: #333; }
                </style>
            </head>
            <body>
                <h1>Recipe List</h1>
                <xsl:apply-templates select="food:Food/food:recipe"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="food:recipe">
        <h2><xsl:value-of select="food:title"/></h2>
    </xsl:template>

</xsl:stylesheet>
