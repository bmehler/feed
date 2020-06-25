<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom">
	<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/">
<xsl:apply-templates select="/atom:feed"/>
</xsl:template>
<xsl:template match="/atom:feed">
	<html>
	<head>
		<title><xsl:value-of select="/atom:title" /></title>
		<style media="all" type="text/css">
			body {font-family:arial,helvetica,sans-serif;}
			p.hinweis {font-style:italic; font-size:13px; width:600px;}
			p.beschreibung {font-size:14px; width:600px; margin:0 0 15px 0;}
			.link {color:#ee0000;}
			h1 {font-size:16px; margin:15px 0 10px 0;}
			div.error {background-color:red;}
			div.aktuellenachricht {background-color:#eeeeee; width:600px; margin-bottom:10px; padding:6px;}
			div.aktuellenachricht a {color:#ee0000; text-decoration:none;}
			div.aktuellenachricht p {margin:10px 0px 6px 0px; font-size:14px;}
			div.aktuellenachricht a:hover {color:#ee0000; text-decoration:underline;}
			div.aktuellenachricht h2 {color:#666666; font-size:14px; margin:8px 0 0 0;}
		</style>
	</head>     
	<body>
		<p class="hinweis">Dies ist eine Newsfeed-Datei. Bitte verwenden Sie ein entsprechendes Programm (Newsreader), um die aktuellen Nachrichten zu abonnieren.</p>
		<h1><xsl:value-of select="/atom:title" /></h1>
		<p class="beschreibung"><xsl:value-of select="/atom:description" /></p>		
		<xsl:apply-templates select="/atom:item|error"/>
		<p class="hinweis"><xsl:value-of select="/atom:copyright" /></p>
	</body>
	</html>
</xsl:template>
<xsl:template match="item">
	<div class="aktuellenachricht">
		<h2><a href="{link}"><xsl:value-of select="/atom:title" /></a></h2>
		<p><xsl:value-of select="/atom:description" /></p>
		<p class="link">[<a href="{link}">mehr</a>]</p>
	</div>
</xsl:template>
<xsl:template match="error">
	<div class="error">
		<h2><xsl:value-of select="/atom:title" /></h2>
		<p><xsl:value-of select="/atom:description" />
		</p>
	</div>
</xsl:template>
</xsl:stylesheet>

