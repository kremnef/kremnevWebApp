<?xml version="1.0" encoding="UTF-8"?>
<!--
   Copyright 2010 Anyware Services

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:docbook="http://docbook.org/ns/docbook" 
							  xmlns:resolver="org.ametys.cms.transformation.xslt.ResolveURIComponent" 
                              xmlns:i18n="http://apache.org/cocoon/i18n/2.1" exclude-result-prefixes="docbook resolver i18n">

	<xsl:param name="contextPath"/>
	<xsl:param name="siteName"/>
	
	<xsl:template match="content">
		<item>
			<title><xsl:value-of select="metadata/title"/></title>
			<xsl:if test="//pages/page">
				<link><xsl:value-of select="resolver:resolve('page', //pages/page/@id, false(), true())"/></link>
			</xsl:if>
			<guid><xsl:value-of select="$contextPath"/>/_wrapped-content/<xsl:value-of select="@name"/>.html</guid>
			<pubDate><i18n:date pattern="EEE, d MMM yyyy HH:mm:ss Z" src-pattern="yyyy-MM-dd'T'HH:mm:ss" locale="en_EN"><xsl:value-of select="@lastValidatedAt"/></i18n:date></pubDate>
			<rawDate><xsl:value-of select="@lastValidatedAt"/></rawDate>
			<description>
                <xsl:value-of select="//title"/>
                <xsl:value-of select="//text"/>
				<xsl:if test="metadata/illustration/image">
					&lt;img src="<xsl:value-of select="resolver:resolveBoundedImage(metadata/illustration/image/@type, metadata/illustration/image/@path, 150, 150, false(), true())"/>" alt="<xsl:value-of select="metadata/illustration/alt-text"/>" style="float: left; margin-right: 5px" /&gt;
				</xsl:if>
				<xsl:apply-templates select="metadata/abstract/node()" mode="escape"/>
			</description>
		</item>
	</xsl:template>
	
	<xsl:template match="*" mode="escape">
		<xsl:choose>
			<xsl:when test="count(*) >= 0">
				&lt;<xsl:value-of select="local-name()" /> <xsl:apply-templates select="@*" mode="escape"/>&gt;
				
				<xsl:apply-templates mode="escape"/>
				
				&lt;/<xsl:value-of select="local-name()" />&gt;
			</xsl:when>
			
			<xsl:otherwise>
				&lt;<xsl:value-of select="local-name()" /> <xsl:apply-templates select="@*" mode="escape"/> /&gt;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="@*" mode="escape">
		<xsl:value-of select="local-name()" />="<xsl:value-of select="." />"<xsl:text> </xsl:text>
	</xsl:template>
	
</xsl:stylesheet>
