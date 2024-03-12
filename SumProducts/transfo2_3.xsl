<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  
  <!-- Template to match the root element -->
  <xsl:template match="/Food">
    <!-- Variable to store the total sum -->
    <xsl:variable name="totalSum">
      <!-- Apply templates to select and process lunch recipes -->
      <xsl:apply-templates select="recipe[type='lunch']"/>
    </xsl:variable>
    
    <!-- Output the total sum -->
    <xsl:text>Total sum of products for lunch recipes: </xsl:text>
    <xsl:value-of select="$totalSum"/>
  </xsl:template>
  
  <!-- Template to calculate the sum for each lunch recipe -->
  <xsl:template match="recipe[type='lunch']">
    <!-- Variable to store the sum for the current lunch recipe -->
    <xsl:variable name="sum">
      <!-- Calculate the sum for the current lunch recipe -->
      <xsl:value-of select="reviews/nbReviews * reviews/note"/>
    </xsl:variable>
    
    <!-- Output the sum for the current lunch recipe -->
    <xsl:text>Sum for current lunch recipe: </xsl:text>
    <xsl:value-of select="$sum"/>
    <xsl:text>&#10;</xsl:text> <!-- Newline character -->
    
    <!-- Return the sum for accumulation -->
    <xsl:value-of select="$sum"/>
  </xsl:template>
</xsl:stylesheet>
