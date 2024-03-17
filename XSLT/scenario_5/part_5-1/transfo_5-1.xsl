<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="http://www.dsti-food.com/">
    <xsl:output method="html" indent="yes"/>

    <!-- Template to match the root Food element -->
    <xsl:template match="/ds:Food">
        <html>
            <body>
                <ul>
                    <!-- Apply templates to all mealType elements -->
                    <xsl:apply-templates select="ds:mealTypes/ds:mealType"/>
                </ul>
            </body>
        </html>
    </xsl:template>

    <!-- Template to match each mealType element -->
    <xsl:template match="ds:mealType">
        <li>
            <!-- Copy the content of the name element -->
            <xsl:value-of select="ds:name"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
