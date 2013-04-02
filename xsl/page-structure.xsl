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

    <!-- Document structure -->
    <xsl:template match="dri:document">
      <html>
        <head>
          <xsl:call-template name="buildHead"/>
        </head>
        <body>
          <div class="container-fluid">
            <div class="row-fluid" id="un-brand">
              <div id="brandbar">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="concat($theme-path,'/lib/img/unicon.jpg')"/>
                  </xsl:attribute>
                  <xsl:attribute name="class">
                    <xsl:text>unicon</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="align">
                    <xsl:text>left</xsl:text>
                  </xsl:attribute>
                </img>
                <span class="welcome">
                 <a>
                   <!-- Conisder how to internationalize this part? -->
                   <xsl:attribute name="href">
                     <xsl:text>http://www.un.org/en/index.shtml</xsl:text>
                   </xsl:attribute>
                   <xsl:text>Welcome to the United Nations.  It's your world.</xsl:text>
                 </a>
               </span>
              </div>
            </div>
            <div class="row-fluid" id="main-navigation">
              <div class="navbar">
                <div class="navbar-inner">
                  <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"><xsl:text>&#160;</xsl:text></span>
                    <span class="icon-bar"><xsl:text>&#160;</xsl:text></span>
                    <span class="icon-bar"><xsl:text>&#160;</xsl:text></span>
                  </a>
                  <a class="brand">
                    <xsl:attribute name="href">
                      <xsl:value-of select="$context-path"/>
                    </xsl:attribute>
                    <!-- To do: internationalize this -->
                    <xsl:text>DAG: Digital Assets Gateway</xsl:text>
                  </a>
                  <ul class="nav nav-collapse collapse">
                    <xsl:apply-templates select="dri:options/dri:list[@n='browse']" mode="browse"/>  
                    <xsl:choose>
                      <xsl:when test="/dri:document/dri:meta/dri:userMeta/@authenticated = 'yes'">
                        <!-- We can go to My Account or Logout -->
	                <li>
                          <a>
                            <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='url']"/>
                            </xsl:attribute>
                            <i18n:text>xmlui.dri2xhtml.structural.profile</i18n:text>
                            <xsl:value-of select="/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='firstName']"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='lastName']"/>
                          </a>
                        </li>
                        <li>
                          <a>
                            <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='logoutURL']"/>
                            </xsl:attribute>
                            <i18n:text>xmlui.dri2xhtml.structural.logout</i18n:text>
                          </a>
                        </li>
                      </xsl:when>
                      <xsl:otherwise>
                        <li class="pull-right">
                          <a>
                            <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='loginURL']"/>
                            </xsl:attribute>
                            <i18n:text>xmlui.dri2xhtml.structural.login</i18n:text>
                          </a>
                        </li>
                      </xsl:otherwise>
                    </xsl:choose>
                  </ul>
                  <form>
                    <xsl:attribute name="class">
                      <xsl:text>navbar-search form-search pull-right</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="method">
                      <xsl:text>post</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="action">
                      <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath']"/>
                      <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='search'][@qualifier='simpleURL']"/>
                    </xsl:attribute>
                    <div class="input-append">
                      <input>
                        <xsl:attribute name="type">
                          <xsl:text>text</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="class">
                          <xsl:text>input-medium search-query</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="placeholder">
                          <!-- To do: fix this?  Should be able to hold i18n:text, perhaps. -->
                          <!-- <xsl:text>xmlui.custom.Search.Placeholder</xsl:text> -->
                          <xsl:text>Search the Repository</xsl:text>
                        </xsl:attribute>
                      </input>
                      <a type="submit">
                        <!--
                        <xsl:attribute name="href">
                        </xsl:attribute>
                        -->
                        <xsl:attribute name="class">
                          <xsl:text>btn</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Search</xsl:text>
                      </a>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="container-fluid">
            <div class="row-fluid">
              <div class="span3" id="discovery">
                <xsl:if test="/dri:document/dri:options/dri:list[@n='administrative']/dri:head">
                  <div class="well sidebar-nav">
                    <xsl:apply-templates select="dri:options/dri:list[@n='administrative']/dri:head" mode="discovery-header"/>
                    <ul class="nav nav-list">
                      <xsl:apply-templates select="dri:options/dri:list[@n='administrative']/dri:list" mode="discovery"/>
                    </ul>
                    <ul class="nav nav-list">
                      <li class="nav-header">
                        <i18n:text>xmlui.custom.adminHeader</i18n:text>
                      </li>
                      <xsl:apply-templates select="dri:options/dri:list[@n='administrative']/dri:item" mode="administrative"/>
                    </ul>
                  </div>
                </xsl:if>
                <xsl:if test="/dri:document/dri:options/dri:list[@n='discovery']/dri:head">
                  <div class="well sidebar-nav">
                    <xsl:apply-templates select="dri:options/dri:list[@n='discovery']/dri:head" mode="discovery-header"/>
                    <ul class="nav nav-list">
  		      <xsl:apply-templates select="dri:options/dri:list[@n='discovery']/dri:list" mode="discovery"/>
  		    </ul>
  		  </div>
                </xsl:if>
                <xsl:text>&#160;</xsl:text>
              </div>
              <div class="span9" id="main-content">
                <xsl:call-template name="trail"/>
                <xsl:apply-templates select="dri:body"/>
              </div>
            </div>
          </div>
          <div id="footer" class="container-fluid">
            <xsl:text>&#160;</xsl:text>
          </div>
        </body>
      </html>
    </xsl:template>

    <!--
    <xsl:template match="dri:p" mode="frontpage">
      <p>
        <xsl:call-template name="standardAttributes">
          <xsl:with-param name="class">
            <xsl:text>body-text</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
      </p>
    </xsl:template>

    <xsl:template name="logo">
        <xsl:call-template name="standardAttributes">
          <xsl:with-param name="class">
            <xsl:text>logo</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>
    -->

</xsl:stylesheet>

