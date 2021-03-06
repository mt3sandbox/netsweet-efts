<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<head>
	<link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
    <style type="text/css">* {
		<#if .locale == "zh_CN">
			font-family: NotoSans, NotoSansCJKsc, sans-serif;
		<#elseif .locale == "zh_TW">
			font-family: NotoSans, NotoSansCJKtc, sans-serif;
		<#elseif .locale == "ja_JP">
			font-family: NotoSans, NotoSansCJKjp, sans-serif;
		<#elseif .locale == "ko_KR">
			font-family: NotoSans, NotoSansCJKkr, sans-serif;
		<#elseif .locale == "th_TH">
			font-family: NotoSans, NotoSansThai, sans-serif;
		<#else>
			font-family: NotoSans, sans-serif;
		</#if>
		}
        .check table, .voucher1 table, .voucher2 table {
            position: relative;
            overflow: hidden;
            font-size: 8pt;
            padding: 0;
        }
		td p { align:left }
</style>
</head>
<body padding="0in 0in 0in 0in" size="Letter">
    <#list records as check>
<div style="position: relative;font-family: Helvetica,sans-serif;top: 0pt;font-size: 8pt;">

  <table style="position: absolute;overflow: hidden;left: 1in;top: 2in;height: 13pt;width: 160pt;">
	<#if check.entity.printoncheckas?length !=0>
        <tr><td>${check.entity.printoncheckas}</td></tr>
   		<#else>
        <tr><td>${check.entity}</td></tr>
   		</#if></table>

  <table style="position: absolute;overflow: hidden;left: 5.75in;top: 2in;height: 13pt;width: 160pt;"><tr>
	<td>${check.trandate}</td>
    <td>**<#if (check.usertotal?length > 0)>${check.usertotal}<#else>${check.total}</#if></td>
	</tr></table>

</div>

<div style="position: relative;font-family: Helvetica,sans-serif;top: -11pt;height: 250pt;width: 612pt;page-break-inside: avoid;font-size: 8pt;">

<!-- <table style="position: absolute;overflow: hidden;left: 530pt;top: 3.5in;height: 7pt;width: 85pt;font-size: 12pt; letter-spacing: 2pt;"><tr>
	<td align="center">${check.checknumber}</td>
	</tr></table> -->

<table style="position: absolute;overflow: hidden;left: 5.75in;top: 5.7in;height: 18pt;width: 175pt;"><tr>
  <td>${check.trandate}</td>
  <td>**<#if (check.usertotal?length > 0)>${check.usertotal}<#else>${check.total}</#if></td>
	</tr></table>

<table style="position: absolute;overflow: hidden;left: 0.85in;top: 5.2in;height: 18pt;width: 572pt;"><tr>
	<td>${check.totalwords}*********************************************************************</td>
	</tr></table>

<table style="position: absolute;overflow: hidden;left: 0.85in;top: 5.6in;height: 18pt;width: 393pt;">
		<#if check.entity.printoncheckas?length !=0>
        <tr><td>${check.entity.printoncheckas}</td></tr>
        <tr><td>${check.address}</td></tr>
   		<#else>
        <tr><td>${check.entity}</td></tr>
        <tr><td>${check.address}</td></tr>
   		</#if>
  </table>
</div>

  <div style="position: relative;font-family: Helvetica,sans-serif;left: 0.25in;top: 4in;height: 200pt;width: 612pt;font-size: 8pt;">

<#if check.item?has_content || check.expense?has_content || check.apply?has_content>

  <table style="position: absolute;overflow: hidden;left: 36pt;top: 0pt;width: 436pt;">
    <#list check.expense as expense><tr>
      <td>${expense.account}</td>
      <td>${expense.date}</td>
      <td>${expense.description}</td>
      <td align="right">${expense.amount}</td>
      </tr>
      </#list>
    <#list check.item as item>
      <tr>
      <td>&nbsp;</td>
      <td>${item.date}</td>
      <td>${item.item}, ${item.description}</td>
      <td align="right">${item.amount}</td>
      </tr>
      </#list>

	<#if check.apply?has_content>

      <#list check.apply as apply>
          <#assign x = apply_index>
      </#list>
        <tr>
          <td border="1">Date</td>
          <td border="1">Description</td>
          <td align="right" border="1">Orig. Amt.</td>
          <td align="right" border="1">Amt. Due</td>
          <td align="right" border="1">Amount</td>
        </tr>
      <#if x lt 5>
        <#list check.apply as apply>
          <tr>
            <td border-left="1" border-right="1">${apply.applydate}</td>
            <td border-right="1">${apply.refnum}</td>
            <td border-right="1">${apply.total}</td>
            <td border-right="1">${apply.due}</td>
            <td align="right" border-right="1">${apply.amount}</td>
          </tr>
        </#list>
      <#elseif x gt 5>
        <tr>
          <td>Please refer vednor bill# ${apply.tranid} for remittance information.</td>
        </tr>
      </#if>

	</#if>

  </table>

</#if>

<!-- <table style="position: absolute;overflow: hidden;left: 473pt;top: 60pt;height: 13pt;width: 67pt;"><tr>
	<td>${check.account}</td>
	</tr></table>

<table style="position: absolute;overflow: hidden;left: 148pt;top: 60pt;height: 13pt;width: 325pt;"><tr>
	<td>${check.memo}</td>
	</tr></table>-->

</div>
</#list>

</body>
</pdf>
