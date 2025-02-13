<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<!--  Deberás crear un documento XSLT que ao procesalo obteña como resultado un documento
de texto. Cando no documento orixe existe o produto co atributo "cod="LACT012"", o do-
cumento de saída deberá conter o texto "Atopado!!". -->

  <xsl:template match="produto[@cod='LACT012']">
    Atopado!!
  </xsl:template>
</xsl:stylesheet>
