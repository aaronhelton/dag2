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

    <!-- Breadcrumb trail -->
    <xsl:template name="trail">
      <xsl:choose>
        <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='title']/i18n:text='xmlui.general.dspace_home' 
                        or /dri:document/dri:body/dri:div[@rend='primary submission']">
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:trail">
            <ul class="breadcrumb">
              <xsl:apply-templates select="/dri:document/dri:meta/dri:pageMeta/dri:trail"/>
            </ul>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template match="dri:trail">
      <li>
        <xsl:attribute name="class">
          <xsl:text>ds-trail-link </xsl:text>
          <xsl:if test="position()=last()">
            <xsl:text>active</xsl:text>
          </xsl:if>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="./@target">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="./@target"/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </a>
            <span class="divider"><xsl:text>/</xsl:text></span>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates/>
          </xsl:otherwise>
        </xsl:choose>
      </li>
    </xsl:template>

</xsl:stylesheet>
