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
	<!--Create a list of recipes with fewer than 300 calories that are suitable for lunch time during the summer season.-->
	<xsl:template match="/">
		<html>
			<head>
				<title>Recipe List</title>
			</head>
			<body>
				<!-- Heading indicating the number of recipes with fewer than 300 calories matching the criteria for lunch time and the summer season. -->
				<h1>List of <xsl:value-of select="count(ds:Food/ds:recipe[ds:calories &lt; 300 and ds:seasonal/ds:season[@sref='s2'] and ds:mealtimes/ds:mealtime[@mtref='mt2'] ])"/> recipes with fewer than 300 calories that are suitable for lunch time during the summer season.</h1>
				<!-- Apply templates to match recipe nodes -->
				<xsl:apply-templates select="ds:Food/ds:recipe"/>
			</body>
		</html>
	</xsl:template>
	<!-- This template deals with each recipe separately -->

	<xsl:template match="ds:recipe">
		<!-- Define variables for season name and mealtime -->
		<xsl:variable name="seasonName"
		              select="//ds:seasons/ds:season[@id='s2']/ds:name"/>
		<xsl:variable name="Mealtime"
		              select="//ds:mealTypes/ds:mealType[@id='mt2']/ds:name"/>
		<!-- Check if the recipe matches the criteria -->
		<xsl:if test="ds:calories &lt; 300 and ds:seasonal/ds:season[@sref='s2'] and ds:mealtimes/ds:mealtime[@mtref='mt2']">
			<!-- Display recipe details -->
			<h2>Recipe Name: <xsl:value-of select="ds:title"/>
			</h2>
			<p>Calories:<xsl:value-of select="ds:calories"/>
			</p>
			<p>Season: <xsl:value-of select="$seasonName"/>
			</p>
			<p>Meal time: <xsl:value-of select="$Mealtime"/>
			</p>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
