using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using CommunityToolkit.Mvvm.ComponentModel;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels.GiftsViewModels
{
    public partial class GiftsViewModel : BaseViewModel
    {
        // UI kolleksiya (filtrlənmiş)
        public ObservableCollection<GiftItem> Gifts { get; } = new();

        // Orijinal siyahı
        private readonly List<GiftItem> allGifts = new();

        [ObservableProperty]
        private GiftItem selectedGift;

        [ObservableProperty]
        private string searchText;

        public GiftsViewModel(BottomMenuState menuState) : base(menuState)
        {
            // demo data (özün URL-ləri sonra ViewModel-dən dəyişərsən)
            allGifts.Add(new GiftItem { Name = "Termos", Price = 25, ImageUrl = "termos.png" });
            //allGifts.Add(new GiftItem { Name = "Maşın", Price = 1000, ImageUrl = "product.png" });
            //allGifts.Add(new GiftItem { Name = "Smart Saat", Price = 120, ImageUrl = "product.png" });
            //allGifts.Add(new GiftItem { Name = "Bluetooth qulaqcıq", Price = 65, ImageUrl = "product.png" });

            ApplyFilter();
        }

        partial void OnSelectedGiftChanged(GiftItem value)
        {
            if (value is null)
                return;

            _ = OpenDetailsAsync(value);

            // eyni gift-i yenidən seçmək üçün
            SelectedGift = null;
        }

        partial void OnSearchTextChanged(string value)
        {
            ApplyFilter();
        }

        private void ApplyFilter()
        {
            var q = (SearchText ?? "").Trim();

            IEnumerable<GiftItem> filtered = allGifts;

            if (!string.IsNullOrWhiteSpace(q))
            {
                filtered = allGifts.Where(x =>
                    !string.IsNullOrWhiteSpace(x.Name) &&
                    x.Name.Contains(q, StringComparison.OrdinalIgnoreCase));
            }

            Gifts.Clear();
            foreach (var item in filtered)
                Gifts.Add(item);
        }

        private async System.Threading.Tasks.Task OpenDetailsAsync(GiftItem gift)
        {
            await Shell.Current.GoToAsync("//GiftDetailPage", new Dictionary<string, object>
            {
                ["Gift"] = gift
            });
        }
    }
}
