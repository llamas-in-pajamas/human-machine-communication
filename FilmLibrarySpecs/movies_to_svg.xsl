<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/2000/svg"
>
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:variable name="bar-chart-width">420</xsl:variable>
  <xsl:variable name="normalize-data" select="$bar-chart-width div //NumberOfMovies"/>
  <xsl:variable name="number_of_movies_normalized" select="//NumberOfMovies * 420 div //NumberOfMovies"/>
  <xsl:variable name="number_of_action_movies_normalized" select="//NumberOfActionMovies * 420 div //NumberOfMovies"/>
  <xsl:variable name="number_of_drama_movies_normalized" select="//NumberOfDramaMovies * 420 div //NumberOfMovies"/>
  <xsl:variable name="number_of_adventure_movies_normalized" select="//NumberOfAdventureMovies * 420 div //NumberOfMovies"/>
  <xsl:variable name="number_of_horror_movies_normalized" select="//NumberOfHorrorMovies * 420 div //NumberOfMovies"/>

  <xsl:template match="/">
    <xsl:call-template name="bar-chart"/>
  </xsl:template>

  <xsl:template name="bar-chart">
    <svg
      y="200"
      style="padding-left: 15px; padding-right: 15px; margin-top: 34px"
      width="100%"
      height="300"
      role="img"
    >
      <text
        x="0"
        y="0"
        dy="0.95em"
        style="font-family:Verdana; font-size: 20; font-weight: bold;"
      >
        Movie stats
			</text>
      <g>
        <rect class="tooltip" fill="red">
          <xsl:attribute name="width"><xsl:value-of select="$number_of_movies_normalized"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>20</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to">
              <xsl:value-of select="$number_of_movies_normalized"/>
              </xsl:attribute>
          </animate>
        </rect>
        <text y="20"  dy="0.95em">
          <xsl:attribute name="x"><xsl:value-of select="$number_of_movies_normalized + 4"/></xsl:attribute>
          <xsl:value-of select="concat(//NumberOfMovies, ' Movies In Total')"/>
        </text>
      </g>
      <g>
        <rect fill="yellow">
          <xsl:attribute name="width"><xsl:value-of select="$number_of_action_movies_normalized"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>40</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to"
              ><xsl:value-of select="$number_of_action_movies_normalized"/>
            </xsl:attribute>
          </animate>
        </rect>
        <text y="40" dy="0.95em">
          <xsl:attribute name="x"><xsl:value-of select="$number_of_action_movies_normalized + 4"/></xsl:attribute>
          <xsl:value-of select="concat(//NumberOfActionMovies, ' Action Movies')"/>
        </text>
      </g>
      <g>
        <rect fill="blue">
          <xsl:attribute name="width"><xsl:value-of select="$number_of_drama_movies_normalized"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>60</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to">
              <xsl:value-of select="$number_of_drama_movies_normalized"/>
            </xsl:attribute>
          </animate>
        </rect>
        <text y="60" dy="0.95em">
          <xsl:attribute name="x"><xsl:value-of select="$number_of_drama_movies_normalized + 4"/></xsl:attribute>
          <xsl:value-of select="concat(//NumberOfDramaMovies, ' Drama Movies')"/>
        </text>
      </g>
      <g>
        <rect fill="green">
          <xsl:attribute name="width"><xsl:value-of select="$number_of_horror_movies_normalized"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>80</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to">
              <xsl:value-of select="$number_of_horror_movies_normalized"/>
            </xsl:attribute>
          </animate>
        </rect>
        <text y="80" dy="0.95em">
          <xsl:attribute name="x"><xsl:value-of select="$number_of_horror_movies_normalized + 4"/></xsl:attribute>
          <xsl:value-of select="concat(//NumberOfHorrorMovies, ' Horror Movies')"/>
        </text>
      </g>
      <g>
        <rect fill="orange">
          <xsl:attribute name="width"><xsl:value-of select="$number_of_adventure_movies_normalized"/></xsl:attribute>
          <xsl:attribute name="height"><xsl:text>19</xsl:text></xsl:attribute>
          <xsl:attribute name="y"><xsl:text>100</xsl:text></xsl:attribute>
          <animate attributeName="width" attributeType="XML" begin="0s" dur="1s" from="0" repeatCount="1" fill="freeze">
            <xsl:attribute name="to">
              <xsl:value-of select="$number_of_adventure_movies_normalized"/>
            </xsl:attribute>
          </animate>
        </rect>
        <text y="100" dy="0.95em">
          <xsl:attribute name="x"><xsl:value-of select="$number_of_adventure_movies_normalized + 4"/></xsl:attribute>
          <xsl:value-of select="concat(//NumberOfAdventureMovies, ' Adventure Movies')"/>
        </text>
      </g>
    </svg>
  </xsl:template>
</xsl:stylesheet>
