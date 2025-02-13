<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>Ciclo</TITLE>
      </HEAD>
      <BODY>
        <H1><xsl:value-of select="//módulo"/></H1>
        <H2>- <xsl:value-of select="//profesor"/> -</H2>
        <P><xsl:value-of select="//módulo/@horas"/> horas
        (<xsl:value-of select="//módulo/@sesións"/> sesións semanais.)</P>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
