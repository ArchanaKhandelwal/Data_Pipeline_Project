<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.dsti-food.com/">

<xsl:variable name="varCuisine1" select="'Japanese Cuisine'"/>
<xsl:variable name="varCuisine2" select="'French Cuisine'"/>
<xsl:variable name="varCuisine3" select="'Italian Cuisine'"/>
<xsl:variable name="varCuisine4" select="'Indian Cuisine'"/>
<xsl:variable name="varCuisine5" select="'American Cuisine'"/>

	<xsl:template match="/">
		<html>
			<body>
				<h1>Here is the list of the <xsl:value-of select="$varCuisine1"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:cuisine/@cref = //ds:cuisine[ds:name = $varCuisine1]/@id]">
				<blockquote>				
					<xsl:value-of select="ds:title"/>
				</blockquote>
			</xsl:for-each>
				<h1>Here is the list of the <xsl:value-of select="$varCuisine2"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:cuisine/@cref = //ds:cuisine[ds:name = $varCuisine2]/@id]">
				<blockquote>				
					<xsl:value-of select="ds:title"/>
				</blockquote>
			</xsl:for-each>
				<h1>Here is the list of the <xsl:value-of select="$varCuisine3"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:cuisine/@cref = //ds:cuisine[ds:name = $varCuisine3]/@id]">
				<blockquote>				
					<xsl:value-of select="ds:title"/>
				</blockquote>
			</xsl:for-each>
				<h1>Here is the list of the <xsl:value-of select="$varCuisine4"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:cuisine/@cref = //ds:cuisine[ds:name = $varCuisine4]/@id]">
				<blockquote>				
					<xsl:value-of select="ds:title"/>
				</blockquote>
			</xsl:for-each>
				<h1>Here is the list of the <xsl:value-of select="$varCuisine5"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:cuisine/@cref = //ds:cuisine[ds:name = $varCuisine5]/@id]">
				<blockquote>				
					<xsl:value-of select="ds:title"/>
				</blockquote>
			</xsl:for-each>			
			</body> 
		</html>
	</xsl:template>

</xsl:stylesheet>
