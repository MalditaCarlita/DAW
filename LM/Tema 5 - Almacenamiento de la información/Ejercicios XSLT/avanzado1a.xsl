<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" method="html"/>
  <xsl:template match="/">
  <html>
    <head>
      <title>Lista de máquinas</title>
    </head>
    <body>
      <h1>Máquinas</h1>
        <ul>
          <xsl:apply-templates select="//máquina" mode="enlaces"/>
        </ul>
        <xsl:apply-templates select="//máquina" mode="lista"/>
    </body>
  </html>
  </xsl:template>
  <xsl:template match="máquina" mode="enlaces">
    <a href="#{@nome}"><xsl:value-of select="@nome"/></a>
    <xsl:value-of select="@nome"/>
  </xsl:template>
  <xsl:template match="máquina" mode="lista">
        <h2><xsl:value-of select="@nome"/></h2>
        <ul>
          <li><xsl:value-of select="hardware/tipo"/></li>
          <li><xsl:value-of select="hardware/fabricante"/></li>
          <li><xsl:value-of select="hardware/procesador"/></li>
          <xsl:apply-templates select="hardware" mode="detalle"/>
        </ul>
  </xsl:template>
  <xsl:template match="hardware" mode="detalle">
          <li>Memoria: <xsl:value-of select="mamoria"/>GB</li>
          <li>Disco: <xsl:value-of  select="disco/@capacidade"/>GB</li>
          <li><xsl:if test="gravadora">grabadora de <xsl:value-of select="//gravadora/@tipo"/></xsl:if></li>
        </xsl:template>  
</xsl:stylesheet>
