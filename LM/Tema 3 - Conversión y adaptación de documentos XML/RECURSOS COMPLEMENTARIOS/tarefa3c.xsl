<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8" method="html"/>
  <xsl:template match="máquina">
  <HTML>
    <HEAD>
    <TITLE>Táboa máquinas</TITLE>
    </HEAD>
    <BODY>
      <H1>Táboa das máquinas</H1>
      <TABLE border="1">
        <tr>
          <th>Máquina</th>
          <th>Procesador</th>
          <th>Memoria</th>
          <th>Disco(s)</th>
        </tr>
        <tr>
          <td><a href="http://{config/IP}"><xsl:value-of select="@nome"/></a></td>
          <td><xsl:value-of select="hardware/procesador/@marca"/></td>
          <td><xsl:value-of select="hardware/memoria"/> GB <xsl:value-of select="hardware/memoria/@tecnoloxía"/></td>
          <td><xsl:value-of select="hardware/memoria"/> GB <xsl:value-of select="hardware/memoria/@tecnoloxía"/></td>
          <td><ul><li><xsl:value-of select="@capacidade" />GB (<xsl:value-of select="@tecnoloxía" />)</li></ul></td>
        </tr>
      </TABLE>
    </BODY>
  </HTML>
    </xsl:template>
</xsl:stylesheet>
