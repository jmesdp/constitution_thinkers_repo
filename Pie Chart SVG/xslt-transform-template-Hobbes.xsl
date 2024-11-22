<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:my="http://example.com/my-functions"
    exclude-result-prefixes="xs math my"
    version="2.0">
    <!-- Individual Element counts -->
    <xsl:variable name="consent_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::consent_of_governed])"/>
    <xsl:variable name="rights_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::inherent_rights])"/>
    <xsl:variable name="justice_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::criminal_justice])"/>
    <xsl:variable name="purpose_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::purposes_of_law])"/>
    <xsl:variable name="legal_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::legal_documents])"/>
    <xsl:variable name="legislat_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::legislative_body])"/>
    <xsl:variable name="exec_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::executive_body])"/>
    <xsl:variable name="limits_count" as="xs:double" select="count(//section/*[not(self::subsection_name or self::section_name) and self::limits_of_power])"/>
    
    <!-- Total counts of elements -->
    <xsl:variable name="total_count" as="xs:double" select="sum(($consent_count, $rights_count, $justice_count, $purpose_count, $legal_count, $legislat_count, $exec_count, $limits_count))"/>
    
    <!-- Function to calculate angle in degrees -->
    <xsl:function name="my:calc-angle">
        <xsl:param name="count"/>
        <xsl:param name="total"/>
        <xsl:value-of select="360 * ($count div $total)"/>
    </xsl:function>
    
    <!-- Main template to produce SVG -->
    <xsl:template match="/">
        <svg width="400" height="400" viewBox="-16 -16 64 64" xmlns="http://www.w3.org/2000/svg">
            <xsl:variable name="prev_angle" select="0"/>
            
            <!-- Consent of Governed Slice -->
            <xsl:variable name="angle" select="my:calc-angle($consent_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'blue'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Inherent Rights Slice -->
            <xsl:variable name="angle" select="my:calc-angle($rights_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'red'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Criminal Justice Slice -->
            <xsl:variable name="angle" select="my:calc-angle($justice_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'green'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Purposes of Law Slice -->
            <xsl:variable name="angle" select="my:calc-angle($purpose_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'yellow'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Legal Documents Slice -->
            <xsl:variable name="angle" select="my:calc-angle($legal_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'orange'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Legislative Body Slice -->
            <xsl:variable name="angle" select="my:calc-angle($legislat_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'purple'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Executive Body Slice -->
            <xsl:variable name="angle" select="my:calc-angle($exec_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'pink'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
            
            <!-- Limits of Power Slice -->
            <xsl:variable name="angle" select="my:calc-angle($limits_count, $total_count)"/>
            <xsl:call-template name="draw-slice">
                <xsl:with-param name="start_angle" select="$prev_angle"/>
                <xsl:with-param name="angle" select="$angle"/>
                <xsl:with-param name="color" select="'lime'"/>
            </xsl:call-template>
            <xsl:variable name="prev_angle" select="$prev_angle + $angle"/>
           
            <!-- Legend -->
            <rect x="25" y="-20" width="10" height="60" fill="none" stroke="black"/>
            <rect x="26" y="-19" width="1.5" height="1.5" fill="blue"/>
            <text x="28" y="-18" font-size="1.5">Consent of Governed</text>
            <rect x="26" y="-17" width="1.5" height="1.5" fill="red"/>
            <text x="28" y="-16" font-size="1.5">Inherent Rights</text>
            <rect x="26" y="-15" width="1.5" height="1.5" fill="green"/>
            <text x="28" y="-14" font-size="1.5">Criminal Justice</text>
            <rect x="26" y="-13" width="1.5" height="1.5" fill="yellow"/>
            <text x="28" y="-12" font-size="1.5">Purposes of Law</text>
            <rect x="26" y="-11" width="1.5" height="1.5" fill="orange"/>
            <text x="28" y="-10" font-size="1.5">Legal Documents</text>
            <rect x="26" y="-9" width="1.5" height="1.5" fill="purple"/>
            <text x="28" y="-8" font-size="1.5">Legislative Body</text>
            <rect x="26" y="-7" width="1.5" height="1.5" fill="pink"/>
            <text x="28" y="-6" font-size="1.5">Executive Body</text>
            <rect x="26" y="-5" width="1.5" height="1.5" fill="lime"/>
            <text x="28" y="-4" font-size="1.5">Limits of Power</text>
            
        </svg>
    </xsl:template>
    
    <!-- Template to draw a slice of the pie chart -->
    <xsl:template name="draw-slice">
        <xsl:param name="start_angle"/>
        <xsl:param name="angle"/>
        <xsl:param name="color"/>
        
        <!-- Calculate end angle and path for the slice -->
        <xsl:variable name="end_angle" select="$start_angle + $angle"/>
        <!-- Convert angles to radians for path calculation -->
        <xsl:variable name="start_angle_rad" select="$start_angle * math:pi() div 180"/>
        <xsl:variable name="end_angle_rad" select="$end_angle * math:pi() div 180"/>
        
        <!-- Calculate coordinates for the arc -->
        <xsl:variable name="x1" select="16 + 16 * math:cos($start_angle_rad)"/>
        <xsl:variable name="y1" select="16 + 16 * math:sin($start_angle_rad)"/>
        <xsl:variable name="x2" select="16 + 16 * math:cos($end_angle_rad)"/>
        <xsl:variable name="y2" select="16 + 16 * math:sin($end_angle_rad)"/>
        
        <xsl:variable name="large_arc" select="if ($angle &gt; 180) then 1 else 0"/>
        
        <!-- Draw the slice -->
        <path d="M 16,16 L {$x1},{$y1} A 16,16 0 {$large_arc},1 {$x2},{$y2} z" fill="{$color}"/>
    </xsl:template>
</xsl:stylesheet>
