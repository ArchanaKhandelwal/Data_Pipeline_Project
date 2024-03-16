<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/"
                exclude-result-prefixes="ds al">

    <xsl:param name="selectedTitle" select="'Almond Oat Banana Crepes'"/>

    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Template for matching the root element -->
    <xsl:template match="/">
        <html>
        <head>
            <style>
                table {
                    border-collapse: collapse;
                    width: 100%;
                }
                th, td {
                    border: 1px solid black;
                    padding: 8px;
                    text-align: left;
                }
                th {
                    background-color: #f2f2f2;
                }
            </style>
        </head>
        <body>
            <!-- Select the desired recipe -->
            <xsl:variable name="recipe" select="/ds:Food/ds:recipe[ds:title = $selectedTitle]" />
            <!-- Output the recipe -->
            <xsl:apply-templates select="$recipe"/>
        </body>
        </html>
    </xsl:template>

    <!-- Template for matching the recipe element -->
    <xsl:template match="ds:recipe">
        <h2>Title: <xsl:value-of select="ds:title"/></h2>
        <p>Description: <xsl:value-of select="ds:description"/></p>
        <h3>Ingredients:</h3>
        <table>
            <tr>
                <th>Name</th>
                <th>Quantity</th>
                <th>Unit</th>
            </tr>
            <xsl:for-each select="ds:ingredients/ds:ingredient">
                <tr>
                    <td><xsl:value-of select="@name"/></td>
                    <td><xsl:value-of select="@quantity"/></td>
                    <td><xsl:value-of select="@unit"/></td>
                </tr>
            </xsl:for-each>
        </table>
        <h3>Instructions:</h3>
        <ol>
            <xsl:for-each select="ds:instructions/ds:steps">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ol>
    </xsl:template>

</xsl:stylesheet>
