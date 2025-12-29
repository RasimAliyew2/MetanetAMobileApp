using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using Microsoft.Maui.Controls;          // Shell və s. üçün (lazım olacaq)
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Gifts;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;          // GiftDetailPage varsa

namespace MetanetA_MobileApp.ViewModels
{

    public partial class GiftsViewModel : ObservableObject
    {
        public ObservableCollection<GiftItem> Gifts { get; }

        private GiftItem selectedGift;
        public GiftItem SelectedGift
        {
            get => selectedGift;
            set
            {
                if (SetProperty(ref selectedGift, value))
                {
                    OnSelectedGiftChanged();
                }
            }
        }

        private async void OnSelectedGiftChanged()
        {
            if (SelectedGift is null)
                return;

            await Shell.Current.GoToAsync("//GiftDetailPage", new Dictionary<string, object>
            {
                { "Gift", SelectedGift }
            });
        }

        public GiftsViewModel(IGiftItem currentItem)
        {

            Gifts = new ObservableCollection<GiftItem>
            {
                new GiftItem { Name = "Termos", Price = 25, ImageUrl = "product.png" },
                new GiftItem { Name = "Maşın", Price = 1000, ImageUrl = "product.png" }
            };
        }

        // BU metodu özün yazırsan – seçilən item dəyişəndə avtomatik çağırılacaq
  
    }
}
