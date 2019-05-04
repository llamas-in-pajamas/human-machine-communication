<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
>
  <xsl:template match="/">
    <fo:root font-family="Arial">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4" page-height="11.69in" page-width="9in">
          <fo:region-body region-name="region" margin="1in" />
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="region">
          <fo:block padding-bottom="10px" text-align="center">
            <fo:inline  font-size="20px" font-weight="bold">
              Statistics
            </fo:inline>
          </fo:block>
          <xsl:call-template name="stats-table"/>
          <fo:block padding-bottom="10px" margin-top="35px" text-align="center">
            <fo:inline font-size="20px" font-weight="bold">
              Movies
            </fo:inline>
          </fo:block>
          <xsl:call-template name="movie-table"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template name="movie-table">
    <fo:table>
      <xsl:call-template name="movie-table-header"/>
      <xsl:call-template name="movie-table-body"/>
    </fo:table>
  </xsl:template>

  <xsl:template name="movie-table-header">
    <fo:table-header>
      <fo:table-row>
        <xsl:call-template name="movie-table-header-cell">
          <xsl:with-param name="name" select="'Title'"/>
        </xsl:call-template>
        <xsl:call-template name="movie-table-header-cell">
          <xsl:with-param name="name" select="'Author'"/>
        </xsl:call-template>
        <xsl:call-template name="movie-table-header-cell">
          <xsl:with-param name="name" select="'Description'"/>
        </xsl:call-template>
        <xsl:call-template name="movie-table-header-cell">
          <xsl:with-param name="name" select="'Rating'"/>
        </xsl:call-template>
        <xsl:call-template name="movie-table-header-cell">
          <xsl:with-param name="name" select="'Budget'"/>
        </xsl:call-template>
        <xsl:call-template name="movie-table-header-cell">
          <xsl:with-param name="name" select="'Release Date'"/>
        </xsl:call-template>
      </fo:table-row>
    </fo:table-header>
  </xsl:template>

  <xsl:template name="movie-table-header-cell">
    <xsl:param name="name"/>
     <fo:table-cell font-weight="bold" border="1px solid black">
      <fo:block text-align="center">
        <xsl:value-of select="$name"/>
      </fo:block>
    </fo:table-cell>
  </xsl:template>

  <xsl:template name="movie-table-body">
    <fo:table-body>
      <xsl:for-each select="//Movies/Movie">
        <fo:table-row>
          <xsl:call-template name="movie-table-body-cell">
            <xsl:with-param name="name" select="Title"/>
          </xsl:call-template>
          <xsl:call-template name="movie-table-body-cell">
            <xsl:with-param name="name" select="Author"/>
          </xsl:call-template>
          <xsl:call-template name="movie-table-body-cell">
            <xsl:with-param name="name" select="Description"/>
          </xsl:call-template>
          <xsl:call-template name="movie-table-body-cell">
            <xsl:with-param name="name" select="Rating"/>
          </xsl:call-template>
          <xsl:call-template name="movie-table-body-cell">
            <xsl:with-param name="name" select="Budget"/>
          </xsl:call-template>
          <xsl:call-template name="movie-table-body-cell">
            <xsl:with-param name="name" select="ReleaseDate"/>
          </xsl:call-template>
        </fo:table-row>
      </xsl:for-each>
    </fo:table-body>
  </xsl:template>

  <xsl:template name="movie-table-body-cell">
    <xsl:param name="name"/>
    <fo:table-cell border="1px solid black">
      <fo:block font-size="9px" text-align="center">
        <xsl:value-of select="$name"/>
      </fo:block>
    </fo:table-cell>
  </xsl:template>

  <xsl:template name="stats-table">
    <fo:table>
      <xsl:call-template name="stats-table-header"/>
      <xsl:call-template name="stats-table-body"/>
    </fo:table>
  </xsl:template>

  <xsl:template name="stats-table-header">
    <fo:table-header>
      <fo:table-row>
        <xsl:call-template name="stats-table-header-cell">
          <xsl:with-param name="name" select="'Category'"/>
        </xsl:call-template>
        <xsl:call-template name="stats-table-header-cell">
          <xsl:with-param name="name" select="'Value'"/>
        </xsl:call-template>
      </fo:table-row>
    </fo:table-header>
  </xsl:template>

  <xsl:template name="stats-table-header-cell">
    <xsl:param name="name"/>
    <fo:table-cell border="1px solid black">
      <fo:block font-weight="bold" text-align="center">
        <xsl:value-of select="$name"/>
      </fo:block>
    </fo:table-cell>
  </xsl:template>

  <xsl:template name="stats-table-body">
    <fo:table-body font-size="9px" text-align="center">
      <xsl:call-template name="movie-stats"/>
    </fo:table-body>
  </xsl:template>

  <xsl:template name="movie-stats">
    <fo:table-row>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:text>Number of Movies</xsl:text>
            </fo:block>
        </fo:table-cell>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:value-of select="//NumberOfMovies"/>
            </fo:block>
        </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:text>Number of Adventure Movies</xsl:text>
            </fo:block>
        </fo:table-cell>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:value-of select="//NumberOfAdventureMovies"/>
            </fo:block>
        </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:text>Number of Action Movies</xsl:text>
            </fo:block>
        </fo:table-cell>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:value-of select="//NumberOfActionMovies"/>
            </fo:block>
        </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:text>Number of Drama Movies</xsl:text>
            </fo:block>
        </fo:table-cell>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:value-of select="//NumberOfDramaMovies"/>
            </fo:block>
        </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:text>Number of Horror Movies</xsl:text>
            </fo:block>
        </fo:table-cell>
        <fo:table-cell border="1px solid black">
            <fo:block>
                <xsl:value-of select="//NumberOfHorrorMovies"/>
            </fo:block>
        </fo:table-cell>
    </fo:table-row>
  </xsl:template>
</xsl:stylesheet>
