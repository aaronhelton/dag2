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

  <xsl:template name="buildHead">
              <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <meta name="Generator">
            <xsl:attribute name="content">
              <xsl:text>DSpace</xsl:text>
              <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='dspace'][@qualifier='version']">
                <xsl:text> </xsl:text>
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='dspace'][@qualifier='version']"/>
              </xsl:if>
            </xsl:attribute>
          </meta>
          <!-- Stylesheets -->
          <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='stylesheet']">
            <link rel="stylesheet" type="text/css">
              <xsl:attribute name="media">
                <xsl:value-of select="@qualifier"/>
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                <xsl:text>/themes/</xsl:text>
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='theme'][@qualifier='path']"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="."/>
              </xsl:attribute>
            </link>
          </xsl:for-each>
          <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='javascript'][not(@qualifier)]">
            <script type="text/javascript">
                <xsl:attribute name="src">
                    <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                    <xsl:text>/themes/</xsl:text>
                    <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='theme'][@qualifier='path']"/>
                    <xsl:text>/</xsl:text>
                    <xsl:value-of select="."/>
                </xsl:attribute>&#160;
            </script>
        </xsl:for-each>
          <!-- Syndication feeds -->
          <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='feed']">
            <link rel="alternate" type="application">
              <xsl:attribute name="type">
                <xsl:text>application/</xsl:text>
                <xsl:value-of select="@qualifier"/>
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </link>
          </xsl:for-each>
          <!--  Add OpenSearch auto-discovery link -->
          <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='opensearch'][@qualifier='shortName']">
            <link rel="search" type="application/opensearchdescription+xml">
              <xsl:attribute name="href">
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='scheme']"/>
                <xsl:text>://</xsl:text>
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverName']"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverPort']"/>
                <xsl:value-of select="$context-path"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='opensearch'][@qualifier='autolink']"/>
              </xsl:attribute>
              <xsl:attribute name="title" >
                <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='opensearch'][@qualifier='shortName']"/>
              </xsl:attribute>
            </link>
          </xsl:if>
          <!-- The following javascript removes the default text of empty text areas when they are focused on or submitted -->
          <!-- There is also javascript to disable submitting a form when the 'enter' key is pressed. -->
          <script type="text/javascript">

                  //Clear default text of empty text areas on focus
                  function tFocus(element)
                  {
                    if (element.value == '<i18n:text>xmlui.dri2xhtml.default.textarea.value</i18n:text>'){element.value='';}
                  }
                  //Clear default text of empty text areas on submit
                  function tSubmit(form)
                  {
                    var defaultedElements = document.getElementsByTagName("textarea");
                    for (var i=0; i != defaultedElements.length; i++){
                      if (defaultedElements[i].value == '<i18n:text>xmlui.dri2xhtml.default.textarea.value</i18n:text>'){
                        defaultedElements[i].value='';}}
                  }
                  //Disable pressing 'enter' key to submit a form (otherwise pressing 'enter' causes a submission to start over)
                  function disableEnterKey(e)
                  {
                    var key;
                    if(window.event)
                      key = window.event.keyCode;     //Internet Explorer
                    else
                      key = e.which;     //Firefox and Netscape
                      if(key == 13)  //if "Enter" pressed, then disable!
                        return false;
                      else
                        return true;
                  }
          </script>
          <!-- Add the title in -->
          <xsl:variable name="page_title" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='title']" />
          <title>
              <xsl:choose>
                      <xsl:when test="starts-with($request-uri, 'page/about')">
                              <xsl:text>About This Repository</xsl:text>
                        </xsl:when>
                        <xsl:when test="not($page_title)">
                                <xsl:text>  </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                                <xsl:copy-of select="$page_title/node()" />
                        </xsl:otherwise>
              </xsl:choose>
          </title>
          <!-- Head metadata in item pages -->
          <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='xhtml_head_item']">
              <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='xhtml_head_item']"
                            disable-output-escaping="yes"/>
          </xsl:if>

          <!-- Add all Google Scholar Metadata values -->
          <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[substring(@element, 1, 9) = 'citation_']">
              <meta name="{@element}" content="{.}"></meta>
          </xsl:for-each>

          <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[substring(@element, 1, 3) = 'og:']">
                <meta content="{.}">
                    <xsl:attribute name="property">
                        <xsl:value-of select="@element"/>
                    </xsl:attribute>
                </meta>
            </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
