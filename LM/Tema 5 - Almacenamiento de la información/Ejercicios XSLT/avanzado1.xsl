<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
  <xsl:template match="/">
    <almacenamento>
      <discos num="{count(equipos/máquina/hardware/disco)}">
        <xsl:apply-templates select="equipos/máquina" mode="discos"/>
      </discos>
      <memorias num="{count(equipos/máquina/hardware/memoria)}">
        <xsl:apply-templates select="equipos/máquina" mode="memorias"/>
      </memorias>
    </almacenamento>
</xsl:template>
<xsl:template match="máquina" mode="discos">
  <xsl:copy-of select="hardware/disco" />
</xsl:template>
<xsl:template match="máquina" mode="memorias">
  <xsl:copy-of select="hardware/memoria" />
</xsl:template>
</xsl:stylesheet>
