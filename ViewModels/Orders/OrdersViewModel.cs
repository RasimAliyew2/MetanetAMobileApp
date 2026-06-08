using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Sales;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels.Sales
{
    public partial class OrdersViewModel : BaseViewModel
    {
        private readonly OrdersService _ordersService;

        public ObservableCollection<OrderItem> Orders => _ordersService.Orders;

        public OrdersViewModel(OrdersService ordersService, BottomMenuState menuState)
            : base(menuState)
        {
            _ordersService = ordersService;
        }

        [RelayCommand]
        private async Task CancelOrder(OrderItem order)
        {
            if (order == null)
                return;

            if (order.Status == "Ləğv edildi")
                return;

            bool answer = await Shell.Current.DisplayAlert(
                "Sifarişin ləğvi",
                $"{order.OrderNumber} nömrəli sifarişi ləğv etmək istəyirsiniz?",
                "Bəli",
                "Xeyr");

            if (!answer)
                return;

            order.Status = "Ləğv edildi";
        }
    }
}