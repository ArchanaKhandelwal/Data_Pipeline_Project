<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="http://www.dsti-food.com/"
                xmlns:al="http://allergens.dsti.com/">
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:key name="cuisineKey" match="ds:cuisines/ds:cuisine" use="@id"/>

    <!-- Variable for meal type -->
    <xsl:param name="varMealType" select="'Breakfast'"/>

    <!-- Template for the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe List</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        background-color: #f9f9f9;
                        margin: 0;
                        padding: 20px;
                        color: #333;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                    }
                    th, td {
                        padding: 8px;
                        text-align: left;
                        border-bottom: 1px solid #ddd;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    tr:hover {
                        background-color: #f5f5f5;
                    }
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Recipe Title</th>
                        <th>Cuisine</th>
                    </tr>
                    <!-- Apply templates to select recipes -->
                    <xsl:apply-templates select="ds:Food/ds:recipe[ds:mealtimes/ds:mealtime/@mtref = //ds:mealTypes/ds:mealType[ds:name = $varMealType]/@id]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Template for matching recipe elements -->
    <xsl:template match="ds:recipe">
        <tr>
            <td>
                <xsl:value-of select="ds:title"/>
            </td>
            <td>
                <!-- Loop through cuisines -->
                <xsl:for-each select="ds:cuisine">
                    <xsl:variable name="cuisineId" select="@cref"/>
                    <!-- Output cuisine name -->
                    <xsl:value-of select="key('cuisineKey', $cuisineId)/ds:name"/>
                </xsl:for-each>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
