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
          <div class="hero-unit">
            <xsl:apply-templates select="/dri:document/dri:body/dri:div[@n='news']/dri:head" mode="frontpage"/>
            <xsl:apply-templates select="/dri:document/dri:body/dri:div[@n='news']/dri:p" mode="frontpage"/>
          </div>
          <div class="row-fluid" id="featured-collections">
            <xsl:text>&#160;</xsl:text>
          </div>
          <div class="row-fluid" id="news-and-recent-items">
            <xsl:call-template name="RSS"/>
            <!--
            <xsl:call-template name="siteRecentSubmissions"/>
            -->
          </div>
        </xsl:when>
        <xsl:when test="./dri:div[@n='community-home'] or ./dri:div[@n='collection-home']">
          <xsl:call-template name="community-collection-view"/>
        </xsl:when>
        <xsl:when test="./dri:div[@n='browse-by-dateissued']">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="./dri:div[@n='browse-by-author']">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="./dri:div[@n='browse-by-title']">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="./dri:div[@n='browse-by-subject']">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="./dri:div[@n='browse-by-type']">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="./dri:div[@n='browse-by-docsymbol']">
          <xsl:apply-templates/>
        </xsl:when>
        <!-- Notice the misspelling! -->
        <xsl:when test="./dri:div[@n='comunity-browser']">
          <div class="row-fluid">
            <xsl:apply-templates select="/dri:document/dri:body/dri:div[@n='comunity-browser']/dri:head" mode="frontpage"/>
            <xsl:apply-templates select="/dri:document/dri:body/dri:div[@n='comunity-browser']/dri:p" mode="frontpage"/>
            <xsl:apply-templates select="/dri:document/dri:body/dri:div[@n='comunity-browser']/dri:referenceSet[@type='summaryList']"/>
          </div>
        </xsl:when>
        <xsl:when test="./dri:div[@n='search']">
          <div class="row-fluid">
            <xsl:apply-templates/>
          </div>
        </xsl:when>
        <!-- Access controls and registry management.  These are less important to finish now -->
        <xsl:when test="./dri:div[@n='epeople-main']">
          <div class="row-fluid">
            <xsl:apply-templates/>
          </div>
        </xsl:when>
        <xsl:when test="./dri:div[@n='eperson-add']">
          <div class="row-fluid">
            <xsl:apply-templates/>
          </div>
        </xsl:when>
        <xsl:when test="./dri:div[@n='eperson-edit']">
          <div class="row-fluid">
            <xsl:apply-templates/>
          </div>
        </xsl:when>
        <xsl:when test="./dri:div[@id='aspect.eperson.EditProfile.div.information']">
          <div class="row-fluid">
            <xsl:apply-templates/>
          </div>
        </xsl:when>
        <xsl:otherwise>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
