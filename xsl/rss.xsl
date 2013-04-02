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

  <xsl:template name="RSS">
    <xsl:variable name="sourceFeed">
      <!-- To do: It would be VERY nice if RSS feeds could be stored as metadata somewhere instead of here 
           or in separate XML files in the /config directory.  This is especially true for Communities and
           Collections, which might want their own news sources.  -->
      <xsl:text>http://un-library.tumblr.com/rss</xsl:text>
    </xsl:variable>
    <div class="span4">
      <!-- To do: Internationalize this -->
      <h3>News</h3>
      <!--
      <xsl:apply-templates select="document($sourceFeed)"/>
      -->
      <ul class="nav nav-list">
        <xsl:for-each select="document($sourceFeed)/rss/channel/item">
          <xsl:if test="position() &lt; 6">
          <li>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="./link"/>
              </xsl:attribute>
              <xsl:value-of select="./title"/>
            </a>
            <xsl:value-of select="./description"/>
          </li>
          </xsl:if>
        </xsl:for-each>
      </ul>
    </div>

  </xsl:template>

</xsl:stylesheet>

