<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.dsti-food.com/">

<xsl:variable name="varCourse" select="'Soup'"/>

<xsl:template match="/">
	<html>
		<head></head>
		<body>
			<h1>The average note of the <xsl:value-of select="$varCourse"/> dishes </h1>
			<!-- Apply templates to select and process Soup dishes -->
			<xsl:call-template name="accumulateSums"/>
		</body> 
	</html>
</xsl:template>

<!-- Template to recursively calculate and accumulate the sums for each recipe -->
<xsl:template name="accumulateSums">
    <xsl:param name="index" select="1"/>
    <xsl:param name="sum" select="0"/>
	
 	<xsl:variable name="totalReviews" select="sum(ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $varCourse]/@id]/ds:reviews/ds:numReviews)"/>
 
    <xsl:choose>
		<!-- Recursive case: accumulate the sum for each  recipe -->
        <xsl:when test="$index &lt;= count(ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $varCourse]/@id])"> 
			<xsl:variable name="currentRecipe" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $varCourse]/@id][$index]"/>
            <xsl:variable name="currentSum" select="number($currentRecipe/ds:reviews/ds:numReviews) * number($currentRecipe/ds:reviews/ds:averageRating)"/>
			<!-- Recursively call the template with updated index and accumulated sum -->
            <xsl:call-template name="accumulateSums">
                <xsl:with-param name="index" select="$index + 1"/>
                <xsl:with-param name="sum" select="$sum + $currentSum"/>
            </xsl:call-template>
        </xsl:when>
		<!-- Base case: stop recursion when all recipes have been processed -->
        <xsl:otherwise>
			<p>
				Total sum of ratings: 
				<xsl:value-of select="$sum"/>
				<xsl:text>&#10;</xsl:text>
			</p>
			<p>
				Total number of reviews: 
				<xsl:value-of select="$totalReviews"/>
				<xsl:text>&#10;</xsl:text>   
			</p>
			<p>
				Overall average rating:
				<xsl:value-of select="$sum div $totalReviews"/>
				<xsl:text>&#10;</xsl:text>    
			</p>                 
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
