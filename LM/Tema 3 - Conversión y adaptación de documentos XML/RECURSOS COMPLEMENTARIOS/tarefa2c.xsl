<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="html"/>
    <xsl:template match="venda">
      <HTML>
        <HEAD>
          <TITLE>Clientes <xsl:value-of select="cliente/@cod"/></TITLE>
        </HEAD>
        <BODY>
          <p>Cliente: <xsl:value-of select="cliente/@cod"/></p>
          <p>Número de produtos: <xsl:value-of select="count(//produtos/produto)"/></p>
        </BODY>
      </HTML>
    </xsl:template>
</xsl:stylesheet>
