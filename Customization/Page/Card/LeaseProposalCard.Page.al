page 50315 "Lease Proposal Card"
{
    PageType = Card;
    SourceTable = "Lease Proposal Details";
    ApplicationArea = All;
    Caption = 'Lease Proposal';
    Editable = true;

    layout
    {
        area(content)
        {
            group("General Information")
            {
                field("Proposal ID"; rec."Proposal ID")
                {
                    ApplicationArea = All;
                    Editable = false; // Typically auto-generated or set once
                    ToolTip = 'This is a generated field';
                }
                field("Property ID"; rec."Property ID")
                {
                    ApplicationArea = All;
                    Lookup = true; // Enable lookup for Property ID
                    ShowMandatory = true;
                    NotBlank = true;
                    ToolTip = 'Select the property for which the lease proposal is being created.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }


                field("Property Name"; rec."Property Name")
                {
                    ApplicationArea = All;
                    Caption = 'Property Name';
                    Lookup = true;
                    Editable = false;
                    ToolTip = 'This field displays the name of the property associated with the lease proposal.';
                }

                field("Praposal Type Selected"; rec."Praposal Type Selected")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Category';
                    ToolTip = 'Select the type of proposal: Single Unit or Merge Unit.';
                    trigger OnValidate()
                    begin
                        UpdateUnitEnableState();
                    end;
                }

                field("Unit ID"; rec."Unit ID")
                {
                    ApplicationArea = All;
                    Lookup = true; // Enable lookup for Unit ID
                    Enabled = EnableSingleUnit;
                    ToolTip = 'Select the Unit ID for the lease proposal. This field is mandatory for Single Unit proposals.';

                }

                field("Merge Unit ID"; Rec."Merge Unit ID")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Lookup = true; // Enable lookup for Unit ID
                    Enabled = EnableMergeUnit;
                    ToolTip = 'Select the Merge Unit ID for the lease proposal. This field is mandatory for Merge Unit proposals.';

                    trigger OnValidate()

                    begin
                        UpdateVisibility();
                    end;

                }

                field("Property Address"; rec."Unit Address")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the address of the property associated with the lease proposal.';
                }


                field("Unit Number"; Rec."Unit Number") // Custom Field
                {
                    ApplicationArea = All;
                    Caption = 'Unit Number';
                    Editable = false;
                    ToolTip = 'This field displays the unit number associated with the lease proposal.';
                }

                field("Unit Classification"; rec."Usage Type")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    Editable = false;
                    ToolTip = 'This field displays the classification of the unit, such as Residential, Commercial, etc.';
                }

                field("Unit Type"; rec."Unit Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the type of unit, such as Apartment, Office, etc.';

                }
                field("Unit Name"; Rec."Unit Name") // Custom Field
                {
                    ApplicationArea = All;
                    Caption = 'Unit Name';
                    Editable = false;
                    ToolTip = 'This field displays the name of the unit associated with the lease proposal.';
                }

                field("Single Unit Name"; Rec."Single Unit Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'This field displays the name of the single unit associated with the lease proposal. It can contain multiple lines for detailed information.';
                }
                field("Uniq Unit ID"; Rec.UnitID) // Auto-generated Unit ID
                {
                    ApplicationArea = All;
                    Caption = 'Uniq Unit ID';
                    Editable = false;
                    ToolTip = 'This field displays the unique identifier for the unit associated with the lease proposal.';
                }

                field("Base Unit of Measure"; rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'This field displays the base unit of measure for the unit associated with the lease proposal. It indicates the standard measurement unit used for the unit, such as square feet or square meters.';
                }

                field("Market Rate per Sq. Ft."; rec."Market Rate per Sq. Ft.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the market rate per square foot for the unit associated with the lease proposal.';
                }

                field("Unit Size"; rec."Unit Size")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the size of the unit in square feet.';
                }
                field("Facilities/Amenities"; rec."Facilities/Amenities")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the facilities or amenities available in the unit associated with the lease proposal.';
                }
                field("Property Size"; Rec."Property Size")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the size of the property associated with the lease proposal.';
                }
                field("Makani Number"; Rec."Makani Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the Makani number, a unique identifier for the property in Dubai.';
                }
                field(Emirate; Rec.Emirate)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the emirate where the property is located.';
                }
                field(Community; Rec.Community)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the community or locality where the property is situated.';
                }
                field("DEWA Number"; Rec."DEWA Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the Dubai Electricity and Water Authority (DEWA) number associated with the property.';
                }
            }

            group("Tenant Details")
            {

                field("Tenant ID"; rec."Tenant ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the Tenant ID for the lease proposal. This field is mandatory.';
                }
                field("Tenant Full Name"; rec."Tenant Full Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the full name of the tenant associated with the lease proposal.';
                }
                field("Tenant Contact Phone"; rec."Tenant Contact Phone")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the contact phone number of the tenant associated with the lease proposal.';
                }
                field("Tenant Contact Email"; rec."Tenant Contact Email")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the contact email address of the tenant associated with the lease proposal.';
                }

                field("Emirates ID"; rec."Emirates ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the Emirates ID of the tenant, which is a unique identification number issued by the UAE government.';
                }
                field("License No."; Rec."License No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the license number of the tenant, which is required for business entities operating in the UAE.';
                }

                field("Licensing Authority"; Rec."Licensing Authority")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the authority that issued the tenant`s license, such as the Department of Economic Development (DED) or relevant free zone authority.';
                }

                field("Legal Representative"; rec."Legal Representative")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the name of the legal representative of the tenant, who is authorized to sign contracts and agreements on behalf of the tenant.';
                }
            }

            group("Lease Terms")
            {
                field("Lease Start Date"; rec."Lease Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the start date of the lease. This field is mandatory.';
                }
                field("Lease End Date"; rec."Lease End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the end date of the lease. This field is mandatory.';
                    // Trasfer from Table Start  
                    trigger OnValidate()
                    var
                        docAttach: Page "Revenue Item Subpage Card";
                    begin
                        EvaluateLeaseDuration();
                        docAttach.SetStartEndDate(Rec."Lease Start Date", Rec."Lease End Date", Rec."Unit Name", Rec."Property Name", Rec."Unit Size", Rec."Tenant Full Name");
                    end;
                    // Trasfer from Table End
                }
                field("Lease Duration"; rec."Lease Duration")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the duration of the lease in months, calculated based on the lease start and end dates.';
                }
                field("Rent Amount"; rec."Rent Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the total annual rent amount for the lease proposal. It is calculated based on the payment frequency and other factors.';
                }
                field("Annual Rent Amount"; rec."Annual Rent Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the annual rent amount for the lease proposal. It is calculated based on the payment frequency and other factors.';
                }
                field("Rent VAT Amount"; rec."Rent VAT Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the VAT amount applicable on the rent. It is calculated based on the annual rent amount and the VAT percentage.';
                }


                field("Rent Amount VAT %"; rec."Rent Amount VAT %")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the VAT percentage applicable on the rent amount. It is used to calculate the VAT amount on the rent.';
                }

                field("Rent Amount Including VAT"; rec."Rent Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the total rent amount including VAT. It is calculated by adding the rent amount and the rent VAT amount.';
                }

                field("Payment Frequency"; rec."Payment Frequency")
                {
                    ApplicationArea = All;
                    Caption = 'Frequency of payment';
                    ToolTip = 'Select the frequency of payment for the lease proposal. This field determines how often the rent is paid, such as monthly, quarterly, half-yearly, or yearly.';

                    trigger OnValidate()
                    var
                        NoOfInstallments: Integer;
                        TotalMonths: Integer;
                    begin
                        // Calculate total months based on duration
                        if rec."Lease Duration" <> '' then
                            TotalMonths := GetTotalMonths(rec."Lease Duration")
                        else
                            TotalMonths := 0;

                        case rec."Payment Frequency" of
                            rec."Payment Frequency"::Monthly:
                                NoOfInstallments := TotalMonths;
                            rec."Payment Frequency"::Quarterly:
                                NoOfInstallments := Round(TotalMonths / 3, 1, '>');
                            rec."Payment Frequency"::"Half-Yearly":
                                NoOfInstallments := Round(TotalMonths / 6, 1, '>');
                            rec."Payment Frequency"::Yearly:
                                NoOfInstallments := Round(TotalMonths / 12, 1, '>');
                            else
                                NoOfInstallments := 0;
                        end;
                        rec."No of Installments" := NoOfInstallments;
                    end;
                }
                field("No of Installments"; rec."No of Installments")
                {
                    ApplicationArea = All;
                    Caption = 'No of Installments';
                    ToolTip = 'This field displays the number of installments for the lease proposal based on the payment frequency and lease duration. It is calculated automatically when the payment frequency is selected.';
                }
                field("Payment Method"; rec."Payment Method")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Mode';
                    ToolTip = 'Select the payment method for the lease proposal. This field determines how the rent is paid, such as bank transfer, cheque, or cash.';
                }

            }

            group("Deposit and Fees")
            {
                field("Security Deposit Amount"; rec."Security Deposit Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This field displays the security deposit amount required for the lease proposal. It is typically a percentage of the annual rent amount.';
                }

                field("Refund Conditions"; rec."Refund Conditions")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'This field displays the conditions under which the security deposit will be refunded to the tenant at the end of the lease.';
                }

            }

            group("Responsibilities")
            {
                field("Maintenance Responsibilities"; rec."Maintenance Responsibilities")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the maintenance responsibilities of the tenant and landlord as per the lease proposal.';
                }
                field("Utility Bills Responsibility"; rec."Utility Bills Responsibility")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the responsibility of the tenant and landlord for utility bills as per the lease proposal.';
                }
                field("Insurance Requirements"; rec."Insurance Requirements")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the insurance requirements of the tenant and landlord as per the lease proposal.';
                }
            }

            group("Conditions for Renewal")
            {
                field("Rent Escalation Clause"; rec."Rent Escalation Clause")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the rent escalation clause applicable for the lease proposal. It specifies how the rent will increase upon renewal of the lease.';
                }
            }

            group("Special Conditions")
            {
                field("Early Termination Conditions"; rec."Early Termination Conditions")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the conditions under which either party can terminate the lease early.';
                }
                field("Restrictions"; rec."Restrictions")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'This field displays any restrictions applicable to the lease proposal, such as subletting, alterations, or use of the property.';
                }
                field("Legal Jurisdiction"; rec."Legal Jurisdiction")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field displays the legal jurisdiction applicable to the lease proposal. It specifies the governing law and dispute resolution mechanism for the lease.';
                }

                field("Single Rent Calculation"; Rec."Single Rent Calculation")
                {
                    ApplicationArea = All;
                    Editable = Rec."Praposal Type Selected" = Rec."Praposal Type Selected"::"Single Unit";
                    ToolTip = 'Select the rent calculation method for single unit proposals. This field determines how the rent is calculated based on the unit size and other factors.';
                    trigger OnValidate()
                    begin
                        UpdateVisibility();
                    end;
                }
                field("Merge Rent Calculation"; Rec."Merge Rent Calculation")
                {
                    ApplicationArea = All;
                    Editable = Rec."Praposal Type Selected" = Rec."Praposal Type Selected"::"Merge Unit";
                    ToolTip = 'Select the rent calculation method for merge unit proposals. This field determines how the rent is calculated based on the merged units and other factors.';
                    trigger OnValidate()
                    begin
                        UpdateVisibility();
                    end;
                }

                field("Update Data"; Rec."Update Data")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                    Visible = false;
                    ToolTip = 'Click to update data in the Revenue Structure and subpages based on the lease proposal details.';
                    trigger OnDrillDown()
                    var
                        TargetRecord: Record "Revenue Structure";
                        LeaseProposal: Record "Lease Proposal Details";
                        SU_samesquare: Record "Single Unit Rent SubPage";
                        SU_lumpsum: Record "Single Lum_AnnualAmnt SubPage";
                        MU_samesquare: Record "Merge SameSqure SubPage";
                        MU_differentsquare: Record "Merge DifferentSqure SubPage";
                        MU_lumpsum: Record "Merge Lum_AnnualAmount SubPage";
                        RevenueSubpage: Record "Revenue Structure Subpage";
                        SingleUnitName: Text;
                        CommaPos: Integer;
                    begin
                        // Find the lease proposal record
                        LeaseProposal.SetRange("Proposal ID", Rec."Proposal ID");
                        if LeaseProposal.FindFirst() then begin
                            // Initialize and insert new record with data from lease proposal
                            TargetRecord.Init();
                            // TargetRecord."Proposal ID" := LeaseProposal."Proposal ID";
                            TargetRecord."Contract Start Date" := LeaseProposal."Lease Start Date";
                            TargetRecord."Contract End Date" := LeaseProposal."Lease End Date";
                            TargetRecord."Amount" := LeaseProposal."Annual Rent Amount";
                            TargetRecord."Tenant ID" := LeaseProposal."Tenant ID";
                            TargetRecord."Secondary Item Type" := 'Rent';
                            TargetRecord."VAT Amount" := LeaseProposal."Rent VAT Amount";
                            TargetRecord."Amount Including VAT" := LeaseProposal."Rent Amount Including VAT";

                            // Handle rent calculation type assignment
                            if LeaseProposal."Single Rent Calculation" = LeaseProposal."Single Rent Calculation"::"Single Unit with lumpsum square feet rate" then
                                TargetRecord."Rent Calculation Type" := Format(LeaseProposal."Single Rent Calculation")
                            else
                                if LeaseProposal."Single Rent Calculation" = LeaseProposal."Single Rent Calculation"::"Single Unit with square feet rate" then
                                    TargetRecord."Rent Calculation Type" := Format(LeaseProposal."Single Rent Calculation")
                                else
                                    if LeaseProposal."Merge Rent Calculation" = LeaseProposal."Merge Rent Calculation"::"Merged Unit with differential square feet rate" then
                                        TargetRecord."Rent Calculation Type" := Format(LeaseProposal."Merge Rent Calculation")
                                    else
                                        if LeaseProposal."Merge Rent Calculation" = LeaseProposal."Merge Rent Calculation"::"Merged Unit with lumpsum annual amount" then
                                            TargetRecord."Rent Calculation Type" := Format(LeaseProposal."Merge Rent Calculation")
                                        else
                                            if LeaseProposal."Merge Rent Calculation" = LeaseProposal."Merge Rent Calculation"::"Merged Unit with same square feet" then
                                                TargetRecord."Rent Calculation Type" := Format(LeaseProposal."Merge Rent Calculation")
                                            else
                                                Error('No valid Rent Calculation Type found in Lease Proposal.');

                            TargetRecord.Insert();

                            // Update data in Revenue Structure Subpage for Single Rent Calculation
                            if LeaseProposal."Single Rent Calculation" = LeaseProposal."Single Rent Calculation"::"Single Unit with lumpsum square feet rate" then begin
                                SU_lumpsum.SetRange("Proposal ID", LeaseProposal."Proposal ID");
                                if SU_lumpsum.FindSet() then
                                    repeat
                                        if not RevenueSubpage.Get(TargetRecord."RS ID", SU_lumpsum.SL_Year) then begin
                                            RevenueSubpage.Init();
                                            RevenueSubpage."RS ID" := TargetRecord."RS ID";
                                            RevenueSubpage.Year := SU_lumpsum.SL_Year;
                                            RevenueSubpage."Period Start Date" := SU_lumpsum."SL_Start Date";
                                            RevenueSubpage."Period End Date" := SU_lumpsum."SL_End Date";
                                            RevenueSubpage."Number of Days" := SU_lumpsum."SL_Number of Days";

                                            RevenueSubpage.Insert();
                                            Clear(RevenueSubpage);

                                        end else
                                            Message('Skipping duplicate record for RS ID=%1, Year=%2.',
                                                    TargetRecord."RS ID", SU_lumpsum.SL_Year);
                                    until SU_lumpsum.Next() = 0
                                else
                                    Error('No data found in Single Unit with lumpsum square feet rate subpage for Proposal ID %1.', LeaseProposal."Proposal ID");
                            end
                            else
                                if LeaseProposal."Single Rent Calculation" = LeaseProposal."Single Rent Calculation"::"Single Unit with square feet rate" then begin
                                    SU_samesquare.SetRange("Proposal ID", LeaseProposal."Proposal ID");
                                    if SU_samesquare.FindSet() then
                                        repeat
                                            if not RevenueSubpage.Get(TargetRecord."RS ID", SU_samesquare.Year) then begin
                                                RevenueSubpage.Init();
                                                RevenueSubpage."RS ID" := TargetRecord."RS ID";
                                                RevenueSubpage.Year := SU_samesquare.Year;
                                                RevenueSubpage."Period Start Date" := SU_samesquare."Start Date";
                                                RevenueSubpage."Period End Date" := SU_samesquare."End Date";
                                                RevenueSubpage."Number of Days" := SU_samesquare."Number of Days";

                                                RevenueSubpage.Insert();
                                                Clear(RevenueSubpage);
                                            end else
                                                Message('Skipping duplicate record for RS ID=%1, Year=%2.',
                                                        TargetRecord."RS ID", SU_samesquare.Year);
                                        until SU_samesquare.Next() = 0
                                    else
                                        Error('No data found in Single Unit with square feet rate subpage for Proposal ID %1.', LeaseProposal."Proposal ID");
                                end

                                else
                                    if LeaseProposal."Merge Rent Calculation" = LeaseProposal."Merge Rent Calculation"::"Merged Unit with differential square feet rate" then begin
                                        // Find the lease proposal record
                                        LeaseProposal.SetRange("Proposal ID", Rec."Proposal ID");
                                        if LeaseProposal.FindFirst() then begin
                                            SingleUnitName := LeaseProposal."Single Unit Name";
                                            CommaPos := StrPos(SingleUnitName, ','); // Find the position of the first comma
                                            if CommaPos > 0 then
                                                SingleUnitName := CopyStr(SingleUnitName, 1, CommaPos - 1) // Trim to the first name
                                            else
                                                SingleUnitName := SingleUnitName; // No comma, use the whole name

                                            // Find the first unit's details in Merge DifferentSquare table
                                            MU_differentsquare.SetRange("Proposal ID", LeaseProposal."Proposal ID");
                                            MU_differentsquare.SetRange("MD_Unit ID", SingleUnitName); // Filter by the first unit name
                                            if MU_differentsquare.FindSet() then
                                                repeat
                                                    // Update Revenue Structure Subpage
                                                    if not RevenueSubpage.Get(TargetRecord."RS ID", MU_differentsquare.MD_Year) then begin
                                                        RevenueSubpage.Init();
                                                        RevenueSubpage."RS ID" := TargetRecord."RS ID";
                                                        RevenueSubpage.Year := MU_differentsquare.MD_Year;
                                                        RevenueSubpage."Period Start Date" := MU_differentsquare."MD_Start Date";
                                                        RevenueSubpage."Period End Date" := MU_differentsquare."MD_End Date";
                                                        RevenueSubpage."Number of Days" := MU_differentsquare."MD_Number of Days";
                                                        RevenueSubpage.Insert();
                                                        Clear(RevenueSubpage);
                                                    end else
                                                        Message('Skipping duplicate record for RS ID=%1, Year=%2.',
                                                                TargetRecord."RS ID", MU_differentsquare.MD_Year);
                                                until MU_differentsquare.Next() = 0

                                            // Message('Revenue data successfully updated for Unit Name: %1.', SingleUnitName);
                                            else
                                                Error('No data found for Unit Name: %1 in Proposal ID: %2.', SingleUnitName, LeaseProposal."Proposal ID");
                                        end
                                        else
                                            Error('Lease Proposal not found for Proposal ID: %1.', Rec."Proposal ID");
                                    end

                                    else
                                        if LeaseProposal."Merge Rent Calculation" = LeaseProposal."Merge Rent Calculation"::"Merged Unit with lumpsum annual amount" then begin
                                            MU_lumpsum.SetRange("Proposal ID", LeaseProposal."Proposal ID");
                                            if MU_lumpsum.FindSet() then
                                                repeat
                                                    if not RevenueSubpage.Get(TargetRecord."RS ID", MU_lumpsum.ML_Year) then begin
                                                        RevenueSubpage.Init();
                                                        RevenueSubpage."RS ID" := TargetRecord."RS ID";
                                                        RevenueSubpage.Year := MU_lumpsum.ML_Year;
                                                        RevenueSubpage."Period Start Date" := MU_lumpsum."ML_Start Date";
                                                        RevenueSubpage."Period End Date" := MU_lumpsum."ML_End Date";
                                                        RevenueSubpage."Number of Days" := MU_lumpsum."ML_Number of Days";
                                                        RevenueSubpage.Insert();
                                                        Clear(RevenueSubpage);
                                                    end else
                                                        Message('Skipping duplicate record for RS ID=%1, Year=%2.',
                                                                TargetRecord."RS ID", MU_lumpsum.ML_Year);
                                                until MU_lumpsum.Next() = 0
                                            else
                                                Error('No data found in Merged Unit with lumpsum annual amount subpage for Proposal ID %1.', LeaseProposal."Proposal ID");
                                        end
                                        else
                                            if LeaseProposal."Merge Rent Calculation" = LeaseProposal."Merge Rent Calculation"::"Merged Unit with same square feet" then begin
                                                MU_samesquare.SetRange("Proposal ID", LeaseProposal."Proposal ID");
                                                if MU_samesquare.FindSet() then
                                                    repeat
                                                        if not RevenueSubpage.Get(TargetRecord."RS ID", MU_samesquare.MS_Year) then begin
                                                            RevenueSubpage.Init();
                                                            RevenueSubpage."RS ID" := TargetRecord."RS ID";
                                                            RevenueSubpage.Year := MU_samesquare.MS_Year;
                                                            RevenueSubpage."Period Start Date" := MU_samesquare."MS_Start Date";
                                                            RevenueSubpage."Period End Date" := MU_samesquare."MS_End Date";

                                                            RevenueSubpage."Number of Days" := MU_samesquare."MS_Number of Days";
                                                            RevenueSubpage.Insert();
                                                            Clear(RevenueSubpage);
                                                        end else
                                                            Message('Skipping duplicate record for RS ID=%1, Year=%2.',
                                                                    TargetRecord."RS ID", MU_samesquare.MS_Year);
                                                    until MU_samesquare.Next() = 0
                                                else
                                                    Error('No data found in Merged Unit with same square feet subpage for Proposal ID %1.', LeaseProposal."Proposal ID");
                                            end;

                            Message('New record has been created in Revenue Structure and subpage updated successfully.');
                        end else
                            Error('Lease Proposal not found for Proposal ID %1.', Rec."Proposal ID");
                    end;
                }

            }

            group("Single Unit with lumpsum square feet rate")
            {
                Caption = 'Single Unit with lumpsum square feet rate';
                Visible = ShowLegalReasonFields3;

                part("Single Unit lumpsum Rent"; "Single Lum_AnnualAmnt SubPage")
                {
                    SubPageLink = "Proposal ID" = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }
            }

            group("Single Unit with square feet rate")
            {
                Caption = 'Single Unit With Square Feet Rate';
                Visible = ShowLegalReasonFields;

                part("Single Unit Rent"; "Single Unit Rent SubPage")
                {
                    SubPageLink = "Proposal ID" = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }

            }
            group("Merged Unit with same square feet")
            {
                Caption = 'Merged Unit With Same Square Feet';
                Visible = ShowBusinessReasonFields;
                part("Merge SameSqure Rent"; "Merge SameSqure SubPage")
                {
                    SubPageLink = "Proposal ID" = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }
            }
            group("Merged Unit with differential square feet rate")
            {
                Caption = 'Merged Unit With Differential Square Feet Rate';
                Visible = ShowLegalReasonFields1;
                part("Merge DifferentSqure Rent"; "Merge DifferentSqure SubPage")
                {
                    SubPageLink = "Proposal ID" = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }
            }
            group("Merged Unit with lumpsum annual amount")
            {
                Caption = 'Merged Unit With Lumpsum Annual Amount';
                Visible = ShowBusinessReasonFields2;
                part("Merge Lum_AnnualAmount Rent"; "Merge Lum_AnnualAmount SubPage")
                {
                    SubPageLink = "Proposal ID" = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }
            }

            group("Per Day Rent for Revenue Allocation")
            {
                Caption = 'Per Day Rent for Revenue Allocation';
                part("Per Day Rent for Revenue"; "Per Day Rent for Revenue Card")
                {
                    SubPageLink = "Proposal Id" = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                    Visible = Rec."Praposal Type Selected" = Rec."Praposal Type Selected"::"Merge Unit"; // Visible when "Praposal Type Selected" is "Merge Unit"
                }
            }

            group("Lease Unit Details")
            {
                Caption = 'Unit Details';
                part("Unit all Details"; "Sub Lease Merged Units Card")
                {
                    SubPageLink = "Merge Unit ID" = FIELD("Merge Unit ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                    Visible = Rec."Praposal Type Selected" = Rec."Praposal Type Selected"::"Merge Unit"; // Visible when "Praposal Type Selected" is "Merge Unit"
                }
            }

            group("Other Payments")
            {
                part("Revenue"; "Revenue Item SubPage Card")
                {
                    SubPageLink = ProposalID = FIELD("Proposal ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }
            }

            group("Proposal Status")  // Add a separate group for clarity
            {
                field("ProposalStatus"; Rec."Proposal Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Proposal Status';
                }
            }

            group("WorkflowFrequencys")
            {
                Visible = false;
                part("Workflow Frequency"; "Workflow Frequency PR Card")
                {
                    SubPageLink = "Property ID" = FIELD("Property ID"); // Link to filter attachments for this owner only
                    ApplicationArea = All;
                }
            }

            field("Is any Broker Involved?"; Rec."Is any Broker Involved?")
            {
                ApplicationArea = All;
                ToolTip = 'Indicates whether any broker is involved in the lease proposal. If true, broker details will be displayed.';
            }

            group("Brokers and Commission Agent Details")
            {
                Visible = Rec."Is any Broker Involved?";

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Vendor ID';

                    // Trasfer from Table Start  
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        VendorProfileRec: Record "Vendor Profile";
                        MonthlyRent: Decimal;
                        Percentageamt: Integer;

                    begin
                        VendorProfileRec.SetRange("Vendor Category", 'Brokers and Commission Agent');
                        VendorProfileRec.SetRange("Contract Status", Rec."Contract Status"::"Active"); // 👈 Add this line
                        if Page.RunModal(Page::"Vendor Profile List", VendorProfileRec) = Action::LookupOK then begin
                            Rec."Vendor ID" := VendorProfileRec."Vendor ID";
                            Rec."Vendor Name" := VendorProfileRec."Vendor Name";
                            Rec."Start Date" := VendorProfileRec."Start Date";
                            Rec."End Date" := VendorProfileRec."End Date";
                            Rec."Contract Status" := VendorProfileRec."Contract Status";
                            Rec."Calculation Method" := VendorProfileRec."Calculation Method";
                            Rec."Percentage Type" := VendorProfileRec."Percentage Type";
                            Rec."Base Amount Type" := VendorProfileRec."Base Amount Type";
                            Rec."Frequency Of Payment" := VendorProfileRec."Frequency Of Payment";
                            Rec.Percentage := VendorProfileRec.Percentage;

                            Percentageamt := Rec."Percentage"; // used for calculations

                            case UpperCase(Rec."Calculation Method") of
                                'FIXED AMOUNT':
                                    // Do nothing – amount is manually entered
                                    Rec."Amount" := VendorProfileRec."Amount";

                                'STANDARD RATE':
                                    if Rec."Base Amount Type" = Rec."Base Amount Type"::"Monthly Rent" then begin
                                        MonthlyRent := Rec."Rent Amount";
                                        Rec."Amount" := Round(MonthlyRent / 12, 0.01); // 2 decimal rounding
                                    end;


                                'PERCENTAGE BASED':
                                    if Rec."Base Amount Type" = Rec."Base Amount Type"::"Annual Rent" then begin
                                        MonthlyRent := Rec."Rent Amount";
                                        // Percentage := "Percentage";
                                        Rec."Amount" := Round((MonthlyRent * Percentageamt) / 100, 0.01);
                                    end;

                            end;


                        end else begin
                            Rec."Vendor ID" := '';
                            Rec."Vendor Name" := '';
                            Rec."Start Date" := 0D;
                            Rec."End Date" := 0D;
                            Rec."Contract Status" := Rec."Contract Status"::" ";
                            Rec."Calculation Method" := ' ';
                            Rec."Percentage Type" := Rec."Percentage Type"::" ";
                            Rec.Percentage := 0;
                            Rec.Amount := 0;
                            Rec."Base Amount Type" := Rec."Base Amount Type"::" ";
                            Rec."Frequency Of Payment" := Rec."Frequency Of Payment"::" ";
                        end;
                    end;
                    // Trasfer from Table End
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Vendor Name';
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Start Date';
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'End Date';
                }

                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Calculation Method';
                }

                field("Percentage Type"; Rec."Percentage Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Percentage Type';
                }

                field("Percentage"; Rec."Percentage")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Percentage';
                }

                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Amount';
                }
                field("Base Amount Type"; Rec."Base Amount Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Base Amount Type';
                }
                field("Frequency Of Payment"; Rec."Frequency Of Payment")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Frequency Of Payment';
                }

                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Contract Status';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Save")
            {
                Caption = 'Save';
                ApplicationArea = All;
                Image = Save;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Save';
                trigger OnAction()
                begin
                    Rec.Modify(true);
                end;
            }
        }

        area(Reporting)
        {
            group(Report)
            {
                Caption = 'Report';
                action("Run Report")
                {
                    ToolTip = 'Run the proposal report for the selected lease proposal.';
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        LeasePrposal: Record "Lease Proposal Details";
                        ReportRequest: Report "Proposal Report";
                    begin
                        Commit();

                        LeasePrposal.SetRange("Proposal ID", Rec."Proposal ID");

                        ReportRequest.SetTableView(LeasePrposal);
                        ReportRequest.Run();
                    end;
                }
            }
        }
    }


    var
        EnableSingleUnit: Boolean;
        EnableMergeUnit: Boolean;

    // Update the enable logic based on "Proposal Type Selected"
    trigger OnAfterGetRecord()
    begin
        CurrPage."Revenue".Page.SetProposalId(Rec."Proposal ID");
        CurrPage."Revenue".Page.SetStartEndDate(Rec."Lease Start Date", Rec."Lease End Date", Rec."Unit Name", Rec."Property Name", Rec."Unit Size", Rec."Tenant Full Name");
        CurrPage."Revenue".Page.SetTenantID(Rec."Tenant ID");

        CurrPage."Single Unit Rent".Page.Update();
        CurrPage."Merge SameSqure Rent".Page.Update();

        CurrPage."Merge Lum_AnnualAmount Rent".Page.Update();
        CurrPage."Single Unit lumpsum Rent".Page.Update();

    end;

    // Function to update enabled state of Unit fields
    local procedure UpdateUnitEnableState()
    begin
        case Rec."Praposal Type Selected" of
            Rec."Praposal Type Selected"::"Single Unit":
                begin
                    EnableSingleUnit := true;
                    EnableMergeUnit := false;
                end;
            Rec."Praposal Type Selected"::"Merge Unit":
                begin
                    EnableSingleUnit := false;
                    EnableMergeUnit := true;
                end;
            else
                EnableSingleUnit := false; // Keep Single Unit enabled by default
                EnableMergeUnit := false;
        end;
        CurrPage.Update(); // Refresh the page to apply changes
    end;

    var

    trigger OnModifyRecord(): Boolean
    begin
        CurrPage."Revenue".Page.SetProposalId(Rec."Proposal ID");
        CurrPage."Revenue".Page.SetStartEndDate(Rec."Lease Start Date", Rec."Lease End Date", Rec."Unit Name", Rec."Property Name", Rec."Unit Size", Rec."Tenant Full Name");
        CurrPage."Revenue".Page.SetTenantID(Rec."Tenant ID");

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // Trasfer from Table Start
    var
        docAttach: Page "Revenue Item Subpage Card";
    // Trasfer from Table End
    begin
        CurrPage."Revenue".Page.SetProposalId(Rec."Proposal ID");
        CurrPage."Revenue".Page.SetStartEndDate(Rec."Lease Start Date", Rec."Lease End Date", Rec."Unit Name", Rec."Property Name", Rec."Unit Size", Rec."Tenant Full Name");
        CurrPage."Revenue".Page.SetTenantID(Rec."Tenant ID");

        // Trasfer from Table Start
        docAttach.SetProposalID(Rec."Proposal ID");
        // Trasfer from Table End
    end;


    var
        ShowLegalReasonFields: Boolean;
        ShowBusinessReasonFields: Boolean;
        ShowLegalReasonFields1: Boolean;
        ShowBusinessReasonFields2: Boolean;
        ShowLegalReasonFields3: Boolean;
        ShowLegalReasonFields4: Boolean;

    trigger OnOpenPage()
    begin
        UpdateVisibility();
    end;

    // Procedure to update visibility dynamically
    procedure UpdateVisibility()
    begin
        ShowLegalReasonFields := (Rec."Single Rent Calculation" = Rec."Single Rent Calculation"::"Single Unit with square feet rate");
        ShowBusinessReasonFields := (Rec."Merge Rent Calculation" = Rec."Merge Rent Calculation"::"Merged Unit with same square feet");
        ShowLegalReasonFields1 := (Rec."Merge Rent Calculation" = Rec."Merge Rent Calculation"::"Merged Unit with differential square feet rate");
        ShowBusinessReasonFields2 := (Rec."Merge Rent Calculation" = Rec."Merge Rent Calculation"::"Merged Unit with lumpsum annual amount");
        ShowLegalReasonFields3 := (Rec."Single Rent Calculation" = Rec."Single Rent Calculation"::"Single Unit with lumpsum square feet rate");
        ShowLegalReasonFields4 := (Rec."Praposal Type Selected" = Rec."Praposal Type Selected"::"Merge Unit");
    end;

    var

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var

        RecRef: RecordRef;
        xRecRef: RecordRef;
        IsNewUnmodified: Boolean;
    begin
        // Get record references
        RecRef.GetTable(Rec);
        xRecRef.GetTable(xRec);

        // Check if this is a new unmodified record by comparing current and previous state
        IsNewUnmodified := (RecRef.Count = 0) or (Format(Rec) = Format(xRec));

        // If it's a new unmodified record and user is trying to close/cancel
        if IsNewUnmodified and (CloseAction = ACTION::Cancel) then
            exit(true); // Allow closing without validation

        // For all other cases (modified records or OK action)
        if CloseAction = ACTION::OK then
            if not IsNewUnmodified then  // Only validate if the record has been modified
                Rec.TestField("Property ID");

        exit(true);
    end;

    local procedure GetTotalMonths(Duration: Text): Integer
    var
        Years: Integer;
        YearPos: Integer;
        YearStr: Text;
    begin
        YearPos := StrPos(Duration, 'year');

        if YearPos > 0 then begin
            YearStr := CopyStr(Duration, 1, YearPos - 1);
            Evaluate(Years, DelChr(YearStr, '<>')); // Remove spaces
        end;

        // Convert years to months
        exit(Years * 12);
    end;



    // Trasfer from Table Start
    //-------------Calculate Lease Duration--------------//
    procedure EvaluateLeaseDuration()
    var
        FetchMonth: Codeunit "Fetch Month";
        LeaseStartDate: Date;
        LeaseEndDate: Date;
        Years: Integer;
        Months: Integer;
        Days: Integer;
        DurationText: Text[50];
        TempStartDate: Date;
        DaysDifference: Integer;
        daysInMonth: Integer;
    begin
        LeaseStartDate := Rec."Lease Start Date";
        LeaseEndDate := Rec."Lease End Date";

        if (LeaseStartDate <> 0D) and (LeaseEndDate <> 0D) then begin
            if LeaseEndDate >= LeaseStartDate then begin
                // Calculate total days difference
                DaysDifference := LeaseEndDate - LeaseStartDate + 1;

                // If the difference is exactly 365 or 366 days (accounting for leap year)
                if (DaysDifference = 365) or (DaysDifference = 366) then begin
                    Years := 1;
                    Months := 0;
                    Days := 0;
                end else begin
                    TempStartDate := LeaseStartDate;

                    // Calculate the years
                    Years := 0;
                    while (CALCDATE('<+1Y>', TempStartDate) <= LeaseEndDate) or
                          (CALCDATE('<+1Y-1D>', TempStartDate) = LeaseEndDate) do begin
                        TempStartDate := CALCDATE('<+1Y>', TempStartDate);
                        Years := Years + 1;
                    end;

                    // Calculate the months
                    Months := 0;
                    while CALCDATE('<+1M>', TempStartDate) <= LeaseEndDate do begin
                        TempStartDate := CALCDATE('<+1M>', TempStartDate);
                        Months := Months + 1;
                    end;

                    // Calculate the remaining days
                    Days := LeaseEndDate - TempStartDate + 1;

                    if Days >= 28 then begin
                        daysInMonth := FetchMonth.GetNoofDaysInMonth(Date2DMY(TempStartDate, 2), Date2DMY(TempStartDate, 3));
                        if Days = daysInMonth then begin
                            Months := Months + 1;
                            Days := 0;
                        end
                        else
                            if Days > daysInMonth then begin
                                Months := Months + 1;
                                Days := Days - daysInMonth;
                            end;
                    end;

                    if Months = 12 then begin
                        Years := Years + 1;
                        Months := 0;
                    end
                    else
                        if Months > 12 then begin
                            Years := Years + (Months div 12);
                            Months := Months mod 12;
                        end;
                end;

                DurationText := '';
                if Years > 0 then
                    DurationText := Format(Years) + ' year(s) ';

                if Months > 0 then
                    DurationText := CopyStr(DurationText, 1, StrLen(DurationText)) + Format(Months) + ' month(s) ';

                if Days > 0 then
                    DurationText := CopyStr(DurationText, 1, StrLen(DurationText)) + Format(Days) + ' day(s)';

                Rec."Lease Duration" := DelChr(DurationText, '<>', ' ');
            end else
                Rec."Lease Duration" := '';
        end else
            Rec."Lease Duration" := '';
    end;

}
