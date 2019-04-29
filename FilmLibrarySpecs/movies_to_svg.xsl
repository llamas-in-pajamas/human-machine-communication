<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/2000/svg"
>
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:variable name="bar-chart-width">420</xsl:variable>
  <xsl:variable name="normalize-data" select="$bar-chart-width div //NumberOfMovies"/>

  <xsl:template match="/">
    <xsl:call-template name="bar-chart"/>
  </xsl:template>

  <xsl:template name="header">
  </xsl:template>

  <xsl:template name="bar-chart">
    <svg width="420" height="150" role="img">
      <title>A bar chart which shows movie genre distribution</title>
      <desc><xsl:value-of select="$normalize-data"/></desc>
      <g>
        <rect>
          <xsl:attribute name="width"><xsl:value-of select="//NumberOfMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to"><xsl:value-of select="//NumberOfMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          </animate>
        </rect>
      </g>
      <g>
        <rect>
          <xsl:attribute name="width"><xsl:value-of select="//NumberOfActionMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>20</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to"><xsl:value-of select="//NumberOfActionMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          </animate>
        </rect>
      </g>
      <g>
        <rect>
          <xsl:attribute name="width"><xsl:value-of select="//NumberOfDramaMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>40</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to"><xsl:value-of select="//NumberOfDramaMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          </animate>
        </rect>
      </g>
      <g>
        <rect>
          <xsl:attribute name="width"><xsl:value-of select="//NumberOfHorrorMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>60</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to"><xsl:value-of select="//NumberOfHorrorMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          </animate>
        </rect>
      </g>
      <g>
        <rect>
          <xsl:attribute name="width"><xsl:value-of select="//NumberOfAdventureMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>80</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to"><xsl:value-of select="//NumberOfAdventureMovies * 420 div //NumberOfMovies"/></xsl:attribute>
          </animate>
        </rect>
      </g>
    </svg>
  </xsl:template>

</xsl:stylesheet>
