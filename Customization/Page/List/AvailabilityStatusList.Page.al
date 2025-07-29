page 50308 "Availability Status List"
{
    PageType = List;
    SourceTable = "Availability Status";
    ApplicationArea = All;
    Caption = 'Availability Status List';
    UsageCategory = Lists;
    CardPageId = 50307;

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
                    ToolTip = 'Unique identifier for the availability status.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Caption = 'Status Name';
                    ToolTip = 'Name of the availability status.';
                }
            }
        }
    }

}
