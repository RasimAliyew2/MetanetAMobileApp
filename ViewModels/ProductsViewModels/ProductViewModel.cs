// ViewModels/ProductsViewModels/ProductViewModel.cs (REPLACE)
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

[QueryProperty(nameof(CategoryKey), "CategoryKey")]

public partial class ProductViewModel : BaseViewModel
{
    public ObservableCollection<ProductSubCategorySection> SubCategories { get; } = new();

    [ObservableProperty]
    private string categoryKey;
    [ObservableProperty] private string selectedRootCategoryTitle = "Kateqori.ya seçin";

    public ProductViewModel(BottomMenuState menuState) : base(menuState)
    {
        // İstəsən burada default bir kateqoriya da aça bilərsən:
       // LoadRootCategory("INSAAT");
    }

    partial void OnCategoryKeyChanged(string value)
    {
        if (string.IsNullOrWhiteSpace(value))
            return;

        LoadRootCategory(value); // sənin mövcud metodun
    }
    public void LoadRootCategory(string key)
    {
        SubCategories.Clear();

        if (string.IsNullOrWhiteSpace(key) || !ProductCatalog.Data.TryGetValue(key, out var data))
        {
            SelectedRootCategoryTitle = "Kateqoriya seçin";
            return;
        }

        SelectedRootCategoryTitle = data.Title;

        // Demo üçün: hər alt kateqoriyaya 2 məhsul əlavə edirəm.
        // Sonradan bunu API-dən gələn real məhsullarla əvəz edəcəksən.
        var rnd = new Random();

     //   sec.Products.Add(new ProductItem
     //   {
     //       Name = $"\"MATANAT A\" HYBRID keramika yapışdırıcısı (boz)",
     //       Description = data.Title,
     //       ImageUrl = "pic5.png",
     //       Price = 25
     //   });
      //  SubCategories.Add(new ProductSubCategorySection("İnşaat sistemləri")) { Products.Ad};

        foreach (var subName in data.SubCategories)
        {
            var sec = new ProductSubCategorySection(subName);

            // Demo products
            sec.Products.Add(new ProductItem
            {
                Name = $"{subName} - Məhsul 1",
                Description = data.Title,
                ImageUrl = "product.png",
                Price = 25
            });

            sec.Products.Add(new ProductItem
            {
                Name = $"{subName} - Məhsul 2",
                Description = data.Title,
                ImageUrl = "product.png",
                Price = 20
            });

            SubCategories.Add(sec);
        }
    }

    [RelayCommand]
    private void ToggleSubCategory(ProductSubCategorySection section)
    {
        if (section == null) return;

        // istəyirsənsə: birini açanda digərlərini bağla
        foreach (var s in SubCategories.Where(x => x != section))
            s.IsExpanded = false;

        section.IsExpanded = !section.IsExpanded;
    }

    [RelayCommand]
    private async Task SelectProductAsync(ProductItem item)
    {
        if (item == null) return;

        // Hazırda “seçmək” üçün sadəcə məlumat göstərir.
        // Sonra buradan ProductDetailPage və ya səbətə əlavə et logikası qoşa bilərsən.
        await Application.Current.MainPage.DisplayAlert(
            "Məhsul",
            $"{item.Name}\nQiymət: {item.Price:0.##} ₼",
            "OK");
    }
}
