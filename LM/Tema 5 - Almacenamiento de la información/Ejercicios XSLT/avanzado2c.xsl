<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" method="html"/>
  <xsl:template match="/">
  <html>
    <head>
      <title>Táboa de ordenadores con OS</title>
    </head>
    <body>
      <h1>Táboa de ordenadores con OS</h1>
      <table border="1">
        <tr>
          <th>Máquina</th>
          <th>Tipo</th>
          <th>OS</th>
          <th>Capacidade HD</th>
        </tr>
        <xsl:apply-templates select="/equipos/máquina[config/OS]" mode="lista">
          <xsl:sort select="/hardware/disco/@capacidade" order="descending"/>
        </xsl:apply-templates>
      </table>
    </body>
  </html>
  </xsl:template>
  <xsl:template match="máquina" mode="lista">
    <xsl:element name="tr">
        <xsl:if test="config/OS = 'Windows'">
          <xsl:attribute name="bgcolor">Yellow</xsl:attribute>
        </xsl:if>
        <td><xsl:value-of select="@nome"/></td>
        <td><xsl:value-of select="hardware/tipo"/></td>
        <td><xsl:value-of select="config/OS"/></td>
        <xsl:element name="td">
        <xsl:choose>
          <xsl:when test="sum(hardware/disco/@capacidade) &gt;= 1000">
            <xsl:attribute name="bgcolor">#FF0000</xsl:attribute>
          </xsl:when>
          <xsl:when test="hardware/disco/@capacidade &gt;= 500 and hardware/disco/@capacidade &lt;1000">
            <xsl:attribute name="bgcolor">#FF4500</xsl:attribute>
          </xsl:when>
          <xsl:when test="hardware/disco/@capacidade &lt; 500 ">
          <xsl:attribute name="bgcolor">#FFA500</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="bgcolor">white</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
