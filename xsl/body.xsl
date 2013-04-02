<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
        xmlns:dri="http://di.tamu.edu/DRI/1.0/"
        xmlns:mets="http://www.loc.gov/METS/"
        xmlns:xlink="http://www.w3.org/TR/xlink/"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
        xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
        xmlns:xhtml="http://www.w3.org/1999/xhtml"
        xmlns:mods="http://www.loc.gov/mods/v3"
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns="http://www.w3.org/1999/xhtml"
        exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc">

    <xsl:output indent="yes"/>

  <xsl:template match="dri:body">
    <xsl:choose>
      <xsl:when test="./dri:div[@n='news']">
      </xsl:when>
      <xsl:when test="./dri:div[@n='community-home'] or ./dri:div[@n='collection-home']">
      </xsl:when>
      <xsl:when test="./dri:div[@n='community-browse']">
      </xsl:when>
      <xsl:when test="./dri:div[@n='search']">
      </xsl:when>
      <xsl:when test="./dri:div[@n='epeople-main']">
      </xsl:when>
      <xsl:when test="./dri:div[@n='eperson-add']">
      </xsl:when>
      <xsl:when test="./dri:div[@id='aspect.eperson.EditProfile.div.information']">
      </xsl:when>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>
