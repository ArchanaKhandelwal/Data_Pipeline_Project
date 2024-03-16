<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.dsti-food.com/">
	<xsl:output method="text"/>

	<!-- Entry template -->
	<xsl:template match="/ds:Food">
        {
            "mealType": "Dinner",
            "recipes": [
                
		<xsl:apply-templates select="ds:mealTypes/ds:mealType[@id='mt2']"/>
            ]
        }
    
	</xsl:template>
	<!-- Template for Dinner MealType, adjusted for first 2 recipes only -->
	<xsl:template match="ds:mealType">
		<xsl:for-each select="/ds:Food/ds:recipe[ds:mealtimes/ds:mealtime/@mtref=current()/@id][position() &lt;= 2]">
			<xsl:if test="position() > 1">,</xsl:if>
            {
                "title": "<xsl:value-of select="ds:title"/>",
                "category": "<xsl:value-of select="ds:categoryofDiet/ds:dietCategory/@dcref"/>",
                "cuisine": "<xsl:value-of select="ds:cuisine/@cref"/>",
                "ingredients": [                 
                    <xsl:for-each select="ds:ingredients/ds:ingredient">
                        <xsl:if test="position() > 1">,</xsl:if>
                            {
                                "name": "<xsl:value-of select="@name"/>",
                                "quantity": "<xsl:value-of select="@quantity"/>",
                                "unit": "<xsl:value-of select="@unit"/>"
                            }
                    </xsl:for-each>
                ],
                "instructions": [
                    <xsl:for-each select="ds:instructions/ds:steps">
                        <xsl:if test="position() > 1">,</xsl:if>
                            "<xsl:value-of select="."/>"
                    </xsl:for-each>
                ]
            }
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>