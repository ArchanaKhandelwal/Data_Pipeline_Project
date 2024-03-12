<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/">
	<xsl:output method="html"
	            version="4.0"
	            encoding="UTF-8"
	            indent="yes"/>
    <!-- I used Chatgpt for this code-->
	<!--Create a list of recipes with allergy info-->
    <!-- Define a key to map allergy IDs to their names -->
    <xsl:key name="allergenKey" match="al:allergie" use="@id"/>
    
    <!-- Match the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipes</title>
            </head>
            <body>
			<h1>There are <xsl:value-of select="count(ds:Food/ds:recipe/ds:title)"/> recipes with allergy info </h1>
                <!-- Iterate through each recipe -->
                <xsl:for-each select="//ds:recipe">
                    <h2>Recipe Title: <xsl:value-of select="ds:title"/></h2>
                    <ul>
                        
                        <xsl:for-each select="ds:allergens/ds:allergen">
                            <li><strong>Allergy Name:</strong> <xsl:value-of select="key('allergenKey', @alref)/al:name"/></li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
