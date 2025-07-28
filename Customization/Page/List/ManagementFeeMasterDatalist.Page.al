page 50954 "Management Fee MasterData List"
{
    PageType = List;
    SourceTable = "Management Fee MasterData";
    ApplicationArea = All;
    Caption = 'Management Fee Master Data';
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                    ToolTip = 'Specifies the unique identifier for the vendor associated with the management fee master data.';

                    trigger OnDrillDown()
                    var
                        VendorProfile: Record "Vendor Profile";
                    begin
                        VendorProfile.SetRange("Vendor ID", Rec."Vendor ID");
                        if VendorProfile.FindSet() then
                            PAGE.RunModal(PAGE::"Vendor Profile Card", VendorProfile)
                        else
                            Message('No Vendor Profile found using FindFirst either.');
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the vendor associated with the management fee master data.';
                }
                field("Property ID"; Rec."Property ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                    ToolTip = 'Specifies the unique identifier for the property associated with the management fee master data.';

                    trigger OnDrillDown()
                    var
                        PropertyProfile: Record "Property Registration";
                    begin
                        PropertyProfile.SetRange("Property ID", Rec."Property ID");
                        if PropertyProfile.FindSet() then
                            PAGE.RunModal(PAGE::"Property Registration Card", PropertyProfile)
                        else
                            Message('No Property Registration found using FindFirst either.');
                    end;
                }
                field("Property Name"; Rec."Property Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the property associated with the management fee master data.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the start date for the management fee period.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the end date for the management fee period.';
                }
                field("Property Type"; Rec."Property Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the type of property associated with the management fee master data, such as Residential or Commercial.';
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the method used for calculating the management fee, such as Percentage or Fixed Amount.';
                }
                field("Percentage Type"; Rec."Percentage Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the type of percentage used for the management fee calculation, such as Flat Rate or Tiered.';
                }

                field("Percentage"; Rec."Percentage")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the percentage rate applied for the management fee calculation.';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the fixed amount applied for the management fee calculation.';
                }
                field("Base Amount"; Rec."Base Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the base amount used for calculating the management fee, which can be a percentage of the contract amount or a fixed amount.';
                }
                field("Frequency Of Payment"; Rec."Frequency Of Payment")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the frequency of payment for the management fee, such as Monthly, Quarterly, or Annually.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the current status of the contract associated with the management fee master data.';
                }
                field("Company ID"; Rec."Company ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unique identifier for the company associated with the management fee master data.';
                }
            }
        }
    }

}
