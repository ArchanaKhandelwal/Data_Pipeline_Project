<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/">
 <!-- Define HTML output format with specific version, encoding, and indentation -->
	<xsl:output method="html"
	            version="4.0"
	            encoding="UTF-8"
	            indent="yes"/>
	<!--Create a list of recipes in the diet category with sugar-free and zero cholesterol nutrition values.-->
	<xsl:template match="/">
		<html>
			<head>
				<title>Recipe List</title>
			</head>
			<body>
			<!-- Heading indicating the number of recipes matching the criteria -->
				<h1>List of <xsl:value-of select="count(ds:Food/ds:recipe[ds:categoryofDiet/ds:dietCategory[@dcref='dc4']and ds:nutrition_score/ds:nutri_value[@nfref='nf2'][ds:value = 0]])"/> sugar free recipes having zero cholestrol</h1>
				<!-- Apply templates to match recipe nodes -->
				<xsl:apply-templates select="ds:Food/ds:recipe"/>
			</body>
		</html>
	</xsl:template>
	<!-- Template to process individual recipe nodes -->
	<xsl:template match="ds:recipe">
	<!-- Define variables for diet name, nutrition name, and nutrition value -->
		<xsl:variable name="DietName"
		              select="//ds:dietCategories/ds:dietCategory[@id='dc4']/ds:name"/>
		 <xsl:variable name="NutriName"
		              select="//ds:nutritional/ds:nutrition[@id='nf2']/ds:name"/>
		<xsl:variable name="NutriValue" select="ds:nutrition_score/ds:nutri_value[@nfref='nf2']/ds:value"/>
		<!-- Check if the recipe meets the criteria -->
		<xsl:if test="ds:categoryofDiet/ds:dietCategory[@dcref='dc4']and ds:nutrition_score/ds:nutri_value[@nfref='nf2'][ds:value = 0]">
		<!-- Display recipe details -->
			<h2>Recipe Name: <xsl:value-of select="ds:title"/>
			</h2>
			<p><strong>Diet Category:</strong><xsl:value-of select="$DietName"/>
			</p>
			<p><strong>Nutrition:</strong> <xsl:value-of select="$NutriName"/></p>
			<p><strong>cholesterol Value:</strong> <xsl:value-of select="$NutriValue"/>	</p>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
