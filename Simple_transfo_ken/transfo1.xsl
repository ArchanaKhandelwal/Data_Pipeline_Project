<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.dsti-food.com/">

<xsl:variable name="varCuisine" select="'American Cuisine'"/>

	<xsl:template match="/">
		<html>
			<head> <title><xsl:value-of select="$varCuisine"/></title> </head>
			<body>
				<h1>Here is the list of the <xsl:value-of select="$varCuisine"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:cuisine/@cref = //ds:cuisine[ds:name = $varCuisine]/@id]">
				<blockquote>				
					<xsl:value-of select="ds:title"/>
				</blockquote>
			</xsl:for-each>
			</body> 
		</html>
	</xsl:template>

</xsl:stylesheet>
