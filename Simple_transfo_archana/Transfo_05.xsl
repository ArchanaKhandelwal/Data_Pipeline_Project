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
	<!--Create a list of soup recipes cooked using the stovetop method..-->
	<xsl:template match="/">
		<html>
			<head>
				<title>Recipe List</title>
			</head>
			<body>
				<h1>List of <xsl:value-of select="count(ds:Food/ds:recipe[ds:course[@ctref='ct2']and ds:methodUsed/ds:method[@mref='m5']and ds:ingredients [@servings &gt; 4]])"/> soup recipes cooked using stovetop method</h1>
				<xsl:apply-templates select="ds:Food/ds:recipe"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ds:recipe">
		<xsl:variable name="CTName"
		              select="//ds:courseType/ds:course[@id='ct2']/ds:name"/>
		 <xsl:variable name="MethodName"
		              select="//ds:methods/ds:method[@id='m5']/ds:name"/>
		<xsl:variable name="ServingValue" select="ds:ingredients/@servings"/>
		<xsl:if test="ds:course[@ctref='ct2']and ds:methodUsed/ds:method[@mref='m5']and ds:ingredients [@servings &gt; 4]">
			<h2>Recipe Name: <xsl:value-of select="ds:title"/>
			</h2>
			<p><strong>Course type:</strong><xsl:value-of select="$CTName"/>
			</p>
			<p><strong>Method Used for cooking:</strong> <xsl:value-of select="$MethodName"/></p>
			<p><strong>No. of servings:</strong> <xsl:value-of select="$ServingValue"/>	</p>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
