<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/">
    <!-- Define HTML output format -->
    <xsl:output method="html" encoding="UTF-8"/>
<xsl:key name="allergenKey" match="al:allergie[not(@id = 'al9' or @id = 'al1')]" use="@id"/>

<!-- Create a list of recipes without Egg and wheat allergy-->

    <!-- Match the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipes without Egg and wheat Allergy</title>
            </head>
            <body>
			<!-- Count and display the number of recipes without egg and wheat allergy -->
                <h1>There are <xsl:value-of select = "count(ds:Food/ds:recipe[not(ds:allergens/ds:allergen[@alref = 'al9'or @alref = 'al1'])])"/> recipes without Egg and wheat Allergy</h1>
                <!-- Iterate through each recipe -->
                <xsl:for-each select="//ds:recipe[not(ds:allergens/ds:allergen[@alref = 'al9' or @alref= ' al1'])]">
				<!-- Display the title of the recipe -->
                    <h2>Recipe Title: <xsl:value-of select="ds:title"/></h2>
                    <!-- Display other allergies for the recipe -->
                    <ul>
                        <xsl:for-each select="ds:allergens/ds:allergen[not(@alref = 'al9' or @alref = 'al1')]">
						<!-- Display the name of the allergen using the defined key -->
                            <li><strong>Allergy Name:</strong> <xsl:value-of select="key('allergenKey', @alref)/al:name"/></li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
