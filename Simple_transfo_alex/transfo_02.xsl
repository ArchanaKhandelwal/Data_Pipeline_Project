<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/">
				
	 <!-- Define output format -->
	<xsl:output method="html"
	            version="4.0"
	            encoding="UTF-8"
	            indent="yes"/>


  <xsl:template match="/">
  <html>
            <head>
                <title>Recipe List greater or less than 30mn</title><!-- Title of the HTML page -->
            </head>
            <body>
			<h1>Recipes by course type with cooking time less than 30mn</h1>
                <!-- Loop through each course -->
                <xsl:for-each select="ds:Food/ds:courseType/ds:course">
                    <!-- Get recipes with cooking time less than 30mn for the current course -->
                    <xsl:variable name="courseId" select="@id"/>
                    <!-- Get recipes with cooking time less than 30mn for the current course -->
                    <xsl:variable name="courseRecipes" select="//ds:recipe[ds:course/@ctref = $courseId and number(substring-before(substring-after(ds:totaltime, 'PT'), 'M')) &lt;= 30]"/>
                    <!-- Check if there are any recipes for the current course -->
                    <xsl:if test="$courseRecipes">
                        <!-- Display course name -->
                        <h2><xsl:value-of select="ds:name"/></h2>
                        <ul>
                            <!-- Loop through each recipe of the current course -->
                            <xsl:for-each select="$courseRecipes">
                                <!-- Display the recipe -->
                                <li>
                                    <!-- Recipe Name -->
                                    <b>Recipe Name: </b>
                                    <xsl:value-of select="ds:title"/>
                                    <br/>
                                    <!-- Total Cooking Time -->
                                    <b>Total Time: </b>
                                    <xsl:value-of select="ds:totaltime"/>
                                    
                                    <br/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
				<h1>Recipes by course type with cooking time greater than 30mn</h1>
                <!-- Loop through each course -->
                <xsl:for-each select="ds:Food/ds:courseType/ds:course">
                    <!-- Get recipes with cooking time greater than 30mn for the current course -->
                    <xsl:variable name="courseId" select="@id"/>
                    <!-- Get recipes with cooking time greater than 30mn for the current course -->
                    <xsl:variable name="courseRecipes" select="//ds:recipe[ds:course/@ctref = $courseId and number(substring-before(substring-after(ds:totaltime, 'PT'), 'M')) &gt;= 30]"/>
                    <!-- Check if there are any recipes for the current course -->
                    <xsl:if test="$courseRecipes">
                        <!-- Display course name -->
                        <h2><xsl:value-of select="ds:name"/></h2>
                        <ul>
                            <!-- Loop through each recipe of the current course -->
                            <xsl:for-each select="$courseRecipes">
                                <!-- Display the recipe -->
                                <li>
                                    <!-- Recipe Name -->
                                    <b>Recipe Name: </b>
                                    <xsl:value-of select="ds:title"/>
                                    <br/>
                                    <!-- Total Cooking Time -->
                                    <b>Total Time: </b>
                                    <xsl:value-of select="ds:totaltime"/>
                                    
                                    <br/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
            </body>
	</html>
  </xsl:template>
</xsl:stylesheet>
