<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.dsti-food.com/" xmlns:al="http://allergens.dsti.com/">
    <!-- Define XML output format with UTF-8 encoding, indentation, and including XML declaration -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

    <!-- Define key for mapping allergen IDs to their names -->
    <xsl:key name="allergenKey" match="al:allergie" use="@id"/>
    <!-- Define key for mapping diet category IDs to their names -->
    <xsl:key name="dietCategoryKey" match="ds:dietCategory" use="@id"/>

    <!-- Match the root element -->
    <xsl:template match="/">
        <!-- Root element for the output XML -->
        <Recipes>
            <!-- Apply templates to process each recipe -->
            <xsl:apply-templates select="ds:Food/ds:recipe"/>
        </Recipes>
    </xsl:template>

    <!-- Template for processing each recipe -->
    <xsl:template match="ds:recipe">
        <!-- Element for each recipe -->
        <Recipe>
            <!-- Title of the recipe -->
            <Title><xsl:value-of select="ds:title"/></Title>
            <!-- Diet categories associated with the recipe -->
            <DietCategories>
                <!-- Loop through each diet category -->
                <xsl:for-each select="ds:categoryofDiet/ds:dietCategory">
                    <!-- Display the name of the diet category using the dietCategoryKey -->
                    <DietCategory><xsl:value-of select="key('dietCategoryKey', @dcref)/ds:name"/></DietCategory>
                </xsl:for-each>
            </DietCategories>
            <!-- Allergens associated with the recipe -->
            <Allergens>
                <!-- Loop through each allergen -->
                <xsl:for-each select="ds:allergens/ds:allergen">
                    <!-- Display the name of the allergen using the allergenKey -->
                    <xsl:value-of select="key('allergenKey', @alref)/al:name"/>
                </xsl:for-each>
            </Allergens>
        </Recipe>
    </xsl:template>
</xsl:stylesheet>