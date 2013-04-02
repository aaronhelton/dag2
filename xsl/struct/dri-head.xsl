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

    <xsl:template match="dri:head" mode="frontpage">
      <h2>
        <xsl:call-template name="standardAttributes">
          <xsl:with-param name="class">
            <xsl:text>body-header</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
      </h2>
    </xsl:template>

    <xsl:template match="dri:head" mode="browse">
        <a data-toggle="dropdown">
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
          </xsl:attribute>
          <xsl:call-template name="standardAttributes">
            <xsl:with-param name="class">
              <xsl:text>dropdown-toggle</xsl:text>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
          <b class="caret"><xsl:text>&#160;</xsl:text></b>
        </a>
    </xsl:template>

    <xsl:template match="dri:head" mode="discovery-header">
      <span>
        <xsl:call-template name="standardAttributes">
          <xsl:with-param name="class">
            <xsl:text>discovery-header</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
      </span>
    </xsl:template>



</xsl:stylesheet>
