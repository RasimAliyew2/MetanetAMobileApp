using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Products;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

public partial class ProductParentSection : ObservableObject
{
    private readonly IReadOnlyList<ProductApiItem> _sourceProducts;

    public ProductParentSection(
        string name,
        IReadOnlyList<ProductApiItem> sourceProducts)
    {
        Name = name;
        _sourceProducts = sourceProducts;
    }

    public string Name { get; }

    public string IconSource => "product.png";

    public int ProductCount => _sourceProducts.Count;

    public ObservableCollection<ProductItem> Products { get; } = new();

    [ObservableProperty]
    private bool isExpanded;

    [ObservableProperty]
    private bool isMaterialized;

    public void EnsureProductsMaterialized()
    {
        if (IsMaterialized)
            return;

        foreach (var source in _sourceProducts
                     .OrderBy(
                         item => ProductMapper.NormalizeText(item.Name),
                         StringComparer.CurrentCultureIgnoreCase))
        {
            Products.Add(ProductMapper.ToProductItem(source));
        }

        IsMaterialized = true;
    }
}
