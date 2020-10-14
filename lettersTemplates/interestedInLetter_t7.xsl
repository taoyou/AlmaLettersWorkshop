<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
                              
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td colspan="2">
							<!-- <xsl:value-of select="notification_data/message" />-->
	                    <xsl:choose>
	                    	<xsl:when test="contains(notification_data/message, 'E-resources was activated')">
	                    		<!-- message for E-resources -->
		                    	<p>We are pleased to inform you that an item of interest is now available online via the Library Catalog. You may also click on the MMS ID link below to access the title.</p>
	                    	</xsl:when>
	                    	<xsl:when test="contains(notification_data/message, 'Item was received')">
	                    		<!-- message for print items -->
	                    		<xsl:message terminate="yes">Don't send this letter to users.</xsl:message>
  	                    	</xsl:when>
	                    	<xsl:when test="contains(notification_data/message, 'Order  was cancelled')">
	                    		<!--  Mssage for cancelled orders -->
	                    	</xsl:when>
	                    	<xsl:otherwise>  <!-- default --> 
	                    		<p>We are pleased to inform you that an item of interest has arrived in the Library’s Acquisitions &amp; Eresources Department.  For online materials, you may click on the MMS ID link below to access the title. For physical titles, additional processing may be required before it is available for checkout.  If it is needed urgently, please request it by clicking on the MMS ID link, sign into the Library Catalog, and select from the available options. </p>
	                    	</xsl:otherwise>
	                    </xsl:choose>
                    	</td>
                    </tr>
					<tr>
						<td><br />@@title@@:<br /></td>
						<td><br /><xsl:value-of  select="notification_data/title"/><br /></td>
					</tr>
					<tr>
						<td><br />@@mmsId@@:<br /></td>
	        				<td><br /><a><xsl:attribute name="href">https://catalog.library.vanderbilt.edu/discovery/fulldisplay?docid=alma<xsl:value-of  select="notification_data/mms_id"/>&amp;context=U&amp;vid=01VAN_INST:vanui&amp;lang=en</xsl:attribute>
	                        <xsl:value-of  select="notification_data/mms_id"/>
	                                  </a><br />
	                    </td>
					</tr>
					<tr>
						<td><br />@@callNumber@@:<br /></td>
						<td><br /><xsl:value-of  select="notification_data/poline_inventory/call_number"/><br /></td>
					</tr>
					<!--    receiving note is meant to be internal, should not be displayed 
                    <tr>
                        <td><br />@@receivingNote@@:<br /></td>
                        <td><br /><xsl:value-of  select="notification_data/receiving_note"/><br /></td>
					</tr> 
					<tr>
						<td><br />@@message@@:<br /></td>
						<td><br /><xsl:value-of  select="notification_data/message"/><br /></td>
					</tr>  -->

				</table>
				<br />
				<table>
						<!-- repurpose @@receivingNote --> 
	                <tr><td><br/>@@receivingNote@@</td></tr>
                    <tr><td><br/>@@sincerely@@</td></tr>
					<tr><td>@@department@@</td></tr>
				</table>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>