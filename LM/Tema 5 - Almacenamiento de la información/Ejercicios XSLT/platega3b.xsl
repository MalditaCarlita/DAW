<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" method="html"/>
<xsl:template match="equipos">
    <html>
      <head>
        <title>Tarefa 3 b Platega</title>
      </head>
      <body>
        <table>
          <th>
            <td>Máquina</td>
            <td>Procesador</td>
            <td>Memoria</td>
          </th>
          <tr>
          <xsl:apply-templates select="máquina"/>
          </tr>
        </table>
      </body>
    </html>
</xsl:template>
    <xsl:template match="máquina">
            <td><xsl:value-of select="@nome"/></td>
            <td><xsl:value-of select="hardware/procesador/@marca"/><xsl:value-of select="hardware/procesador"/></td>
            <td><xsl:value-of select="hardware/memoria/@tecnoloxía"/><xsl:value-of select="hardware/memoria"/></td>
    </xsl:template>
</xsl:stylesheet>
