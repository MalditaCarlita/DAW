<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" method="html"/>
<xsl:template match="/">
<html>
<head>
<title>Táboa máquinas</title>
</head>
<body>
<h1>Táboa das máquinas</h1>
<table border="1">
<tr>
<th>Máquina</th>
<th>Tipo</th>
</tr>
<xsl:apply-templates select="equipos/máquina[not(starts-with(hardware/tipo, 'Impresora'))]" mode="máquinas" >
<xsl:sort select="hardware/tipo" order="ascending"/>
<xsl:sort select="@nome" order="ascending"/>
</xsl:apply-templates>
</table>
</body>
</html>
</xsl:template>
<xsl:template match="máquina" mode="máquinas">
<xsl:element name="tr">
<xsl:if test="hardware/tipo = 'Semitorre' or hardware/tipo = 'PC Sobremesa'">
<xsl:attribute name="bgcolor">yellow</xsl:attribute>
</xsl:if>
  <td><xsl:value-of select="@nome" /></td>
  <td><xsl:value-of select="hardware/tipo" /></td>
</xsl:element>
</xsl:template>
</xsl:stylesheet>
