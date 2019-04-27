<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:output method="text" encoding="UTF-8" indent="yes" />

  <xsl:variable name="newline">
    <xsl:text>&#xa;</xsl:text>
  </xsl:variable>

  <xsl:variable name="tab">
    <xsl:text>&#x9;</xsl:text>
  </xsl:variable>

  <xsl:template match="/">
    <xsl:call-template name="statistics"/>
    <xsl:copy-of select="$newline"/>
    <xsl:call-template name="movies"/>
  </xsl:template>

  <xsl:template name="statistics">
    <xsl:call-template name="author_statistics"/>
    <xsl:call-template name="movie_statistics"/>
    <xsl:call-template name="budget_statistics"/>
  </xsl:template>

  <xsl:template name="author_statistics">
    <xsl:value-of select="concat('Number of authors: ', //Statistics/NumberOfAuthors)"/>
    <xsl:copy-of select="$newline"/>
  </xsl:template>

  <xsl:template name="movie_statistics">
    <xsl:value-of select="concat('Number of movies: ', //NumberOfMovies)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:value-of select="concat('Number of adventure movies: ', //NumberOfAdventureMovies)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:value-of select="concat('Number of drama movies: ', //NumberOfDramaMovies)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:value-of select="concat('Number of horror movies: ', //NumberOfHorrorMovies)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:value-of select="concat('Number of action movies: ', //NumberOfActionMovies)"/>
    <xsl:copy-of select="$newline"/>
  </xsl:template>

  <xsl:template name="budget_statistics">
    <xsl:value-of select="concat('Total budget in PLN: ', //TotalBudgetInPln)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:value-of select="concat('Total budget in EUR: ', //TotalBudgetInEur)"/>
    <xsl:copy-of select="$newline"/>
  </xsl:template>

  <xsl:template name="movies">
    <xsl:call-template name="movie"/>
  </xsl:template>

  <xsl:template name="movie">
    <xsl:for-each select="//Movies/Movie">
    <xsl:value-of select="Title"/>
    <xsl:copy-of select="$newline"/>
    <xsl:copy-of select="$tab"/>
    <xsl:value-of select="concat('Author: ', normalize-space(Author))"/>
    <xsl:copy-of select="$newline"/>
    <xsl:copy-of select="$tab"/>
    <xsl:value-of select="concat('Rating: ', Rating)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:copy-of select="$tab"/>
    <xsl:value-of select="concat('Release Date: ', ReleaseDate)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:copy-of select="$tab"/>
    <xsl:value-of select="concat('Description: ', Description)"/>
    <xsl:copy-of select="$newline"/>
    <xsl:copy-of select="$tab"/>
    <xsl:value-of select="concat('Budget: ', Budget)"/>
    <xsl:copy-of select="$newline"/>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
