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

    <xsl:import href="../dri2xhtml.xsl"/>
    <xsl:import href="xsl/global-variables.xsl"/>
    <xsl:import href="xsl/page-structure.xsl"/>
    <xsl:import href="xsl/struct/dri-head.xsl"/>
    <xsl:import href="xsl/struct/dri-list.xsl"/>
    <xsl:import href="xsl/struct/dri-body.xsl"/>
    <xsl:import href="xsl/head.xsl"/>
    <xsl:import href="xsl/trail.xsl"/>
    <xsl:import href="xsl/community-collection-view.xsl"/>
    <xsl:import href="xsl/rss.xsl"/>
    <!--
    <xsl:import href="xsl/body.xsl"/>
    <xsl:import href="xsl/discovery.xsl"/>
    <xsl:import href="xsl/community-list.xsl"/>
    <xsl:import href="xsl/item-view.xsl"/>
    <xsl:import href="xsl/lists.xsl"/>
    <xsl:import href="xsl/forms.xsl"/>
    <xsl:import href="xsl/gallery-view.xsl"/>
    <xsl:import href="xsl/mime-handlers.xsl"/>
    -->
    <xsl:output indent="yes"/>
</xsl:stylesheet>
