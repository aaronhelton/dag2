dag2 DSpace Theme
=============

An XMLUI-based DSpace theme for DSpace 3x using Bootstrap and (eventually) HTML5.  

This theme is being developed for the United Nations digital repository project and will contain some elements 
that are specific to the UN environment.  


Features
=============

* Uses Bootstrap for modern-looking layout
* Large Discovery sidebar to facilitate content discovery
* Shows how to make use of custom metadata schemas
* Replaces sitewide "news.xmlui" with configurable external RSS feeds


(Planned)
=============

MIME-based overrides for content presentation (e.g. galleries), and HTML5 rendering of known file types to enable 
features such as image panning/zooming, audio/video playback, and document streaming.


Requirements
=============

* DSpace 3x.  It will probably work on DSpace 1.8.x as well, but I am not testing against it.
* Discovery must be enabled!

If you spot more, let me know.


Install
=============
Quick method (i.e., not the proper way): Just clone this repository and copy the contents to your running copy of 
DSpace.  For example: /usr/share/tomcat7/webapps/xmlui/themes/dag2/

If you name the theme anything else, be sure to edit sitemap.xmap to reflect the new path and/or name.

You can test if it's working by going to http://[your-dspace-url]/xmlui/?themepath=dag2/

Note the trailing slash.
