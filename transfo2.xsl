<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.dsti-food.com/">

<xsl:variable name="varCourse" select="'Soup'"/>
<xsl:variable name="totalNote"/>
<xsl:variable name="totalReviews"/>

	<xsl:template match="/">
		<html>
			<body>
				<h1>The average note of the <xsl:value-of select="$varCourse"/> dishes </h1>
			<xsl:for-each select="//ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $varCourse]/@id]">
				<xsl:apply-templates select="ds:reviews"/>
			</xsl:for-each>
			</body> 
		</html>
	</xsl:template>

	<xsl:template match="ds:reviews">
		For this <xsl:value-of select="../ds:title"/> dish, total note is <xsl:value-of select="round(ds:numReviews * ds:averageRating)"/>
		<xsl:variable name="totalReviews" select=""/>
		
	</xsl:template>

</xsl:stylesheet>
