﻿using Foundation.Migrations.Bases;
using Foundation.Migrations.Interfaces;
using Foundation.Migrations.Validators;

namespace TWS_Business.Sets;

public partial class Truck
    : BMigrationSet
{

    protected override (string Property, IValidator[])[] Validations((string Property, IValidator[])[] Container)
    {
        UniqueValidator Unique = new();
        PointerValidator Pointer = new(true, false);
        Container = [
                .. Container,
            (nameof(Vin), [Unique, new LengthValidator(17, 17)]),
            (nameof(Motor), [Unique, new LengthValidator(15, 16)]),

        ];
        return Container;
    }

    public virtual Insurance? InsuranceNavigation { get; set; }
    public virtual Maintenance? MaintenanceNavigation { get; set; }
    public virtual Manufacturer? ManufacturerNavigation { get; set; }
    public virtual Sct? SctNavigation { get; set; }
    public virtual Situation? SituationNavigation { get; set; }


}
