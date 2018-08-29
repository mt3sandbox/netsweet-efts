<#-- format specific processing -->
<#assign totalAmount = 0>
<#assign totalPayments = 0>
<#assign recordCount = 1>

<#function computeSequenceId>
    <#assign seqId = getSequenceId(false)>
    <#if seqId == 9999>
		<#assign seqId = 1>
    <#else>
		<#assign seqId = seqId + 1>
    </#if>
    <#return seqId>
</#function>

<#function getReferenceNote payment>
    <#assign paidTransactions = transHash[payment.internalid]>
    <#if paidTransactions?size == 1>
    	<#assign transaction = paidTransactions[0]>
        <#assign tranId = transaction.tranid>
        <#if tranId?has_content>
	         <#return tranId>
	    </#if> 
    </#if>
	<#return "">
</#function>

<#assign newSeqId = computeSequenceId()>

<#-- template building -->
#OUTPUT START#
A${setPadding(recordCount,"left","0",9)}${setLength(cbank.custpage_eft_custrecord_2663_issuer_num,10)}${setPadding(newSeqId,"left","0",4)}${setPadding(pfa.custrecord_2663_file_creation_timestamp?string("yyDDD"),"left","0",6)}${setPadding(cbank.custpage_eft_custrecord_2663_processor_code,"left","0",5)}${setLength("",20)}CAD${setLength("",1406)}
<#list payments as payment>
    <#assign ebank = ebanks[payment_index]>
    <#assign entity = entities[payment_index]>
    <#assign amount = getAmount(payment)>
    <#assign totalAmount = totalAmount + amount>
    <#assign totalPayments = totalPayments + 1>
    <#assign recordCount = recordCount + 1>
C${setPadding(recordCount,"left","0",9)}${setLength(cbank.custpage_eft_custrecord_2663_issuer_num,10)}${setPadding(newSeqId,"left","0",4)}430${setPadding(formatAmount(amount),"left","0",10)}${setPadding(pfa.custrecord_2663_process_date?string("yyDDD"),"left","0",6)}${setPadding(ebank.custrecord_2663_entity_bank_no,"left","0",4)}${setPadding(ebank.custrecord_2663_entity_branch_no,"left","0",5)}${setPadding(ebank.custrecord_2663_entity_acct_no,"left","0",12)}${setPadding("","left","0",25)}${setLength(cbank.custpage_eft_custrecord_2663_statement_name,15)}${setLength(buildEntityName(entity,false),30)}${setLength(cbank.custrecord_2663_legal_name,30)}${setLength(cbank.custpage_eft_custrecord_2663_issuer_num,10)}${setLength(entity.internalid,19)}${setPadding("","left","0",9)}${setLength("",12)}${setLength(getReferenceNote(payment),15)}${setLength("",24)}${setPadding("","left","0",11)}
</#list>
Z${setPadding(recordCount + 1,"left","0",9)}${setLength(cbank.custpage_eft_custrecord_2663_issuer_num,10)}${setPadding(newSeqId,"left","0",4)}${setPadding("","left","0",22)}${setPadding(formatAmount(totalAmount),"left","0",14)}${setPadding(totalPayments,"left","0",8)}${setPadding("","left","0",1396)}<#rt>
#OUTPUT END#
#RETURN START#
sequenceId:${newSeqId}
#RETURN END#
