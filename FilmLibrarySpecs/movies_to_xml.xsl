<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <xsl:key match="Author" name="my_author_id" use="@author_id"/>

  <xsl:variable name="number_of_authors" select="count(//Authors/Author)"/>
  <xsl:variable name="number_of_movies" select="count(//Movies/Movie)"/>
  <xsl:variable name="number_of_adventure_movies" select="count(//Movies/Movie[@genre='adventure'])"/>
  <xsl:variable name="number_of_horror_movies" select="count(//Movies/Movie[@genre='horror'])"/>
  <xsl:variable name="number_of_action_movies" select="count(//Movies/Movie[@genre='action'])"/>
  <xsl:variable name="number_of_drama_movies" select="count(//Movies/Movie[@genre='drama'])"/>
  <xsl:variable name="total_budget_in_pln" select="sum(//Movies/Movie/Budget)"/>
  <xsl:variable name="euro_exchange_rate" select="4.33"/>
  <xsl:variable name="total_budget_in_eur" select="$total_budget_in_pln * $euro_exchange_rate"/>

  <xsl:template match="/">
    <Helper>
      <Statistics>
        <xsl:call-template name="statistics"/>
      </Statistics>
      <Penmans>
        <xsl:call-template name="penmans"/>
      </Penmans>
      <Authors>
        <xsl:apply-templates select="//Authors"/>
      </Authors>
      <Movies>
        <xsl:apply-templates select="//Movies"/>
      </Movies>
    </Helper>
  </xsl:template>

  <xsl:template name="penmans">
    <Author>
      <Name>Rafał Plinzner</Name>
      <Index>210293</Index>
    </Author>
    <Author>
      <Name>Michał Chudzik</Name>
      <Index>215145</Index>
    </Author>
  </xsl:template>

  <xsl:template name="statistics">
    <NumberOfAuthors>
      <xsl:value-of select="$number_of_authors"/>
   </NumberOfAuthors>
   <NumberOfMovies>
      <xsl:value-of select="$number_of_movies"/>
   </NumberOfMovies>
   <NumberOfAdventureMovies>
      <xsl:value-of select="$number_of_adventure_movies"/>
   </NumberOfAdventureMovies>
   <NumberOfDramaMovies>
      <xsl:value-of select="$number_of_drama_movies"/>
   </NumberOfDramaMovies>
   <NumberOfHorrorMovies>
      <xsl:value-of select="$number_of_horror_movies"/>
   </NumberOfHorrorMovies>
   <NumberOfActionMovies>
      <xsl:value-of select="$number_of_action_movies"/>
   </NumberOfActionMovies>
   <TotalBudgetInPln>
      <xsl:value-of select="$total_budget_in_pln"/>
   </TotalBudgetInPln>
   <TotalBudgetInEur>
      <xsl:value-of select="$total_budget_in_eur"/>
   </TotalBudgetInEur>
  </xsl:template>

  <xsl:template match="//Authors">
    <xsl:apply-templates select="Author">
      <xsl:sort select="./FirstName" order="ascending"/>
    </xsl:apply-templates>
  </xsl:template>

 <xsl:template match="Author">
    <Author>
      <AuthorId>
        <xsl:value-of select="@author_id"/>
      </AuthorId>
      <FirstName>
        <xsl:value-of select="FirstName"/>
      </FirstName>
      <LastName>
        <xsl:value-of select="LastName"/>
      </LastName>
    </Author>
  </xsl:template>

  <xsl:template match="//Movies">
    <xsl:apply-templates select="Movie">
      <xsl:sort select="./Mtitle" order="ascending"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="Movie">
    <Movie>
      <Author>
        <xsl:value-of select="key('my_author_id', Author/@author_id)"/>
      </Author>
      <Title>
        <xsl:value-of select="Mtitle"/>
      </Title>
      <Budget>
        <xsl:value-of select="Budget"/> PLN
      </Budget>
      <Description>
        <xsl:value-of select="Description"/>
      </Description>
      <Rating>
        <xsl:value-of select="Rating"/>
      </Rating>
      <ReleaseDate>
        <xsl:value-of select="ReleaseDate"/>
      </ReleaseDate>
    </Movie>
  </xsl:template>
</xsl:stylesheet>
