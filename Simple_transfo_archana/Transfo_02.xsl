<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/">
				
	 <!-- Define output format -->
	<xsl:output method="html"
	            version="4.0"
	            encoding="UTF-8"
	            indent="yes"/>

 <!-- Main template: matches the root node of the XML document -->
  <xsl:template match="/">
  <html><!-- HTML document starts here -->
            <head>
                <title>Recipe List</title><!-- Title of the HTML page -->
            </head>
            <body>
			<!-- Heading indicating the number of recipes -->
                <h1>There are <xsl:value-of select="count(ds:Food/ds:recipe/ds:title)"/> recipes along with their respective cooking time </h1>
            </body>
	</html>
    <!-- Loop through each recipe -->
    <xsl:for-each select="ds:Food/ds:recipe">
      <!-- Extract title -->
		<Li>Recipe Name:<xsl:value-of select="ds:title"/></Li>
      <!-- I used chatgpt to extract the total time -->
	   <!-- Extracting and displaying total cooking time -->
      <xsl:value-of select="concat('Total Time: ', substring-before(substring-after(ds:totaltime, 'PT'), 'M'), ' minutes', '&#10;')" />
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
