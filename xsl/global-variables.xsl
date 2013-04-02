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

  <xsl:variable name="context-path" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>

    <xsl:variable name="baseurl">
        <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='scheme']"/>
        <xsl:text>://</xsl:text>
        <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverName']"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverPort']"/>
    </xsl:variable>

    <xsl:variable name="request-uri" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']"/>

    <xsl:variable name="previousItemHandle" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='previousItemHandle']"/>
    <xsl:variable name="nextItemHandle" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='nextItemHandle']"/>
    <xsl:variable name="theme-path" select="concat($context-path,'/themes/',/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='theme'][@qualifier='path'])"/>

    <!-- Putting this here because it's used quite a alot -->
    <xsl:template name="standardAttributes">
      <xsl:param name="class"/>
      <xsl:if test="@id">
          <xsl:attribute name="id"><xsl:value-of select="translate(@id,'.','_')"/></xsl:attribute>
      </xsl:if>
      <xsl:attribute name="class">
          <xsl:value-of select="normalize-space($class)"/>
          <xsl:if test="@rend">
              <xsl:text> </xsl:text>
              <xsl:value-of select="@rend"/>
          </xsl:if>
      </xsl:attribute>
    </xsl:template>


</xsl:stylesheet>
