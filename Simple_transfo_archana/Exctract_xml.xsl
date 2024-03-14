<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.dsti-food.com/" xmlns:al="http://allergens.dsti.com/">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>


 <xsl:key name="allergenKey" match="al:allergie" use="@id"/>
 <xsl:key name="dietCategoryKey" match="ds:dietCategory" use="@id"/>
    <xsl:template match="/">
        <Recipes>
            <xsl:apply-templates select="ds:Food/ds:recipe"/>
        </Recipes>
    </xsl:template>

    <xsl:template match="ds:recipe">
        <Recipe>
            <Title><xsl:value-of select="ds:title"/></Title>
            <DietCategories>
                <xsl:for-each select="ds:categoryofDiet/ds:dietCategory">
                    <DietCategory><xsl:value-of select="key('dietCategoryKey', @dcref)/ds:name"/></DietCategory>
                </xsl:for-each>
            </DietCategories>
            <Allergens>
                <xsl:for-each select="ds:allergens/ds:allergen">
                             <xsl:value-of select="key('allergenKey', @alref)/al:name"/>
                        </xsl:for-each>
               
            </Allergens>
        </Recipe>
    </xsl:template>
</xsl:stylesheet>	