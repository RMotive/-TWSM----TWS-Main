﻿using Foundation.Contracts.Exceptions.Bases;
using Foundation.Contracts.Modelling.Interfaces;
using Foundation.Models;

namespace Foundation.Exceptions.Modelling;
public class XGenerateModel<TScheme, TModel>
    : BException
    where TScheme : IScheme<TModel>
    where TModel : IModel {
    private readonly Type Scheme;
    private readonly List<SchemeConvertionBreakModel> Breaks;

    public XGenerateModel(List<SchemeConvertionBreakModel> breaks)
        : base("Exception converting a scheme into a model") {
        Scheme = typeof(TScheme);
        Breaks = breaks;
    }
}
