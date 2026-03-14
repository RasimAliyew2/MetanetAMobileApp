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
            allGifts.Add(new GiftItem { Name = "BYD Seal 05, 1.5 L, 2025", Price = 1000000, ImageUrl = "gift1.jpg" });
            allGifts.Add(new GiftItem { Name = "iPhone 17 Pro Max 256 GB", Price = 250000, ImageUrl = "gift2.jpg" });
            allGifts.Add(new GiftItem { Name = "iPhone 17 Pro 256 GB", Price = 230000, ImageUrl = "gift3.jpg" });
            allGifts.Add(new GiftItem { Name = "Samsung Galaxy S25 12/256 GB Silver", Price = 220000, ImageUrl = "gift4.jpg" });
            allGifts.Add(new GiftItem { Name = "Samsung Galaxy A56 8/128 GB Green", Price = 200000, ImageUrl = "gift5.jpg" });
            allGifts.Add(new GiftItem { Name = "Samsung Galaxy A16 4GB/128GB", Price = 180000, ImageUrl = "gift6.jpg" });
            allGifts.Add(new GiftItem { Name = "Honor 400 8GB/256GB", Price = 150000, ImageUrl = "gift7.jpg" });
            allGifts.Add(new GiftItem { Name = "HONOR 400 Pro 12 GB / 256 GB", Price = 170000, ImageUrl = "gift8.jpg" });
            allGifts.Add(new GiftItem { Name = "Xiaomi Redmi Note 15 6GB/128GB", Price = 150000, ImageUrl = "gift9.jpg" });
            allGifts.Add(new GiftItem { Name = "Notbuk Apple MacBook Air 13 M1 Space Gray", Price = 180000, ImageUrl = "gift10.jpg" });
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
