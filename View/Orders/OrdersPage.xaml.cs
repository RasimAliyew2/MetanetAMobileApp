using MetanetA_MobileApp.ViewModels.Sales;

namespace MetanetA_MobileApp.View.Orders;

public partial class OrdersPage : ContentPage
{
    public OrdersPage(OrdersViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }
}