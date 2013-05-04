<?xml version="1.0" encoding="UTF-8"?>
<!--<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">
    <xsl:template name="partners">
        <xsl:for-each select="//partners">

            <h1>
                <xsl:value-of select="heading"/>
            </h1>
            <a href="{$requestURI}/{help/@url}">
                <xsl:value-of select="help"/>
            </a>
            <xsl:choose>
                <xsl:when test="category">
                    <xsl:for-each select="category">
                        <h3>
                            <xsl:value-of select="sub-heading"/>
                        </h3>
                        <ul>
                            <xsl:for-each select="list/partner">
                                <li valign="middle">
                                    <xsl:choose>
                                        <xsl:when test="@logo">
                                            <xsl:choose>
                                                <xsl:when test="@url">
                                                    <a href="{@url}" title="{.}" border="0">
                                                        <img src="/mediateka/images/logos/{@logo}.jpg"
                                                             width="120px" height="100px"/>
                                                    </a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <img    src="/mediateka/images/logos/{@logo}.jpg" title="{.}"
                                                            width="120px"  height="100px"
                                                            border="0"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="." disable-output-escaping="yes"/>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <ul>
                        <xsl:for-each select="list/partner">

                            <li>
                                <xsl:value-of select="." disable-output-escaping="yes"/>
                            </li>

                        </xsl:for-each>
                    </ul>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

