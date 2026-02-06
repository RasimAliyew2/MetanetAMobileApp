using System.Collections.ObjectModel;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels
{
    public partial class ProductPreSelectedViewModel : BaseViewModel
    {
        public ObservableCollection<ProductTypeItem> ProductTypes { get; } = new();

        public ProductPreSelectedViewModel(BottomMenuState menuState) : base(menuState)
        {
            ProductTypes.Add(new ProductTypeItem { Title = "Tip 1", ImageSource = "product_type1" });
            ProductTypes.Add(new ProductTypeItem { Title = "Tip 2", ImageSource = "product_type2" });
            ProductTypes.Add(new ProductTypeItem { Title = "Tip 3", ImageSource = "product_type3" });
            ProductTypes.Add(new ProductTypeItem { Title = "Tip 4", ImageSource = "product_type4" });
        }

        [RelayCommand]
        private async Task OpenProducts(ProductTypeItem selectedType)
        {
            // Hansına basılırsa basılsın ProductPage açılır ✅
            // BottomMenu selection düzgün işləsin deyə BaseViewModel-in Products() metodundan istifadə edirik.
            await Products();
        }
    }

    public class ProductTypeItem
    {
        public string Title { get; set; }
        public string ImageSource { get; set; }
    }
}
