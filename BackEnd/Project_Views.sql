--test 
USE [PROJECTS]
GO
/****** Object:  View [dbo].[PROJECT_MATERIAL_PO]    Script Date: 31/07/2021 9:20:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[PROJECT_MATERIAL_PO_ORDER_DETAILS] as Select Rowid, PoNo, PoDate, Indent_NO, Supplier, Supplier_COde, OrdeR_No + '-' + Proj_ACtivity_Name OrdeR_No, Party, Sum(Order_Qty_Conv) Order_Qty, Rate_Conv Pur_Rate, Sum(Cancel_Qty_Conv) Cancel_Qty, Grs_Rate_Conv Grs_Rate, Tax_Per, Freight_Rate_Conv Freight_Rate, Sum(Grs_Amount_Dtl) Grs_Amount_Dtl, Sum(Tax_Amount_Dtl) Tax_Amount_Dtl, Sum(Freight_Amount_Dtl) Freight_Amount_Dtl, Sum(Pur_Amount) Pur_Amount,  Item, Color, Size, Rate_Conv Rate  from Project_PO_Details_Fn() Where RowID = 129 Group by Rowid, PoNo, PoDate, Indent_NO, Supplier, Supplier_COde, Pur_Rate, Grs_Rate_Conv, Tax_Per, Freight_Rate_Conv, Item, Color, Size, Rate_Conv, ORder_No, PArty, Proj_ACtivity_NAme 
GO
/****** Object:  View [dbo].[ProjectPO_Indent_Pending_Items_All_Grid_View]    Script Date: 31/07/2021 9:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ProjectPO_Indent_Pending_Items_All_Grid_View] as            
  sElect ORdeR_NO, Proj_Activity_Name, Proj_Type, Proj_Activity_id, PRoj_Type_Id, ITEM, COLOR, SIZE, UOM, Sum(Bom_Qty) BOM, Sum(Ordered_Qty) ORDERED, Sum(Po_Qty) PO_QTY, Min(GRS_RATE) GRS_RATE, Min(TAX_PER) TAX_PER, Min(FREIGHT_RATE) FREIGHT_RATE, Min(Rate) PUR_RATE,             
  0.0000 RO_RATE, Sum(Grs_Amount) GRS_AMT, Sum(Tax_Amount) TAX_AMT, Sum(Freight_Amount) FREI_AMT, Sum(Pur_amount) PUR_AMT, UOMID,               ITEM_ID, COLOR_ID, SIZE_ID, 
  OrdeR_NO + '-' + CAst(Proj_Type_ID as Varchar(20)) + '-' + Cast(Proj_Activity_ID as Varchar(20)) + '-' + Cast(ITEM_ID as Varchar(20)) + '-' + Cast(COLOR_ID as Varchar(20)) + '-' + Cast(SIZE_ID as Varchar(20)) DESCRIPTION, 
  OrdeR_NO + '-' + CAst(Proj_Type_ID as Varchar(20)) + '-' + Cast(Proj_Activity_ID as Varchar(20)) + '-' + Cast(ITEM_ID as Varchar(20)) + '-' + Cast(COLOR_ID as Varchar(20)) + '-' + Cast(SIZE_ID as Varchar(20)) DESC2,  UOM UOM1, UOMID UOMID1,    
  1.000 CONV_VAL, 0.000 BOM_ORG, 0.000 ORDERED_ORG, 0.000 BAL_ORG, 0.000 PO_QTY_ORG,             
  Min(Cast((GRS_RATE) as Numeric(22,4))) APP_GRS_ORG, 0.0 APP_TAX_ORG, Min(Cast((FREIGHT_RATE) as Numeric(22,4))) APP_FREI_ORG, Min(Cast((RATE) as Numeric(22,4))) APP_PUR_RATE_ORG, 0.000 PO_QTY_ORG_CONV, 0.0000 APP_GRS_ORG_CONV, 0.0000 APP_FREI_ORG_CONV, 
  0.0000 APP_PUR_RATE_ORG_CONV, 0.000 BAL, 0.0000 APP_GRS, 0.0 APP_TAX, 0.0000 APP_FREI, 0.0000 APP_PUR_RATE, 0.0000 TAX_RATE, 'B' TAX_MODE, 0.00 RO_AMT, 0.000 PO_QTY_CONV, 0.0000 GRS_RATE_CONV, 0.0000 TAX_RATE_CONV, 0.0000 FREI_RATE_CONV, 0.0000 PUR_RATE_CONV,           
  0.00 GRS_AMT_INR, 0.00 TAX_AMT_INR, 0.00 FREI_AMT_INR, 0.00 PUR_AMT_INR, Min(App_Sup_Ex_Rate) App_Sup_Ex_Rate, '-' REMARKS, RNo,  OrdeR_Id, Party_Code, Party               
  FRom [ProjectPO_Indent_Pending_Items_All]()                  
  --Where RNo =1
  --Where Ccno = 304140 and model_Code = 1000037 and ITem_code = 2606685
  Group by PRoj_Activity_Name, Proj_Activity_ID, Proj_Type, Proj_Type_ID,  ITEM, COLOR, SIZE, UOM, ITEM_ID, COLOR_ID, SIZE_ID, UomId, ORdeR_NO, RNo,OrdeR_Id, Party_Code, Party
  Having Sum(Po_Qty) >0 


GO
/****** Object:  View [dbo].[ProjectPO_Pending_Items_All_Grid_View]    Script Date: 31/07/2021 9:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[ProjectPO_Pending_Items_All_Grid_View] as            
  sElect ORdeR_NO, Proj_Activity_Name, Proj_Type, Proj_Activity_id, PRoj_Type_Id, ITEM, COLOR, SIZE, UOM, Sum(Bom_Qty) BOM, Sum(Ordered_Qty) ORDERED, Sum(Po_Qty) PO_QTY, Min(GRS_RATE) GRS_RATE, Min(TAX_PER) TAX_PER, Min(FREIGHT_RATE) FREIGHT_RATE, Min(Rate) PUR_RATE,             
  0.0000 RO_RATE, Sum(Grs_Amount) GRS_AMT, Sum(Tax_Amount) TAX_AMT, Sum(Freight_Amount) FREI_AMT, Sum(Pur_amount) PUR_AMT, UOMID,               ITEM_ID, COLOR_ID, SIZE_ID, 
  OrdeR_NO + '-' + CAst(Proj_Type_ID as Varchar(20)) + '-' + Cast(Proj_Activity_ID as Varchar(20)) + '-' + Cast(ITEM_ID as Varchar(20)) + '-' + Cast(COLOR_ID as Varchar(20)) + '-' + Cast(SIZE_ID as Varchar(20)) DESCRIPTION, 
  OrdeR_NO + '-' + CAst(Proj_Type_ID as Varchar(20)) + '-' + Cast(Proj_Activity_ID as Varchar(20)) + '-' + Cast(ITEM_ID as Varchar(20)) + '-' + Cast(COLOR_ID as Varchar(20)) + '-' + Cast(SIZE_ID as Varchar(20)) DESC2,  UOM UOM1, UOMID UOMID1,    
  1.000 CONV_VAL, 0.000 BOM_ORG, 0.000 ORDERED_ORG, 0.000 BAL_ORG, 0.000 PO_QTY_ORG,             
  Min(Cast((GRS_RATE) as Numeric(22,4))) APP_GRS_ORG, 0.0 APP_TAX_ORG, Min(Cast((FREIGHT_RATE) as Numeric(22,4))) APP_FREI_ORG, Min(Cast((RATE) as Numeric(22,4))) APP_PUR_RATE_ORG, 0.000 PO_QTY_ORG_CONV, 0.0000 APP_GRS_ORG_CONV, 0.0000 APP_FREI_ORG_CONV,           
  0.0000 APP_PUR_RATE_ORG_CONV, 0.000 BAL, 0.0000 APP_GRS, 0.0 APP_TAX, 0.0000 APP_FREI, 0.0000 APP_PUR_RATE, 0.0000 TAX_RATE, 'B' TAX_MODE, 0.00 RO_AMT, 0.000 PO_QTY_CONV, 0.0000 GRS_RATE_CONV, 0.0000 TAX_RATE_CONV, 0.0000 FREI_RATE_CONV, 0.0000 PUR_RATE_CONV,           
  0.00 GRS_AMT_INR, 0.00 TAX_AMT_INR, 0.00 FREI_AMT_INR, 0.00 PUR_AMT_INR, Min(App_Sup_Ex_Rate) App_Sup_Ex_Rate, '-' REMARKS, RNo,  OrdeR_Id, Party_Code, Party               
  FRom [ProjectPO_Pending_Items_All]()                  
  --Where RNo =1
  --Where Ccno = 304140 and model_Code = 1000037 and ITem_code = 2606685
  Group by PRoj_Activity_Name, Proj_Activity_ID, Proj_Type, Proj_Type_ID,  ITEM, COLOR, SIZE, UOM, ITEM_ID, COLOR_ID, SIZE_ID, UomId, ORdeR_NO, RNo,OrdeR_Id, Party_Code, Party
  Having Sum(Po_Qty) >0 

GO
/****** Object:  View [dbo].[SOCKS_PURCHASE_INV]    Script Date: 31/07/2021 9:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[SOCKS_PURCHASE_INV] as Select Top 100000000 ROW_NUMBER()Over(Order By I1.Item + ' - ' + C1.color + ' - ' + S4.Size)SlNo, I1.Item + ' - ' + C1.color + ' - ' + S4.Size Item_Color_Size, Sum(S2.Bill_Qty) Order_Qty,  S2.Bill_Rate Rate,S2.Tax_Per,  (Sum(S2.Bill_Gross)- Sum(TaX_Amount)) Bill_GRoss, Sum(TaX_Amount) TaX_Amount , Sum(S2.Bill_Gross) Amount, S1.Rate_Debit, S1.Qty_Debit, S1.To_Be_paid  From Project_GRN_Invoicing_Master S1 Inner join Project_GRN_Invoicing_Details S2 ON S1.RowID = S2.Master_ID  Inner join Item I1 on S2.Item_id = I1.itemid Inner join color C1 on s2.Color_id = c1.colorid  Inner join size S4 on s2.Size_ID = S4.sizeid Where S1.RowID = 30507  Group by I1.Item, C1.color, S4.Size, S2.Bill_Rate  , S2.Tax_PEr, S1.Rate_Debit, S1.Qty_Debit, S1.To_Be_paid  Order By I1.Item + ' - ' + C1.color + ' - ' + S4.Size 
GO
/****** Object:  View [dbo].[VEHICLE_BOOKING_GOODS_RPT]    Script Date: 31/07/2021 9:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[VEHICLE_BOOKING_GOODS_RPT] as Select Distinct A.EntryNo , A.BookNO , A.BookDate , A.BookTime , A.FromAdd , A.ToAdd , A.No_OF_Item , A.Total_Qty , A.Total_Weight , A.Total_Box , A.No_Of_Box, A.CBM, A.Total_Cbm , A.Name , A.TNo , A.CompNAme ,  A.Remarks , A.Btype , A.EntryDate , A.OrderNo , Isnull(Replace(Convert(Varchar(15),A.ShipDate,106),' ','-'),'-') ShipDate , A.OrderQty , A.Weight , A.BookQty , A.Item  , A.ApprovalStatus , A.Approve , IsNUll(A.FrmLedger_Name,'-')FrmLedger_Name,Isnull(A.FrmLedger_Address,'-')FrmLedger_Address,Isnull(A.ToLedger_Name,'-')ToLedger_Name,Isnull(A.ToLedger_Address,'-')ToLedger_Address, convert( varchar(10), GETDAte(), 101) + stuff( right( convert( varchar(26), GETDAte(), 109 ), 15 ), 7, 7, ' ') PrintDate  From VAAHINI_ERP_GAINUP.dbo.Vehicle_Booking_Goods_FOr_Send_Mail() A Where A.BookNO=12666

GO
/****** Object:  View [dbo].[YARN_GOODS_RECEIPT]    Script Date: 31/07/2021 9:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[YARN_GOODS_RECEIPT] as select ITem + ' ' + Color + ' ' + Size PArticulars, Grn_Qty, Grs_Rate Rate, Tax_Per, Pur_Rate , Grs_Amount_Dtl Amount, Tax_Amount_Dtl, Net_Amount from Project_Grn_Item_DEtails_Fn() Where RowID = 10237 
GO
