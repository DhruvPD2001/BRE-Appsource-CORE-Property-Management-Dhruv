page 50907 "Secondary Item List"
{
    PageType = List;
    SourceTable = "Secondary Item";
    ApplicationArea = All;
    Caption = 'Secondary Item List';
    UsageCategory = Lists;
    CardPageId = 50908;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    Caption = 'ID';
                    ToolTip = 'Specifies the unique identifier for the secondary item.';
                }
                field("Primary Item Type"; Rec."Primary Item Type")
                {
                    ApplicationArea = All;
                    Caption = 'Primary Item';
                    TableRelation = "Primary Item";
                    // Display the Primary Classification description
                    Lookup = true; // Enable lookup to Primary Classification
                    ToolTip = 'Specifies the primary item type associated with this secondary item.';
                }
                field("Category Types"; Rec."Category Types")
                {
                    ApplicationArea = All;
                    Caption = 'Category Types';
                    TableRelation = "Category Type";
                    ToolTip = 'Specifies the category types associated with this secondary item.';
                }

                field("Secondary Item Type"; Rec."Secondary Item Type")
                {
                    ApplicationArea = All;
                    Caption = 'Secondary Item Type';
                    ToolTip = 'Specifies the type of secondary item associated with this record.';
                }

                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = All;
                    Caption = 'VAT %';
                    ToolTip = 'Specifies the VAT percentage applicable to this secondary item.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
#pragma warning disable AW0005
#pragma warning disable AW0011
            action(New)
#pragma warning restore AW0011
#pragma warning restore AW0005
            {
                ApplicationArea = All;
                Caption = 'New';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create a new secondary item record.';
                trigger OnAction()
                begin
                    Rec.Init();
                    Rec.Insert(true);
                    CurrPage.Update();
                end;
            }
        }
    }


}
