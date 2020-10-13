<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="recordTitle">
	<div class="recordTitle">
		<span class="spacer_after_1em"><xsl:value-of select="notification_data/phys_item_display/title"/></span>
	</div>
	<xsl:if test="notification_data/phys_item_display/author !=''">
		<div class="">
			<span class="spacer_after_1em">
				<span class="recordAuthor">@@by@@ <xsl:value-of select="notification_data/phys_item_display/author"/></span>
			</span>
		</div>
	</xsl:if>
	<xsl:if test="notification_data/phys_item_display/issue_level_description !=''">
		<div class="">
			<span class="spacer_after_1em">
				<span class="volumeIssue">@@description@@ <xsl:value-of select="notification_data/phys_item_display/issue_level_description"/></span>
			</span>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="formatTitle">
	<xsl:param name="title" />
	<xsl:if test="string-length(.) &gt; 50"> 
		<xsl:value-of select="substring($title, 1, 50)" />
		<xsl:text>...</xsl:text> 
	</xsl:if>
	<xsl:if test="string-length(.) &lt; 51"> 
		<xsl:value-of select="$title" /> 
	</xsl:if>
</xsl:template>

<xsl:template name="formatCallnumber">
	<xsl:param name="callnumber" />
	<xsl:param name="altcallnum" />
	<xsl:param name="description" />
	<xsl:variable name="itemcallnum" select="$altcallnum" />
    <xsl:choose>
       <xsl:when test="string($itemcallnum)">
            <xsl:value-of select="$altcallnum"/>
         </xsl:when>
         <xsl:otherwise>
               <xsl:value-of select="concat( $callnumber, ' ', $description)" />
          </xsl:otherwise>
    </xsl:choose>
</xsl:template>	

<xsl:template name="hathiNotes">
	<xsl:param name="location"/>
	<xsl:if test="$location = 'HathiTrust'" >
      <span>
      	<xsl:attribute name="style">
       		<xsl:text>color: red;</xsl:text>
      	</xsl:attribute>  
     	<xsl:text>Cannot be renewed</xsl:text>
  	</span>
    </xsl:if>
</xsl:template>    


<xsl:template name="displayBookCover">
	<xsl:param name="isbn" />
	<xsl:if test="string-length($isbn)">
	    <xsl:variable name="normISBN" select="translate($isbn, translate($isbn, '0123456789', ''), '')" />
		<img style="width:40px; ">
			<xsl:attribute name="src">
				<xsl:text>https://images-na.ssl-images-amazon.com/images/P/</xsl:text><xsl:value-of select="$normISBN"/><xsl:text>.1.L.jpg</xsl:text>
			</xsl:attribute>
		</img>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
