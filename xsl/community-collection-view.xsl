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

  <xsl:template name="community-collection-view">
    <div class="hero-unit">
      <div class="row-fluid">
        <div class="span3">
          <xsl:choose>
            <xsl:when test="./mets:METS/mets:fileSec/mets:fileGrp[@USE='LOGO']">
              <xsl:apply-templates select="/dri:document/dri:body/dri:div/dri:div[@n='community-view']/dri:referenceSet"/>
            </xsl:when>
            <xsl:otherwise>
              <img src="{concat($theme-path,'/lib/img/dag2.png')}"></img>
            </xsl:otherwise>
          </xsl:choose>
        </div>
        <div class="span9">
           <xsl:apply-templates select="/dri:document/dri:body/dri:div[@n='community-home']/dri:head" mode="frontpage"/>
           <xsl:text>&#160;</xsl:text>
        </div>
      </div>
      <div class="row-fluid">
        <hr/>
        <xsl:apply-templates select="/dri:document/dri:options/dri:list[@n='browse']/dri:list[@n='context']/dri:head" mode="secondary-browse"/>
        <ul class="nav nav-pills">
          <xsl:apply-templates select="/dri:document/dri:options/dri:list[@n='browse']/dri:list[@n='context']/dri:item" mode="browse"/>
        </ul>
      </div>
    </div>
    <div class="row-fluid" id="subcollections">
      <xsl:apply-templates select="//dri:referenceSet" mode="summaryList"/>
      <xsl:text>&#160;</xsl:text>
    </div>
    <div class="row-fluid" id="recent-items">
      <xsl:text>&#160;</xsl:text>
    </div>
  </xsl:template>
</xsl:stylesheet>
