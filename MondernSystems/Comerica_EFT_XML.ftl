<#-- Comerica EFT XML Template Start -->
<?xml version="1.0" encoding="UTF-8"?>
<#-- CMA Request -->
<CMA>
	<BankSvcRq>
		<RqUID>00000000-0000-0000-0000-000000000001</RqUID>
		<XferAddRq>
			<RqUID>00000000-0000-0000-0000-000000000001</RqUID>
			<PmtRefId>20040211ABC20006</PmtRefId>
			<CustId>
				<SPName>Comerica</SPName>
				<CustPermId>ABCD_MNG</CustPermId>
			</CustId>
			<XferInfo>
				<DepAcctIdFrom>
				<AcctId>1234567890</AcctId>
				<AcctType>DDA</AcctType>
				<Name>Valued Customer</Name>
				<BankInfo>
					<BankIdType>BIC</BankIdType>
					<BankId>MNBDUS33</BankId> </BankInfo>
				</DepAcctIdFrom>
				<Recipients>
					<Recipient>
						<DepAcctIdTo>
							<AcctId>0987654321</AcctId>
							<AcctType>DDA</AcctType>
							<Name>Valued Customer</Name>
							<BankInfo>
								<BankIdType>ABA</BankIdType>
								<BankId>021000021</BankId>
								<Name>JP Morgan Chase</Name>
								<PostAddr>
									<Addr1>123 Main Street</Addr1>
									<Addr2>New York, NY</Addr2>
									<Country>USA</Country>
								</PostAddr>
							</BankInfo>
						</DepAcctIdTo>
						<CurAmt>
							<Amt>1000.00</Amt>
							<CurCode>USD</CurCode>
						</CurAmt>
					</Recipient>
					<BatchTotal>Total Batch</BatchTotal>
				</Recipients>
					<DueDt>2004-02-12</DueDt>
					<SendDt>M if Category is International</SendDt>
					<Category>ACH Credit</Category>
					<PmtInstruction>
						<PmtFormat>CCD</PmtFormat>
						<CompanyEntryDescription>ValuedCust</CompanyEntryDescription>
						<TransactionCode>22</TransactionCode> <#-- Checking 22:Credit 27:Debit -->
						<Desc>Addenda Information Addenda Information Addenda Information Addenda Information</Desc>
					</PmtInstruction> 
			</XferInfo>
		</XferAddRq>
	</BankSvcRq>
</CMA>
