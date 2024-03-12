<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  
  <!-- Template to match the root element -->
  <xsl:template match="/Food">
    <!-- Variable to store the sum -->
    <xsl:variable name="sum">
      <!-- Calculate the sum -->
      <xsl:call-template name="calculateSum">
        <!-- Pass all recipe nodes as parameter -->
        <xsl:with-param name="recipes" select="recipe"/>
      </xsl:call-template>
    </xsl:variable>
    
    <!-- Output the sum -->
    <xsl:text>Total sum of products: </xsl:text>
    <xsl:value-of select="$sum"/>
  </xsl:template>
  
  <!-- Template to calculate the sum recursively -->
  <xsl:template name="calculateSum">
    <!-- Parameters: nodes to sum and current total -->
    <xsl:param name="recipes"/>
    <xsl:param name="total" select="0"/>
    
    <!-- Base case: if there are no more nodes, return the total -->
    <xsl:choose>
      <xsl:when test="not($recipes)">
        <xsl:value-of select="$total"/>
      </xsl:when>
      <!-- Recursive case: sum the product of nbReviews and note for the current recipe 
           and call the template recursively with the next recipe and updated total -->
      <xsl:otherwise>
        <xsl:call-template name="calculateSum">
          <xsl:with-param name="recipes" select="$recipes[position() > 1]"/>
          <xsl:with-param name="total" select="$total + $recipes[1]/reviews/nbReviews * $recipes[1]/reviews/note"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
