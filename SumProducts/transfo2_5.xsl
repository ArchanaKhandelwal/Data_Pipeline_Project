<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  
  <!-- Template to match the root element -->
  <xsl:template match="/Food">
    <!-- Variable to store the total sum -->
    <xsl:variable name="totalSum">
      <!-- Apply templates to select and process lunch recipes -->
      <xsl:call-template name="accumulateSums"/>
    </xsl:variable>
    
    <!-- Output the total sum -->
    <xsl:text>Total sum of products for lunch recipes: </xsl:text>
    <xsl:value-of select="$totalSum"/>
  </xsl:template>
  
  <!-- Template to recursively calculate and accumulate the sums for each lunch recipe -->
  <xsl:template name="accumulateSums">
    <xsl:param name="index" select="1"/>
    <xsl:param name="sum" select="0"/>
    
    <!-- Base case: stop recursion when all lunch recipes have been processed -->
    <xsl:if test="$index &gt; count(recipe[type='lunch'])">
      <xsl:value-of select="$sum"/>
    </xsl:if>
    
    <!-- Recursive case: accumulate the sum for each lunch recipe -->
    <xsl:if test="$index &lt;= count(recipe[type='lunch'])">
      <xsl:variable name="currentRecipe" select="recipe[type='lunch'][$index]"/>
      <xsl:variable name="currentSum" select="number($currentRecipe/reviews/nbReviews) * number($currentRecipe/reviews/note)"/>
      
      <!-- Output the sum for the current lunch recipe (for debugging) -->
      <xsl:text>Sum for current lunch recipe: </xsl:text>
      <xsl:value-of select="$currentSum"/>
      <xsl:text>&#10;</xsl:text> <!-- Newline character -->
      
      <!-- Recursively call the template with updated index and accumulated sum -->
      <xsl:call-template name="accumulateSums">
        <xsl:with-param name="index" select="$index + 1"/>
        <xsl:with-param name="sum" select="$sum + $currentSum"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
