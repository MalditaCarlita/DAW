<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" method="text"/>
  <xsl:template match="cliente">
   <html>
    <head>
      <title>Cliente <xsl:value-of select="@cod"/></title>
    </head>
    <body>
      <p>Cliente: <xsl:value-of select="@cod"/></p>
      <p>Número de produtos: <xsl:value-of select="count(//produtos/produto)"/></p>
    </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
