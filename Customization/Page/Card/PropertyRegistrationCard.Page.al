page 50305 "Property Registration Card"
{
    PageType = Card;
    SourceTable = "Property Registration";
    ApplicationArea = All;
    Caption = 'Property Registration';
    // UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Property Details';


                field("Property ID"; rec."Property ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unique identifier for the property.';
                }

                field("Company ID"; rec."Company ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the company associated with the property.';

                    trigger OnValidate()
                    begin
                        InsertWorkflowFrquencyData();
                    end;
                }


                field("Property Name"; rec."Property Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the property.';

                    trigger OnValidate()
                    begin
                        InsertWorkflowFrquencyData();
                    end;
                }


                field("Base Unit of Measure"; rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the base unit of measure for the property.';

                    trigger OnValidate()
                    begin
                        InsertWorkflowFrquencyData();
                    end;
                }
                field("Property Size"; rec."Property Size")
                {
                    ApplicationArea = All;
                    Caption = 'Property Size';
                    Editable = true;
                    ToolTip = 'Specifies the size of the property in square feet or square meters.';
                }

                field("Market Rate per Sq. Ft."; rec."Market Rate per Sq. Ft.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the market rate per square foot for the property.';
                }

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the address of the property.';
                }
                field("Built-up Area"; Rec."Built-up Area")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the built-up area of the property in square feet or square meters.';
                }
                field("Makani Number"; Rec."Makani Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Makani number for the property, which is a unique identifier for properties in Dubai.';
                }
                field("Municipality Number"; Rec."Municipality Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the municipality number for the property, which is used for official identification.';
                }
                field("DEWA Number"; Rec."DEWA Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the DEWA number for the property, which is a unique identifier for properties in Dubai.';
                }
                field("Number of Floors"; Rec."Number of Floors")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of floors in the property.';
                }
                field("Number of Lifts"; Rec."Number of Lifts")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of lifts in the property.';
                }

            }


            group("Additional Details")
            {
                Caption = 'Additional Information';

                field("Emirate"; rec.Emirate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the emirate where the property is located.';
                }
                field("Community"; rec."Community")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the community or neighborhood where the property is located.';
                }

                field("Number of Units"; rec."Number of Units")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of units in the property.';
                }

                field("Property Classification"; rec."Property Classification")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the classification of the property, such as residential, commercial, or industrial.';
                }

                field("Property Type"; rec."Property Type")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the type of property, such as apartment, villa, office, or retail.';
                }

                field("Registration Date"; rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the property was registered.';
                }

                field("GTIN"; rec."GTIN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Global Trade Item Number (GTIN) for the property, which is a unique identifier used in international trade.';
                }

                field("Owner ID"; rec."Owner ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the unique identifier for the owner of the property.';
                }
            }
            group(Documents)
            {

                // Add the Document Attachment Subpage here
                part("Document Attachments"; "Property Registration SubPage")
                {
                    SubPageLink = PropertyID = FIELD("Property ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                    Visible = isVisible;
                }
            }

            group("WorkflowFrequencys")
            {
                Caption = 'List of Workflow Frequency';
                part("Workflow Frequency"; "Workflow Frequency PR Card")
                {
                    SubPageLink = "Company ID" = FIELD("Company ID"),
                    "Property ID" = FIELD("Property ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;

                }
            }

            group("VendorDetails")
            {
                Caption = 'Management Vendor Details';

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the unique identifier for the vendor managing the property.';
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the vendor managing the property.';
                }

                field("Vendor Contact No."; Rec."Vendor Contact No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the contact number of the vendor managing the property.';
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the start date of the contract with the vendor managing the property.';
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the end date of the contract with the vendor managing the property.';
                }

                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the current status of the contract with the vendor managing the property.';
                }

                field("Vendor Category"; Rec."Vendor Category")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the category of the vendor managing the property, such as maintenance, cleaning, or security.';
                }

                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies whether the property is privacy blocked, preventing any public access to its details.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the last date when the property details were modified.';
                }
                field("Document Sending Profile"; Rec."Document Sending Profile")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the document sending profile associated with the property, which defines how documents are sent to the vendor.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the search name for the property, which is used for quick identification in searches.';
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the intercompany partner code for the property, which is used for transactions between companies.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the purchaser code for the property, which is used for identifying the purchaser in transactions.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the responsibility center for the property, which is used for financial reporting and management.';
                }
                field("Disable Search by Name"; Rec."Disable Search by Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies whether the property should be excluded from search results by name.';
                }
                field("Company Size Code"; Rec."Company Size Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the company size code for the property, which is used for categorizing properties based on their size.';
                }

                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies whether the property is blocked for transactions. If this field is set to Yes, the property cannot be used in any transactions.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the balance amount in local currency (LCY) for the property. This field is used to track the financial status of the property.';
                }

                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the balance due amount in local currency (LCY) for the property. This field is used to track the outstanding balance of the property.';
                }

                group(" ")
                {

                    field("Calculation Method"; Rec."Calculation Method")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the method used for calculating amounts related to the property, such as fixed, percentage, or variable.';
                    }

                    field("Percentage Type"; Rec."Percentage Type")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the type of percentage used for calculations related to the property, such as flat rate or tiered percentage.';
                    }

                    field("Percentage"; Rec."Percentage")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the percentage value used for calculations related to the property.';
                    }

                    field("Amount"; Rec."Amount")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the amount used for calculations related to the property.';
                    }
                    field("Base Amount"; Rec."Base Amount")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the base amount used for calculations related to the property.';
                    }

                    field("Frequency Of Payment"; Rec."Frequency Of Payment")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the frequency of payment for the property, such as monthly, quarterly, or annually.';
                    }
                }
            }
        }
    }


    var
        isVisible: Boolean;

    trigger OnModifyRecord(): Boolean
    begin
        CurrPage."Document Attachments".Page.SetPropertyId(Rec."Property ID");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CurrPage."Document Attachments".Page.SetPropertyId(Rec."Property ID");
        isVisible := true;
    end;

    trigger OnAfterGetRecord()
    begin
        CurrPage."Document Attachments".Page.SetPropertyId(Rec."Property ID");

        if Rec."Property ID" <> '' then
            isVisible := true
        else
            isVisible := false;
    end;

    procedure InsertWorkflowFrquencyData()
    var
        workflowfrequency: Record "Workflow Frequency";
        workflowfrequencyPR: Record "Workflow Frequency PR";
    begin
        workflowfrequencyPR.SetRange("Property ID", Rec."Property ID");
        workflowfrequencyPR.SetRange("Company ID", Rec."Company ID");

        if workflowfrequencyPR.FindSet() then
            workflowfrequencyPR.DeleteAll();


        if workflowfrequency.FindSet() then
            repeat
                workflowfrequencyPR.Init();

                workflowfrequencyPR."Property ID" := Rec."Property ID";
                workflowfrequencyPR."Company ID" := workflowfrequency."Company ID";
                workflowfrequencyPR.Workflow := workflowfrequency.Workflow;
                workflowfrequencyPR."frequncy Status" := workflowfrequency."frequncy Status";
                workflowfrequencyPR."No. of Days" := workflowfrequency."No. of Days";
                workflowfrequencyPR.Insert();
                Clear(workflowfrequencyPR);
            until workflowfrequency.Next() = 0;
    end;
}

