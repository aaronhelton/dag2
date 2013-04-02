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

    <xsl:template match="dri:list" mode="browse">
      <li class="dropdown">
        <xsl:apply-templates select="dri:head" mode="browse"/>
        <xsl:apply-templates select="dri:list[@n='global']" mode="browse-sub"/>
      </li>
    </xsl:template>

    <xsl:template match="dri:list" mode="browse-sub">
      <ul>
        <xsl:call-template name="standardAttributes">
          <xsl:with-param name="class">
            <xsl:text>dropdown-menu</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates select="dri:item" mode="browse"/>
      </ul>
    </xsl:template>

    <xsl:template match="dri:options/dri:list/dri:item" mode="administrative">
      <li>
        <xsl:call-template name="standardAttributes">
          <xsl:with-param name="class">
            <xsl:text>nav-item</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
      </li>
    </xsl:template>

    <xsl:template match="dri:options/dri:list/dri:list/*" mode="discovery">
      <li>
        <xsl:choose>
          <xsl:when test="not(./dri:xref) and not(@rend='selected')">
            <xsl:call-template name="standardAttributes">
              <xsl:with-param name="class">
                <xsl:text>nav-header</xsl:text>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="not(./dri:xref) and @rend='selected'">
            <xsl:call-template name="standardAttributes">
              <xsl:with-param name="class">
                <xsl:text>selected</xsl:text>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="standardAttributes">
              <xsl:with-param name="class">
                <xsl:text>nav-item</xsl:text>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
      </li>
    </xsl:template>

    <xsl:template match="dri:item" mode="browse">
      <li>
          <xsl:call-template name="standardAttributes">
            <xsl:with-param name="class">
              <xsl:text>menu-item</xsl:text>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
      </li>
    </xsl:template>

    <xsl:template match="dri:reference" mode="summaryList">
      <xsl:variable name="externalMetadataURL">
        <xsl:text>cocoon:/</xsl:text>
        <xsl:value-of select="@url"/>
        <xsl:text>?sections=dmdSec,fileSec</xsl:text>
      </xsl:variable>
      <li>
        <xsl:apply-templates select="document($externalMetadataURL)" mode="summaryList"/>
        <xsl:apply-templates/>
      </li>
    </xsl:template>

    <xsl:template match="//dri:referenceSet[@type='summaryList']" priority="2">
      <xsl:apply-templates select="dri:head" mode="secondary-browse"/>
      <xsl:choose>
        <xsl:when test="descendant-or-self::dri:referenceSet/@rend='hierarchy' or ancestor::dri:referenceSet/@rend='hierarchy'">
          <ul class="nav nav-list">
            <xsl:apply-templates select="*[not(name()='head')]" mode="summaryList"/>
          </ul>
        </xsl:when>
        <xsl:otherwise>
          <ul class="nav nav-list">
            <xsl:apply-templates select="*[not(name()='head')]" mode="summaryList"/>
          </ul>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>



</xsl:stylesheet>
