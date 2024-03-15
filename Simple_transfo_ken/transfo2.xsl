<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.dsti-food.com/">

<xsl:variable name="course1" select="'Soup'"/>
<xsl:variable name="course2" select="'Salad'"/>
<xsl:variable name="course3" select="'Sandwich'"/>
<xsl:variable name="course4" select="'Main Dish'"/>
<xsl:variable name="course5" select="'Dessert'"/>
<xsl:variable name="course6" select="'Beverage'"/>
<xsl:variable name="course7" select="'Snacks'"/>
<xsl:variable name="course8" select="'Appetizer'"/>

<xsl:template match="/">
	<xsl:variable name="RecipeCourse1" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course1]/@id]" />
	<xsl:variable name="RecipeCourse2" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course2]/@id]" />
	<xsl:variable name="RecipeCourse3" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course3]/@id]" />
	<xsl:variable name="RecipeCourse4" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course4]/@id]" />
	<xsl:variable name="RecipeCourse5" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course5]/@id]" />
	<xsl:variable name="RecipeCourse6" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course6]/@id]" />
	<xsl:variable name="RecipeCourse7" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course7]/@id]" />
	<xsl:variable name="RecipeCourse8" select="ds:Food/ds:recipe[ds:course/@ctref = //ds:courseType/ds:course[ds:name = $course8]/@id]" />
	<html>
		<head></head>
		<body>
			<h1>The average note of the <xsl:value-of select="$course1"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote1">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse1" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote1"/>
			</p>
			<h1>The average note of the <xsl:value-of select="$course2"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote2">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse2" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote2"/>
			</p>
			<h1>The average note of the <xsl:value-of select="$course3"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote3">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse3" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote3"/>
			</p>
			<h1>The average note of the <xsl:value-of select="$course4"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote4">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse4" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote4"/>
			</p>
			<h1>The average note of the <xsl:value-of select="$course5"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote5">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse5" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote5"/>
			</p>
			<h1>The average note of the <xsl:value-of select="$course6"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote6">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse6" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote6"/>				
			</p>
			<h1>The average note of the <xsl:value-of select="$course7"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote7">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse7" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote7"/>
			</p>
			<h1>The average note of the <xsl:value-of select="$course8"/> dishes is: </h1>
			<p>
				<xsl:variable name="averageNote8">
					<xsl:call-template name="accumulateSums">
						<xsl:with-param name="recipes" select="$RecipeCourse8" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$averageNote8"/>				
			</p>				
		</body> 
	</html>
</xsl:template>

<!-- Template to recursively calculate and accumulate the sums for each recipe -->
<xsl:template name="accumulateSums">
    <xsl:param name="recipes" />
    <xsl:param name="index" select="1"/>
    <xsl:param name="sum" select="0"/>    
	
 	<xsl:variable name="totalReviews" select="sum($recipes/ds:reviews/ds:numReviews)"/>
 
    <xsl:choose>
        <xsl:when test="$index &lt;= count($recipes)"> 
			<xsl:variable name="currentRecipe" select="$recipes[$index]"/>
            <xsl:variable name="currentSum" select="number($currentRecipe/ds:reviews/ds:numReviews) * number($currentRecipe/ds:reviews/ds:averageRating)"/>

            <xsl:call-template name="accumulateSums">
					<xsl:with-param name="recipes" select="$recipes" />
                <xsl:with-param name="index" select="$index + 1"/>
                <xsl:with-param name="sum" select="$sum + $currentSum"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
<!--
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
-->
				<xsl:value-of select="$sum div $totalReviews"/>
<!--
				<xsl:text>&#10;</xsl:text>    
			</p>                 
-->
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>

</xsl:stylesheet>
