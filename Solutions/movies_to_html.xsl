<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:key match="Author" name="my_author_id" use="@author_id"/>

  <xsl:template match="/">
    <html>
      <head>
        <style>
          body {
            padding-left: 15px;
            padding-right: 15px;
            margin-top: 34px;
          }
          table {
              border: solid 1px #DDEEEE;
              border-collapse: collapse;
              border-spacing: 0;
              font: normal 13px Arial, sans-serif;
          }
          table thead th {
              background-color: #DDEFEF;
              border: solid 1px #DDEEEE;
              color: #336B6B;
              padding: 10px;
              text-align: left;
              text-shadow: 1px 1px 1px #fff;
          }
          table tbody td {
              border: solid 1px #DDEEEE;
              color: #333;
              padding: 10px;
              text-shadow: 1px 1px 1px #fff;
          }
          .statistics {
            margin-bottom: 34px;
          }
          .statistics table {
            margin: auto;
          }
        </style>
      </head>
      <body>
        <xsl:call-template name="statistics"/>
        <xsl:call-template name="movies"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="statistics">
    <section class="statistics">
      <table>
        <thead>
          <th>
            Category
          </th>
          <th>
            Result
          </th>
        </thead>
        <tbody>
          <xsl:call-template name="statistic"/>
        </tbody>
      </table>
    </section>
  </xsl:template>

  <xsl:template name="statistic">
    <xsl:for-each select="//NumberOfAuthors">
      <tr>
        <td>
          Number of Authors
        </td>
        <td>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="//NumberOfMovies">
      <tr>
        <td>
          Number of Movies
        </td>
        <td>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="//NumberOfActionMovies">
      <tr>
        <td>
          Number of Action Movies
        </td>
        <td>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="//NumberOfDramaMovies">
      <tr>
        <td>
          Number of Drama Movies
        </td>
        <td>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="//NumberOfHorrorMovies">
      <tr>
        <td>
          Number of Horror Movies
        </td>
        <td>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="//NumberOfAdventureMovies">
      <tr>
        <td>
          Number of Adventure Movies
        </td>
        <td>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="movies">
    <section class="movies">
      <table>
        <thead>
          <th>Title</th>
          <th>Author</th>
          <th>Budget</th>
          <th>Description</th>
          <th>Rating</th>
          <th>ReleaseDate</th>
        </thead>
        <tbody>
          <xsl:call-template name="movie"/>
        </tbody>
      </table>
    </section>
  </xsl:template>

  <xsl:template name="movie">
    <xsl:for-each select="//Movies/Movie">
      <tr>
        <td>
          <xsl:value-of select="Author"/>
        </td>
        <td>
          <xsl:value-of select="Title"/>
        </td>
        <td>
          <xsl:value-of select="Budget"/>
        </td>
        <td>
          <xsl:value-of select="Description"/>
        </td>
        <td>
          <xsl:value-of select="Rating"/>
        </td>
        <td>
          <xsl:value-of select="ReleaseDate"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
