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
	<!--  Create a list of recipes where the number of user reviews is less than 200 and has a featured comment or FAQs.-->
	<xsl:template match="/">
		<html>
			<head>
				<title>Recipe List</title>
			</head>
			<body>
				 <!-- Heading indicating the number of recipes matching criteria  where user reviews user reviews is less than 200 and has a featured comment or FAQs  -->
				 <h1>List of <xsl:value-of select="count(ds:Food/ds:recipe/ds:reviews[ds:numReviews &lt; 200 ])" /> recipes where the number of user reviews is less than 200 and has a featured comment or FAQs</h1>
				 <!-- Apply templates to match recipe nodes -->
				<xsl:apply-templates select="ds:Food/ds:recipe"/>
			</body>
		</html>
	</xsl:template>

 <xsl:template match="ds:recipe">
<!-- Check if the number of reviews is less than 200 -->
        <xsl:if test="ds:reviews/ds:numReviews &lt; 200">
			 <!-- Display recipe name -->
            <h2>Recipe Name: <xsl:value-of select="ds:title"/></h2>
			<!-- Display the number of reviews -->
            <p><strong>No.of reviews:</strong><xsl:value-of select="ds:reviews/ds:numReviews"/></p>
		<!-- Check if there are FAQs -->
		<xsl:if test="ds:FAQs">
        <p><strong>FAQs:</strong></p>
		 <!-- Apply templates to FAQs -->
        <xsl:apply-templates select="ds:FAQs/ds:FAQ"/>
    </xsl:if>
		  <!-- Check if there's a featured comment and display it -->
			 <xsl:if test="ds:featured_comment/ds:content">
        <p><strong>Featured Comment:</strong> <xsl:value-of select="ds:featured_comment/ds:content"/></p>
    </xsl:if>
        </xsl:if>
    </xsl:template>
	<!-- Template to process FAQs -->
	 <xsl:template match="ds:FAQs/ds:FAQ">
        <div>
            <!-- Output question -->
            <p><strong>Question:</strong> <xsl:value-of select="ds:Question"/></p>
            <!-- Output answer -->
            <p><strong>Answer:</strong> <xsl:value-of select="ds:Answer"/></p>
        </div>
    </xsl:template>

</xsl:stylesheet>